import LazyLoad from 'vanilla-lazyload';

export const lazyLoadInstance = new LazyLoad({
	elements_selector: '.js-lazy',
	// use_native: false,
	// container: document.querySelector('.js-your-smooth-scroll-container'),
});
