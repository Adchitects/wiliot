import gsap from 'gsap';
import ScrollToPlugin from 'gsap/ScrollToPlugin';
gsap.registerPlugin(ScrollToPlugin);

const searchResults = document.querySelector('.js-search-results');
const searchResultsFilters = document.querySelectorAll('.js-search-results-filter');
const searchResultsTitle = document.querySelector('.js-search-results-title');
const searchResultsItems = document.querySelectorAll('.js-search-results-item');
const searchResultsMoreBtnHld = document.querySelector('.js-search-results-more-btn-hld');
const searchResultsMoreBtn = document.querySelector('.js-search-results-more-btn');

if (searchResults && searchResultsFilters && searchResultsTitle && searchResultsItems && searchResultsMoreBtnHld && searchResultsMoreBtn) {
	searchResultsFilters.forEach(filter => {
		filter.addEventListener('click', () => {
			// change active state on filters
			searchResultsFilters.forEach(item => {
				item.classList.remove('is-active');
			});
			filter.classList.add('is-active');

			// hide all items, then show the ones from chosen category, and hide more than 6 visible
			let activeIndex = 0;
			searchResultsItems.forEach((resultItem, index) => {
				resultItem.classList.remove('is-capped');
				resultItem.classList.add('is-totally-hidden');
				if (resultItem.dataset.id === filter.dataset.id || filter.dataset.id === 'all') {
					resultItem.classList.remove('is-totally-hidden');
					activeIndex++;
				}
				if (activeIndex > 6) {
					resultItem.classList.add('is-capped');
				}
			});

			if (activeIndex > 6) {
				searchResultsMoreBtnHld.classList.add('is-visible');
			}

			// change title text
			searchResultsTitle.textContent = activeIndex.toString() + ' ' + (activeIndex > 1 ? 'results' : 'result') + ' for "' + searchResultsTitle.dataset.query + '"' + (filter.dataset.id !== 'all' ? ' in ' + filter.dataset.categoryName : '');

			// scroll to top
			gsap.to(window, {
				duration: 0,
				scrollTo: {
					y: 0,
				},
			});
		});
	});

	// show more than 6 items
	searchResultsMoreBtn.addEventListener('click', () => {
		searchResultsMoreBtnHld.classList.remove('is-visible');
		searchResultsItems.forEach(item => {
			item.classList.remove('is-capped');
		});
	});
}
