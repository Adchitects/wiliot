// By default Swiper exports only core version without additional modules (like Navigation, Pagination, etc.). So you need to import and configure them:
import { Swiper, EffectFade, Navigation, Pagination, Thumbs, HashNavigation, Autoplay } from 'swiper';
Swiper.use([EffectFade, Navigation, Pagination, Thumbs, HashNavigation, Autoplay]);
import { clearClassActive } from './utilities';
// import { lazyLoadInstance } from '../libs/lazyLoad';

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

const partnersSlider = new Swiper('.js-partners-slider', {
	slidesPerView: 1.03,
	spaceBetween: 24,
	freeMode: true,
	grabCursor: true,
	slideToClickedSlide: true,
	pagination: {
		el: '.js-partners-slide-pagination',
		type: 'progressbar',
	},
	breakpoints: {
		480: {
			slidesPerView: 1.4,
		},
		768: {
			slidesPerView: 2.2,
		},
		900: {
			slidesPerView: 2.7,
		},
		1100: {
			slidesPerView: 3.33,
		},
	},
});
partnersSlider;

const logosSlider = new Swiper('.js-logos-slider', {
	noSwiping: true,
	slidesPerView: 2,
	spaceBetween: 32,
	speed: 200,
	autoplay: {
		delay: 1500,
		disableOnInteraction: false,
	},
	breakpoints: {
		480: {
			slidesPerView: 4,
			spaceBetween: 32,
		},
		640: {
			slidesPerView: 4,
			spaceBetween: 32,
		},
		641: {
			allowTouchMove: false,
			slidesPerView: 4,
			spaceBetween: 48,
			navigation: {
				nextEl: '.swiper-button-next',
				prevEl: '.swiper-button-prev',
			},
		},
		1000: {
			allowTouchMove: false,
			slidesPerView: 6,
			spaceBetween: 48,
			navigation: {
				nextEl: '.swiper-button-next',
				prevEl: '.swiper-button-prev',
			},
		},
		1360: {
			allowTouchMove: false,
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

const tabsSliderEl = document.querySelector('.js-tabs-slider');
const tabsSlider = new Swiper('.js-tabs-slider', {
	slidesPerView: 1,
	spaceBetween: 48,
	speed: 800,
	simulateTouch: false,
	autoHeight: true,
});
tabsSliderEl.addEventListener('click', () => {
	setTimeout(() => {
		console.log('click2');
		tabsSlider.update();
	}, 250);
});

// Change navigation item on slide change
tabsSlider.on('slideChange', function() {
	const tabsNav = document.querySelectorAll('.js-tabs-slider-nav-item');
	if (tabsNav.length > 0) {
		tabsNav.forEach((item, index) => {
			if (index === tabsSlider.activeIndex) {
				if (!item.classList.contains('is-active')) {
					clearClassActive([...tabsNav], 'is-active');
					item.classList.add('is-active');
				}
			}
		});
	}
});

// Change slide on navigation item click
const tabsNav = document.querySelectorAll('.js-tabs-slider-nav-item');
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
	const solutionsSliderItems = new Swiper(sliderHld.querySelector('.js-solutions-slider-items'), {
		effect: 'fade',
		autoHeight: true,
		// hashNavigation: {
		// 	replaceState: true,
		// 	watchState: true,
		// },
		simulateTouch: false,
		allowTouchMove: false,
	});
	solutionsSliderItems;
	// Change slide on navigation item click
	const solutionsSliderTabs = document.querySelectorAll('.js-toggle-active-tab-item');
	if (solutionsSliderTabs.length > 0) {
		solutionsSliderTabs.forEach((item, index) => {
			item.addEventListener('click', () => {
				solutionsSliderTabs.forEach(i => {
					i.classList.remove('is-tab-active');
				});
				if (!item.classList.contains('is-tab-active')) {
					item.classList.add('is-tab-active');
					solutionsSliderItems.slideTo(index);
					item.click();
				}
			});
		});
	}
});

const footerSlider = new Swiper('.js-footer-slider', {
	slidesPerView: 'auto',
	spaceBetween: 0,
	autoplay: {
		delay: 2000,
		disableOnInteraction: false,
	},
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

const carouselSliderHldAll = document.querySelectorAll('.js-carousel-slider-hld');
carouselSliderHldAll.forEach(sliderHld => {
	const carouselSlider = new Swiper(sliderHld.querySelector('.js-carousel-slider'), {
		slidesPerView: 'auto',
		spaceBetween: 24,
		grabCursor: true,
		navigation: {
			prevEl: '.js-carousel-slider-button-prev',
			nextEl: '.js-carousel-slider-button-next',
		},
	});
	carouselSlider;
});
