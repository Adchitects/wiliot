console.log('homepageLottieAnimation script loaded');

import Lottie from 'lottie-web';
import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
gsap.registerPlugin(ScrollTrigger);

const animationAll = document.querySelectorAll('.js-homepage-animation');
animationAll.forEach(animation => {
	gsap.to({}, {
		scrollTrigger: {
			trigger: animation,
			start: 'top 95%',
			once: true,
			onEnter: () => {
				const anim = Lottie.loadAnimation({
					container: animation,
					renderer: 'svg',
					loop: true,
					autoplay: true,
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
			},
		},
	});
});

window.addEventListener('load', () => {
	ScrollTrigger.refresh();
});
