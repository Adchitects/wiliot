// By default Swiper exports only core version without additional modules (like Navigation, Pagination, etc.). So you need to import and configure them:
import { Swiper, EffectFade, Navigation, Pagination, Thumbs, HashNavigation } from 'swiper';
Swiper.use([EffectFade, Navigation, Pagination, Thumbs, HashNavigation]);
import { clearClassActive } from './utilities';

const freemodeSlider = new Swiper('.js-freemode-slider', {
	slidesPerView: 2.1,
	spaceBetween: 0,
	freeMode: true,
	grabCursor: true,
	slideToClickedSlide: true,
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
	slidesPerView: 7,
	spaceBetween: 48,
	speed: 200,
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
			slidesPerView: 7,
			spaceBetween: 70,
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

const solutionsSliderHldAll = document.querySelectorAll('.js-solutions-slider-hld');
solutionsSliderHldAll.forEach(sliderHld => {
	const solutionsSliderTabs = new Swiper(sliderHld.querySelector('.js-solutions-slider-tabs'), {
		slidesPerView: 'auto',
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

const footerSlider = new Swiper('.js-footer-slider', {
	slidesPerView: 'auto',
	spaceBetween: 0,
	breakpoints: {
		320: {
			slidesPerView: 2,
			spaceBetween: 32,
		},
		580: {
			slidesPerView: 3,
			spaceBetween: 32,
		},
		767: {
			slidesPerView: 4,
			spaceBetween: 32,
		},
		1099: {
			slidesPerView: 'auto',
			spaceBetween: 0,
		},
	},
});
footerSlider;
