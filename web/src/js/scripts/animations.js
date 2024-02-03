import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';

const markersFlag = false;
const invalidateOnRefreshFlag = false;
const scrubFlag = false;

const gsapScroll = () => {
	gsap.registerPlugin(ScrollTrigger);
	window.addEventListener('resize', () => {
		ScrollTrigger.refresh;
	});
	const resizeObserver = new ResizeObserver(entries =>
		ScrollTrigger.refresh
	);
	resizeObserver.observe(document.body);
	const gsapHld = document.querySelectorAll('.js-gsap-hld');

	if (gsapHld) {
		gsapHld.forEach(hld => {
			const triggerStartValue = hld.hasAttribute('data-offset') ? hld.getAttribute('data-offset') : 'top 85%';
			const duration = 1;
			const fadeUps = hld.querySelectorAll('.js-gsap-fade-up');
			const fadeIns = hld.querySelectorAll('.js-gsap-fade-in');
			if (fadeUps) {
				fadeUps.forEach(fadeUp => {
					const durationValue = fadeUp.hasAttribute('data-duration') ? parseFloat(fadeUp.getAttribute('data-duration')) : duration;
					const delayValue = fadeUp.hasAttribute('data-delay') ? parseFloat(fadeUp.getAttribute('data-delay')) : 0;
					const amountOfY = fadeUp.hasAttribute('data-how-much-y') ? parseFloat(fadeUp.getAttribute('data-how-much-y')) : 50;
					gsap.from(fadeUp, {
						duration: durationValue,
						delay: delayValue,
						y: amountOfY,
						opacity: 0,
						scrollTrigger: {
							trigger: hld,
							markers: markersFlag,
							start: () => triggerStartValue,
							scrub: scrubFlag,
							invalidateOnRefresh: invalidateOnRefreshFlag,
							onEnter: () => {
								fadeUp.classList.add('is-gsap-animated');
							},
						},
					});
				});
			}

			if (fadeIns) {
				fadeIns.forEach(fadeIn => {
					const durationValue = fadeIn.hasAttribute('data-duration') ? parseFloat(fadeIn.getAttribute('data-duration')) : duration;
					const delayValue = fadeIn.hasAttribute('data-delay') ? parseFloat(fadeIn.getAttribute('data-delay')) : 0;
					gsap.from(fadeIn, {
						duration: durationValue,
						delay: delayValue,
						y: 25,
						opacity: 0,
						scrollTrigger: {
							trigger: hld,
							markers: markersFlag,
							start: () => triggerStartValue,
							scrub: scrubFlag,
							invalidateOnRefresh: invalidateOnRefreshFlag,
							onEnter: () => {
								fadeIn.classList.add('is-gsap-animated');
							},
						},
					});
				});
			}
			hld.classList.add('is-gsap-ready');
		});
	}
};

if (window.innerWidth >= 1024) {
	gsapScroll();
} else {
	document.querySelector('body').classList.add('gsap-mobile-fallback-initialized');
}
