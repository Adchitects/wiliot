console.log('eventsListing script loaded');

const eventsListing = document.querySelector('.js-events-listing');
const eventsItems = document.querySelectorAll('.js-event-item');
if (eventsListing && eventsItems) {
	const maxItems = eventsListing.dataset.count ? eventsListing.dataset.count : false;
	const noResults = document.querySelector('.js-events-listing-no-results');
	const showMoreBtnHld = document.querySelector('.js-more-events-btn-hld');
	const showMoreBtn = document.querySelector('.js-more-events-btn');
	const checkItems = (showMore = false) => {
		let currentIndex = 0;
		eventsItems.forEach(item => {
			let checkCategory = false;
			if (eventsListing.dataset.category === 'all' || eventsListing.dataset.category === item.dataset.category) {
				checkCategory = true;
			}
			let checkTopic = false;
			if (eventsListing.dataset.topic === 'all' || eventsListing.dataset.topic === item.dataset.topic) {
				checkTopic = true;
			}
			if (checkCategory && checkTopic) {
				if (maxItems && !showMore) {
					if (currentIndex < maxItems) {
						item.dataset.show = true;
					} else {
						item.dataset.show = false;
					}
					currentIndex++;
				} else {
					item.dataset.show = true;
				}
			} else {
				item.dataset.show = false;
			}
		});
		if (showMore) {
			if (showMoreBtnHld) {
				showMoreBtnHld.classList.add('is-disabled');
			}
		} else {
			if (maxItems && currentIndex > maxItems) {
				if (showMoreBtnHld) {
					showMoreBtnHld.classList.remove('is-disabled');
				}
			} else {
				if (showMoreBtnHld) {
					showMoreBtnHld.classList.add('is-disabled');
				}
			}
		}
		if (currentIndex === 0 && !showMore) {
			noResults.classList.add('is-active');
		} else {
			noResults.classList.remove('is-active');
		}
	};
	const currentHash = window.location.hash.replace('#', '');
	const decodedHash = decodeURIComponent(currentHash);
	eventsListing.classList.add('is-active');
	if (decodedHash) {
		const eventsCategoriesAll = document.querySelectorAll('.js-events-listing-category');
		eventsCategoriesAll.forEach(category => {
			const categoryTitle = category.dataset.title.toLowerCase().replace(/\s+/g, '-');
			if (categoryTitle === decodedHash) {
				category.classList.add('is-active');
				eventsListing.dataset.category = category.dataset.id;
				checkItems();
			} else {
				category.classList.remove('is-active');
			}
		});
	}
	const eventsCategoriesAll = document.querySelectorAll('.js-events-listing-category');
	if (eventsCategoriesAll) {
		eventsCategoriesAll.forEach(category => {
			category.addEventListener('click', () => {
				if (!category.classList.contains('is-active')) {
					eventsCategoriesAll.forEach(categoryDeeper => {
						categoryDeeper.classList.remove('is-active');
					});
					category.classList.add('is-active');
					eventsListing.dataset.category = category.dataset.id;
					checkItems();
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
	}
	const eventsTopics = document.querySelectorAll('.js-events-listing-topic');
	const eventsCurrentTopic = document.querySelector('.js-events-listing-current-topic');
	if (eventsTopics) {
		eventsTopics.forEach(topic => {
			topic.addEventListener('click', () => {
				eventsTopics.forEach(topicDeeper => {
					topicDeeper.classList.remove('is-active');
				});
				topic.classList.add('is-active');
				if (topic.dataset.url === 'all') {
					eventsCurrentTopic.querySelector('.text').innerText = 'Topic';
				} else {
					eventsCurrentTopic.querySelector('.text').innerText = topic.querySelector('.text').innerText;
				}
				eventsListing.dataset.topic = topic.dataset.id;
				checkItems();
			});
		});
	}

	if (maxItems && showMoreBtnHld && showMoreBtn) {
		checkItems();
		showMoreBtn.addEventListener('click', () => {
			checkItems(true);
		});
	}
}
