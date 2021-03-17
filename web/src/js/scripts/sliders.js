// By default Swiper exports only core version without additional modules (like Navigation, Pagination, etc.). So you need to import and configure them:
import { Swiper, EffectFade, Navigation } from 'swiper';
Swiper.use([EffectFade, Navigation]);
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
