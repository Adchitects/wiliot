import LazyLoad from 'vanilla-lazyload';
import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
gsap.registerPlugin(ScrollTrigger);

export const lazyLoadInstance = new LazyLoad({
	elements_selector: '.js-lazy',
	callback_loaded: ScrollTrigger.refresh(),
	// use_native: false,
	// container: document.querySelector('.js-your-smooth-scroll-container'),
});
