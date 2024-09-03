console.log('lottieAnimation script lazy-loaded');
import Lottie from 'lottie-web';
import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
gsap.registerPlugin(ScrollTrigger);

const setupLottieAnimation = (animation) => {
	const rwd = animation.dataset.rwd;
	const mediaQuery = rwd === 'mobile' ? '(max-width: 767px)' : rwd === 'desktop' ? '(min-width: 768px)' : '';

	if (mediaQuery && window.matchMedia(mediaQuery).matches) {
		const anim = Lottie.loadAnimation({
			container: animation,
			renderer: 'svg',
			loop: true,
			autoplay: false,
			path: animation.dataset.animationPath,
		});

		// Add class when animation is loaded
		anim.addEventListener('data_ready', () => {
			document.body.classList.add('is-lottie-animation-loaded');
		});

		gsap.to(animation, {
			scrollTrigger: {
				trigger: animation,
				start: 'top 95%',
				end: 'bottom 0%',
				scrub: true,
				// markers: true,
				onEnter: () => anim.play(),
				onEnterBack: () => anim.play(),
				onLeave: () => anim.pause(),
				onLeaveBack: () => anim.pause(),
			},
		});
		return anim;
	}
	return null;
};

const initializelottieAnimations = () => {
	ScrollTrigger.refresh();
	const lottieAnimationAll = document.querySelectorAll('.js-lottie-animation');
	let lottieAnimations = Array.from(lottieAnimationAll).map(setupLottieAnimation);

	const handleResize = () => {
		lottieAnimations.forEach((anim, index) => {
			if (anim) {
				anim.destroy();
				lottieAnimations[index] = null;
			}
		});
		document.body.classList.remove('is-lottie-animation-loaded');
		lottieAnimations = Array.from(lottieAnimationAll).map(setupLottieAnimation);
	};

	const checkAndInitResize = () => {
		if (window.innerWidth > 767) {
			window.addEventListener('resize', handleResize);
		} else {
			window.removeEventListener('resize', handleResize);
		}
	};

	checkAndInitResize();
	window.addEventListener('resize', checkAndInitResize);
};

initializelottieAnimations();
