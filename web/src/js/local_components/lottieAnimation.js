console.log('lottieAnimation script lazy-loaded');

import Lottie from 'lottie-web';
import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
gsap.registerPlugin(ScrollTrigger);

const setupSupplyChainAnimation = (animation) => {
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
		gsap.to(animation, {
			scrollTrigger: {
				trigger: animation,
				start: 'top 95%',
				end: 'bottom 10%',
				scrub: true,
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

const initializeSupplyChainAnimations = () => {
	ScrollTrigger.refresh();
	const supplyChainAnimationsAll = document.querySelectorAll('.js-lottie-animation');
	let supplyChainAnimations = Array.from(supplyChainAnimationsAll).map(setupSupplyChainAnimation);

	const handleResizeSupplyChain = () => {
		supplyChainAnimations.forEach((anim, index) => {
			if (anim) {
				anim.destroy();
				supplyChainAnimations[index] = null;
			}
		});
		supplyChainAnimations = Array.from(supplyChainAnimationsAll).map(setupSupplyChainAnimation);
	};

	window.addEventListener('resize', handleResizeSupplyChain);
};

initializeSupplyChainAnimations();
