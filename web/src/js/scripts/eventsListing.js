const eventsListing = document.querySelector('.js-events-listing');
const eventsItems = document.querySelectorAll('.js-event-item');

if (eventsListing && eventsItems) {
	const eventsCategories = document.querySelectorAll('.js-events-listing-category');
	if (eventsCategories) {
		eventsCategories.forEach(category => {
			category.addEventListener('click', () => {
				if (!category.classList.contains('is-active')) {
					eventsCategories.forEach(categoryDeeper => {
						categoryDeeper.classList.remove('is-active');
					});
					category.classList.add('is-active');
				}
			});
		});
	}
	const eventsTopics = document.querySelectorAll('.js-events-listing-topic');
	const eventsCurrentTopic = document.querySelector('.js-events-listing-current-topic');
	if (eventsTopics) {
		eventsTopics.forEach(category => {
			category.addEventListener('click', () => {
				if (category.dataset.url === 'all') {
					eventsCurrentTopic.querySelector('.text').innerText = 'Topic';
				} else {
					eventsCurrentTopic.querySelector('.text').innerText = category.querySelector('.text').innerText;
				}
			});
		});
	}
}
