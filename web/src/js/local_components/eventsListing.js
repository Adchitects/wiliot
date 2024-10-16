import { initializeListing } from './listingCommon.js';

console.log('eventsListing script loaded');

initializeListing({
	listingSelector: '.js-events-listing',
	itemSelector: '.js-event-item',
	noResultsSelector: '.js-events-listing-no-results',
	showMoreBtnHldSelector: '.js-more-events-btn-hld',
	showMoreBtnSelector: '.js-more-events-btn',
	categorySelector: '.js-events-listing-category',
	topicSelector: '.js-events-listing-topics-list-hld',
	listingType: 'Events',
});
