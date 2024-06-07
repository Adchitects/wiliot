// console.log('homepageLottieAnimation script lazy-loaded');

// import Lottie from 'lottie-web';
// import gsap from 'gsap';
// import { ScrollTrigger } from 'gsap/ScrollTrigger';
// gsap.registerPlugin(ScrollTrigger);

// const setupHomepageAnimation = (animation) => {
// 	const rwd = animation.dataset.rwd;
// 	const mediaQuery = rwd === 'mobile' ? '(max-width: 767px)' : rwd === 'desktop' ? '(min-width: 768px)' : '';
// 	if (mediaQuery && window.matchMedia(mediaQuery).matches) {
// 		const anim = Lottie.loadAnimation({
// 			container: animation,
// 			renderer: 'svg',
// 			loop: true,
// 			autoplay: false,
// 			path: animation.dataset.animationPath,
// 		});
// 		gsap.to(animation, {
// 			scrollTrigger: {
// 				trigger: animation,
// 				start: 'top 95%',
// 				end: 'bottom 10%',
// 				scrub: true,
// 				// markers: true,
// 				onEnter: () => anim.play(),
// 				onEnterBack: () => anim.play(),
// 				onLeave: () => anim.pause(),
// 				onLeaveBack: () => anim.pause(),
// 			},
// 		});
// 		return anim;
// 	}
// 	return null;
// };

// const initializeHomepageAnimations = () => {
// 	ScrollTrigger.refresh();
// 	const homepageAnimationsAll = document.querySelectorAll('.js-homepage-animation');
// 	let homepageAnimations = Array.from(homepageAnimationsAll).map(setupHomepageAnimation);

// 	const handleResizeHomepage = () => {
// 		homepageAnimations.forEach((anim, index) => {
// 			if (anim) {
// 				anim.destroy();
// 				homepageAnimations[index] = null;
// 			}
// 		});
// 		homepageAnimations = Array.from(homepageAnimationsAll).map(setupHomepageAnimation);
// 	};

// 	window.addEventListener('resize', handleResizeHomepage);
// };

// initializeHomepageAnimations();
