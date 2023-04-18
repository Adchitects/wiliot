/* eslint-disable */
const ajax = require('simple-ajax-vanilla');
/* eslint-enable */
import { lazyLoadInstance } from '../libs/lazyLoad';

const searchHldAll = document.querySelectorAll('.js-search-form-hld');
searchHldAll.forEach(hld => {
	const input  = hld.querySelector('.js-search-form-input, .js-algolia-form-input');
	if (input) {
		input.addEventListener('input', () => {
			if (input.value !== '') {
				hld.classList.add('is-active');
			} else {
				hld.classList.remove('is-active');
			}
		});
	}
});

const searchCountAll = document.querySelectorAll('.js-search-count-hld');
searchCountAll.forEach(countHld => {
	const input = countHld.querySelector('.js-search-count-input');
	const output = countHld.querySelector('.js-search-count-output');
	if (input && output) {
		output.innerHTML = input.value;
	}
});

// news page ajax search
const searchNewsInput = document.querySelector('.js-search-news-input');
const searchNewsListing = document.querySelector('.js-news-listing');

if (searchNewsInput && searchNewsListing) {
	let typingTimer;
	const processAjax = (searchValue) => {
		searchNewsListing.classList.add('is-loading');

		ajax(searchNewsListing.dataset.initialUrl + '?news_q=' + searchValue, {
			success: (response) => {
				const loadedContent = response.response;
				let tempContent = document.createElement('div');
				tempContent.innerHTML = loadedContent;
				const interestingContent = tempContent.querySelector('.js-news-listing').innerHTML;
				searchNewsListing.innerHTML = interestingContent;
				searchNewsListing.classList.remove('is-loading');
				// refresh images
				lazyLoadInstance.update();
				// change count
				document.querySelector('.js-search-count-output').innerHTML = document.querySelector('.js-search-count-input').value;
				// "deactivate" filters
				document.querySelectorAll('.news-listing__filter').forEach(item => {
					item.classList.remove('is-active');
				});
				// remove button
				const moreBtn = searchNewsListing.querySelector('.js-load-more-btn');
				if (moreBtn) {
					moreBtn.remove();
				}
			},
			error: () => {
				searchNewsListing.classList.remove('is-loading');
			},
		});
	};

	searchNewsInput.addEventListener('input', () => {
		clearTimeout(typingTimer);
		typingTimer = setTimeout(() => {
			const searchFieldValue = searchNewsInput.value;
			if (searchFieldValue.length >= 3) {
				processAjax(searchFieldValue);
			} else {
				searchNewsListing.classList.remove('is-loading');
			}
		}, 1000);
	});
}
