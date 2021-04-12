// By default Swiper exports only core version without additional modules (like Navigation, Pagination, etc.). So you need to import and configure them:
import { Swiper, EffectFade, Navigation, Pagination, Thumbs, HashNavigation } from 'swiper';
Swiper.use([EffectFade, Navigation, Pagination, Thumbs, HashNavigation]);
// Import Lazyload for looped sliders to avoid image jumping
import { lazyLoadInstance } from '../libs/lazyLoad';

const exmapleSlider = new Swiper('.js-example-slider', {
	slidesPerView: 2,
	spaceBetween: 20,
	loop: true,
	on: {
		slideChange: function() {
			lazyLoadInstance.update();
		},
	},
});
exmapleSlider;

const exmapleSlider2 = new Swiper('.js-example-slider-2', {
	slidesPerView: 3,
	spaceBetween: 20,
});
exmapleSlider2;

const freemodeSlider = new Swiper('.js-freemode-slider', {
	slidesPerView: 2.1,
	spaceBetween: 0,
	freeMode: true,
	grabCursor: true,
	pagination: {
		el: '.swiper-pagination',
		type: 'progressbar',
	},

	breakpoints: {
		320: {
			slidesPerView: 1.1,
		},
		480: {
			slidesPerView: 1.5,
		},
		720: {
			slidesPerView: 1.8,
		},
		900: {
			slidesPerView: 2.1,
		},

	},

});
freemodeSlider;

const logosSlider = new Swiper('.js-logos-slider', {
	noSwiping: true,
	slidesPerView: 8,
	spaceBetween: 48,
	breakpoints: {
		320: {
			slidesPerView: 4,
			spaceBetween: 32,
		},
		640: {
			slidesPerView: 4,
			spaceBetween: 32,
		},
		900: {
			slidesPerView: 6,
			spaceBetween: 48,
		},
		1360: {
			slidesPerView: 8,
		},
	},
});
logosSlider;

const solutionsSliderHldAll = document.querySelectorAll('.js-solutions-slider-hld');
solutionsSliderHldAll.forEach(sliderHld => {
	const solutionsSliderTabs = new Swiper(sliderHld.querySelector('.js-solutions-slider-tabs'), {
		slidesPerView: 'auto',
		resistance: false,
		allowTouchMove: false,
		touchStartForcePreventDefault: true,
	});
	solutionsSliderTabs;
	const solutionsSliderItems = new Swiper(sliderHld.querySelector('.js-solutions-slider-items'), {
		effect: 'fade',
		thumbs: {
			swiper: solutionsSliderTabs,
			multipleActiveThumbs: false,
		},
		autoHeight: true,
		hashNavigation: {
			replaceState: true,
			watchState: true,
		},
		simulateTouch: false,
	});
	solutionsSliderItems;
});
