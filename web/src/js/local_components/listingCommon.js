console.log('listingCommon script loaded');

export function initializeListing(options) {
	const {
		listingSelector,
		itemSelector,
		noResultsSelector,
		showMoreBtnHldSelector,
		showMoreBtnSelector,
		categorySelector,
		topicSelector,
		listingType,
	} = options;

	const listing = document.querySelector(listingSelector);
	const items = document.querySelectorAll(itemSelector);

	if (listing && items.length > 0) {
		const maxItems = listing.dataset.count ? parseInt(listing.dataset.count, 10) : false;
		const noResults = document.querySelector(noResultsSelector);
		const showMoreBtnHld = document.querySelector(showMoreBtnHldSelector);
		const showMoreBtn = document.querySelector(showMoreBtnSelector);

		let currentShowCount = maxItems || false;

		const checkItems = (showMore = false) => {
			console.log(`${listingType}: checkItems called with showMore = ${showMore}`);

			if (showMore) {
				if (currentShowCount) {
					currentShowCount += maxItems;
				} else {
					currentShowCount = maxItems;
				}
				console.log(`${listingType}: Incremented currentShowCount to ${currentShowCount}`);
			} else {
				currentShowCount = maxItems;
				console.log(`${listingType}: Reset currentShowCount to ${currentShowCount}`);
			}

			let visibleCount = 0;
			let totalVisible = 0;
			let shownItems = [];

			items.forEach((item) => {
				const itemCategory = item.dataset.category || 'all';
				const itemTopics = item.dataset.topics ? item.dataset.topics.split(',') : ['all'];

				const selectedCategory = listing.dataset.category || 'all';
				const selectedTopic = listing.dataset.topic || 'all';

				const checkCategory = selectedCategory === 'all' || selectedCategory === itemCategory;
				const checkTopic = selectedTopic === 'all' || itemTopics.includes(selectedTopic);

				if (checkCategory && checkTopic) {
					totalVisible++;
					if (!currentShowCount || visibleCount < currentShowCount) {
						item.dataset.show = 'true';
						visibleCount++;
						shownItems.push({
							id: item.dataset.id,
							title: item.querySelector('.event-item__title').textContent,
							dataShow: item.dataset.show,
						});
					} else {
						item.dataset.show = 'false';
					}
				} else {
					item.dataset.show = 'false';
				}
			});

			console.log(`${listingType}: Total Visible Items: ${totalVisible}, Currently Shown: ${visibleCount}`);
			console.log(`${listingType}: Currently shown items:`, shownItems);

			if (showMoreBtnHld) {
				if (!currentShowCount || visibleCount < totalVisible) {
					showMoreBtnHld.classList.remove('is-disabled');
					console.log(`${listingType}: "Load More" button enabled`);
				} else {
					showMoreBtnHld.classList.add('is-disabled');
					console.log(`${listingType}: "Load More" button disabled`);
				}
			}

			if (noResults) {
				if (visibleCount === 0) {
					noResults.classList.add('is-active');
					console.log(`${listingType}: No results to display`);
				} else {
					noResults.classList.remove('is-active');
					console.log(`${listingType}: Displaying ${visibleCount} items`);
				}
			}
		};

		const initializeCategories = () => {
			const categories = document.querySelectorAll(categorySelector);
			if (categories) {
				const setActiveCategory = (category) => {
					categories.forEach(cat => cat.classList.remove('is-active'));
					category.classList.add('is-active');
					listing.dataset.category = category.dataset.id;
					checkItems();
				};

				categories.forEach(category => {
					category.addEventListener('click', () => {
						if (!category.classList.contains('is-active')) {
							setActiveCategory(category);
							if (category.dataset.title !== 'all') {
								const formattedTitle = category.dataset.title.toLowerCase().replace(/\s+/g, '-');
								const newUrl = `${window.location.pathname}#${encodeURIComponent(formattedTitle)}`;
								window.history.pushState({ path: newUrl }, '', newUrl);
							} else {
								window.history.pushState({ path: window.location.pathname }, '', window.location.pathname);
							}
						}
					});
				});

				// Set initial category based on URL hash
				const currentHash = window.location.hash.replace('#', '');
				const decodedHash = decodeURIComponent(currentHash);
				let categorySet = false;
				categories.forEach(category => {
					const categoryTitle = category.dataset.title.toLowerCase().replace(/\s+/g, '-');
					if (categoryTitle === decodedHash) {
						setActiveCategory(category);
						categorySet = true;
					}
				});

				if (!categorySet) {
					const allCategory = Array.from(categories).find(cat => cat.dataset.id === 'all');
					if (allCategory) {
						setActiveCategory(allCategory);
					}
				}
			}
		};

		const initializeTopics = () => {
			const topicsElement = document.querySelector(topicSelector);
			const currentTopicElement = document.querySelector('.js-common-listing-current-topic');

			if (topicsElement) {
				const topicElements = document.querySelectorAll(`${topicSelector} .js-common-listing-topic`);
				topicElements.forEach(topic => {
					topic.addEventListener('click', () => {
						topicElements.forEach(t => t.classList.remove('is-active'));
						topic.classList.add('is-active');
						listing.dataset.topic = topic.dataset.id;

						// Update the current topic text
						if (currentTopicElement) {
							const topicText = topic.querySelector('.text').textContent;
							currentTopicElement.textContent = topic.dataset.id === 'all' ? 'Select a Topic' : topicText;
						}

						checkItems();
					});
				});
			}

			// Set initial topic value if not already set
			if (!listing.dataset.topic) {
				listing.dataset.topic = 'all';
				if (currentTopicElement) {
					currentTopicElement.textContent = 'Select a Topic';
				}
			}
		};

		// Initial check
		checkItems();

		if (maxItems && showMoreBtnHld && showMoreBtn) {
			console.log(`${listingType}: showMoreBtnHld and showMoreBtn found, adding click event listener`);
			showMoreBtn.addEventListener('click', () => {
				checkItems(true);
			});
		}

		initializeCategories();
		initializeTopics();
	}
}
