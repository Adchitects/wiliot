// By default Swiper exports only core version without additional modules (like Navigation, Pagination, etc.). So you need to import and configure them:
import { Swiper, EffectFade, Navigation, Pagination } from 'swiper';
import { clearClassActive } from './utilities';
Swiper.use([EffectFade, Navigation, Pagination]);
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
			slidesPerView: 2,
			spaceBetween: 32,
		},
		480: {
			slidesPerView: 4,
			spaceBetween: 32,
		},
		640: {
			slidesPerView: 4,
			spaceBetween: 32,
		},
		900: {
			slidesPerView: 4,
			spaceBetween: 48,
			navigation: {
				nextEl: '.swiper-button-next',
				prevEl: '.swiper-button-prev',
			},
		},
		1000: {
			slidesPerView: 6,
			spaceBetween: 48,
			navigation: {
				nextEl: '.swiper-button-next',
				prevEl: '.swiper-button-prev',
			},
		},
		1360: {
			slidesPerView: 8,
			navigation: {
				nextEl: '.swiper-button-next',
				prevEl: '.swiper-button-prev',
			},
		},

	},
});
logosSlider;

const tabsSlider = new Swiper('.js-tabs-slider', {
	slidesPerView: 1,
	spaceBetween: 48,
	allowTouchMove: false,
	speed: 800,
	// breakpoints: {
	// 	320: {
	// 		slidesPerView: 4,
	// 		spaceBetween: 32,
	// 	},
	// 	640: {
	// 		slidesPerView: 4,
	// 		spaceBetween: 32,
	// 	},
	// 	900: {
	// 		slidesPerView: 6,
	// 		spaceBetween: 48,
	// 	},
	// 	1360: {
	// 		slidesPerView: 8,
	// 	},
	// },
});
tabsSlider;

// Change slide on navigation item click
const tabsNav = document.querySelectorAll('.tabs__nav-item');

if (tabsNav.length > 0) {
	tabsNav.forEach((item, index) => {
		item.addEventListener('click', () => {
			if (!item.classList.contains('is-active')) {
				clearClassActive([...tabsNav], 'is-active');
				item.classList.add('is-active');
				tabsSlider.slideTo(index);
			}
		});
	});
}
