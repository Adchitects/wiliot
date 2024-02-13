// By default Swiper exports only core version without additional modules (like Navigation, Pagination, etc.). So you need to import and configure them:
import { Swiper, EffectFade, Navigation, Pagination, Thumbs, HashNavigation, Autoplay } from 'swiper';
Swiper.use([EffectFade, Navigation, Pagination, Thumbs, HashNavigation, Autoplay]);
import { clearClassActive } from './utilities';
import { lazyLoadInstance } from '../libs/lazyLoad';
// import { heroSliderModalLoad } from './heroSliderModal';

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

const freemodeSliderWithImages = new Swiper('.js-freemode-slider-with-images', {
	slidesPerView: 1.1,
	spaceBetween: 24,
	freeMode: true,
	grabCursor: true,
	slideToClickedSlide: true,
	pagination: {
		el: '.swiper-pagination',
		type: 'progressbar',
	},
	breakpoints: {
		768: {
			slidesPerView: 'auto',
		},
	},
});
freemodeSliderWithImages;

const partnersSlider = new Swiper('.js-partners-slider', {
	slidesPerView: 1.03,
	spaceBetween: 24,
	freeMode: true,
	grabCursor: true,
	slideToClickedSlide: true,
	threshold: 30,
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

const featuredSlider = new Swiper('.js-featured-slider', {
	slidesPerView: 1.2,
	spaceBetween: 24,
	speed: 400,
	autoplay: false,
	grabCursor: true,
	navigation: {
		nextEl: '.js-featured-slider-button-next',
		prevEl: '.js-featured-slider-button-prev',
	},
	breakpoints: {
		480: {
			slidesPerView: 2.3,
			autoplay: {
				delay: 2000,
				disableOnInteraction: true,
			},
		},
		769: {
			slidesPerView: 3.3,
			autoplay: {
				delay: 2000,
				disableOnInteraction: true,
			},
		},
		1280: {
			slidesPerView: 5,
			autoplay: false,
		},
	},
});
featuredSlider;

const featuredSliderUnder = new Swiper('.js-featured-slider-under', {
	slidesPerView: 1,
	spaceBetween: 24,
	speed: 400,
	autoplay: false,
	navigation: {
		nextEl: '.js-featured-slider-under-button-next',
		prevEl: '.js-featured-slider-under-button-prev',
	},
	breakpoints: {
		480: {
			slidesPerView: 2,
			autoplay: {
				delay: 2000,
				disableOnInteraction: true,
			},
		},
		768: {
			slidesPerView: 3,
			autoplay: {
				delay: 2000,
				disableOnInteraction: true,
			},
		},
		1280: {
			slidesPerView: 5,
			autoplay: false,
		},
	},
});
featuredSliderUnder;

const tabsSliderEl = document.querySelector('.js-tabs-slider');
const tabsSlider = new Swiper('.js-tabs-slider', {
	slidesPerView: 1,
	spaceBetween: 48,
	speed: 800,
	simulateTouch: false,
	autoHeight: true,
});
if (tabsSliderEl) {
	tabsSliderEl.addEventListener('click', () => {
		setTimeout(() => {
			tabsSlider.update();
		}, 250);
	});
}

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
		spaceBetween: 16,
		grabCursor: true,
		threshold: 30,
		navigation: {
			prevEl: '.js-carousel-slider-button-prev',
			nextEl: '.js-carousel-slider-button-next',
		},
		breakpoints: {
			600: {
				spaceBetween: 24,
			},
		},
	});
	carouselSlider;
});

const heroSliderHldAll = document.querySelectorAll('.js-hero-slider-hld');
heroSliderHldAll.forEach(sliderHld => {
	const slidesAll = sliderHld.querySelectorAll('.js-hero-slider-slide');
	const heroSlider = new Swiper(sliderHld.querySelector('.js-hero-slider'), {
		slidesPerView: 1,
		grabCursor: true,
		threshold: 30,
		watchSlidesProgress: true,
		autoHeight: true,
		loop: true,
		navigation: {
			prevEl: '.js-hero-slider-button-prev',
			nextEl: '.js-hero-slider-button-next',
		},
		autoplay: {
			delay: 5000,
			disableOnInteraction: false,
		},
		pagination: {
			el: sliderHld.querySelector('.js-hero-slider-progress-bar'),
			renderBullet: function(index, className) {
				return (
					'<span class="' + className + '">' + `<span style="animation-duration: ${slidesAll[index].dataset.swiperAutoplay}ms"></span>` + '</span>'
				);
			},
		},
		on: {
			realIndexChange: function() {
				lazyLoadInstance.update();
				// heroSliderModalLoad();
				let activeSlide = slidesAll[this.realIndex];
				let iframeAll = sliderHld.querySelectorAll('.js-hero-slider-iframe');
				let activeIframe = activeSlide.querySelector('.js-hero-slider-iframe');
				if (!activeIframe) {
					iframeAll.forEach(iframe => {
						iframe.src = '';
						setTimeout(() => {
							iframe.src = iframe.dataset.src;
						}, 500);
					});
				}
			},
		},
	});
	heroSlider;
});

const isMobile = window.innerWidth < 768;
if (!isMobile) {
	const vendorsTableSliderHldAll = document.querySelectorAll('.js-vendors-table-slider-hld');
	vendorsTableSliderHldAll.forEach(sliderHld => {
		const toggleSlidesDisplay = (swiperInstance) => {
			const activeIndex = swiperInstance.activeIndex;
			const slides = swiperInstance.slides;
			slides.forEach((slide, index) => {
				if (index === activeIndex) {
					slide.style.display = 'block';
				} else {
					slide.style.display = 'none';
				}
				slide.style.left = `${index * 100}%`;
			});
		};
		const updateSlideNumbers = (swiperInstance, totalItems) => {
			const activeIndex = swiperInstance.activeIndex;
			const slidesPerView = 3; // Assuming slidesPerView is 3 as per your example
			const start = activeIndex * slidesPerView + 1;
			const end = Math.min((activeIndex + 1) * slidesPerView, totalItems);
			const sliderCurrentElement = document.querySelector('.js-vendors-table-slider-current');
			if (start === end) {
				sliderCurrentElement.textContent = `${totalItems}`;
			} else {
				sliderCurrentElement.textContent = `${start}-${end}`;
			}
		};
		const totalItems = sliderHld.querySelector('.js-vendors-table-slider-total-items').textContent;
		const vendorTableSlider = new Swiper(sliderHld.querySelector('.js-vendors-table-slider'), {
			slidesPerView: 1,
			touchMoveStopPropagation: false,
			simulateTouch: false,
			touchStartPreventDefault: false,
			pagination: {
				el: '.js-vendors-table-slider-pagination',
				clickable: true,
				renderBullet: (index, className) => `<span class="${className}">${index + 1}</span>`,
			},
			navigation: {
				nextEl: '.js-vendors-table-slider-button-next',
				prevEl: '.js-vendors-table-slider-button-prev',
			},
			on: {
				slideChange: function() {
					toggleSlidesDisplay(this);
					updateSlideNumbers(this, totalItems);
				},
				init: function() {
					setTimeout(() => toggleSlidesDisplay(this), 0);
				},
			},
		});
		vendorTableSlider;
	});
}

const vendorsSliderHldAll = document.querySelectorAll('.js-vendors-slider-hld');
vendorsSliderHldAll.forEach(sliderHld => {
	const vendorSlider = new Swiper(sliderHld.querySelector('.js-vendors-slider'), {
		slidesPerView: 1.1,
		spaceBetween: 20,
		simulateTouch: true,
		grabCursor: true,
		threshold: 30,
		navigation: {
			nextEl: '.js-vendors-slider-button-next',
			prevEl: '.js-vendors-slider-button-prev',
		},
		breakpoints: {
			650: {
				slidesPerView: 2.1,
				slidesPerGroup: 2,
			},
			1024: {
				slidesPerView: 3,
				slidesPerGroup: 3,
				spaceBetween: 40,
			},
		},
		on: {
			slideChange: function() {
				lazyLoadInstance.update();
			},
		},
	});
	vendorSlider;
});
