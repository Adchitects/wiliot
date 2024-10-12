console.log('newsListing script loaded');

const newsListing = document.querySelector('.js-news-listing-hld');
const newsItems = document.querySelectorAll('.js-news-listing-item');

if (newsListing && newsItems) {
	const maxItems = newsListing.dataset.count ? parseInt(newsListing.dataset.count, 10) : false;
	const noResults = document.querySelector('.js-events-listing-no-results');
	const showMoreBtnHld = document.querySelector('.js-more-events-btn-hld');
	const showMoreBtn = document.querySelector('.js-more-events-btn');

	const checkItems = (showMore = false) => {
		let visibleCount = 0;
		let totalVisible = 0;

		newsItems.forEach((item, index) => {
			const checkCategory = newsListing.dataset.category === 'all' || newsListing.dataset.category === item.dataset.category;
			const checkTopic = newsListing.dataset.topic === 'all' || (item.dataset.topics && item.dataset.topics.split(',').includes(newsListing.dataset.topic));

			if (checkCategory && checkTopic) {
				totalVisible++;
				if (!maxItems || showMore || visibleCount < maxItems) {
					item.dataset.show = 'true';
					visibleCount++;
				} else {
					item.dataset.show = 'false';
				}
			} else {
				item.dataset.show = 'false';
			}
		});

		if (showMoreBtnHld) {
			if (showMore || !maxItems || visibleCount < totalVisible) {
				showMoreBtnHld.classList.remove('is-disabled');
			} else {
				showMoreBtnHld.classList.add('is-disabled');
			}
		}

		if (noResults) {
			if (visibleCount === 0) {
				noResults.classList.add('is-active');
			} else {
				noResults.classList.remove('is-active');
			}
		}
	};
	const newsCategories = document.querySelectorAll('.js-events-listing-category');
	if (newsCategories) {
		const setActiveCategory = (category) => {
			newsCategories.forEach(cat => cat.classList.remove('is-active'));
			category.classList.add('is-active');
			newsListing.dataset.category = category.dataset.id;
			checkItems();
		};

		const currentHash = window.location.hash.replace('#', '');
		const decodedHash = decodeURIComponent(currentHash);

		let categorySet = false;
		newsCategories.forEach(category => {
			const categoryTitle = category.dataset.title.toLowerCase().replace(/\s+/g, '-');
			if (categoryTitle === decodedHash) {
				setActiveCategory(category);
				categorySet = true;
			}

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

		if (!categorySet) {
			const allCategory = Array.from(newsCategories).find(cat => cat.dataset.id === 'all');
			if (allCategory) {
				setActiveCategory(allCategory);
			}
		}
	}

	const newsTopicsSelect = document.querySelector('.js-news-listing-topics-select');
	if (newsTopicsSelect) {
		newsTopicsSelect.addEventListener('change', () => {
			newsListing.dataset.topic = newsTopicsSelect.value;
			checkItems();
		});
	}

	// Set initial topic value if not already set
	if (!newsListing.dataset.topic) {
		newsListing.dataset.topic = 'all';
	}

	// Initial check
	checkItems();

	if (maxItems && showMoreBtnHld && showMoreBtn) {
		showMoreBtn.addEventListener('click', () => {
			checkItems(true);
		});
	}

	// Ensure the "All" category is active after a short delay
	setTimeout(() => {
		const allCategory = Array.from(newsCategories).find(cat => cat.dataset.id === 'all');
		if (allCategory && !allCategory.classList.contains('is-active')) {
			allCategory.classList.add('is-active');
		}
	}, 100);
}
