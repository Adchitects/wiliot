import { initializeListing } from './listingCommon.js';

console.log('newsListing script loaded');

initializeListing({
	listingSelector: '.js-news-listing-hld',
	itemSelector: '.js-news-listing-item',
	noResultsSelector: '.js-news-listing-no-results',
	showMoreBtnHldSelector: '.js-more-news-btn-hld',
	showMoreBtnSelector: '.js-more-news-btn',
	categorySelector: '.js-news-listing-category',
	topicSelector: '.js-news-listing-topics-select',
	listingType: 'News',
});
