import Lottie from 'lottie-web';
import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
gsap.registerPlugin(ScrollTrigger);
const animationHld = document.querySelector('.js-homepage-animation-hld');
if (animationHld) {
	const animationAll = animationHld.querySelectorAll('.js-homepage-animation');
	animationAll.forEach(animation => {
		const anim = Lottie.loadAnimation({
			container: animation,
			renderer: 'svg',
			loop: true,
			autoplay: true,
			path: animation.dataset.animationPath,
		});
		gsap.to(animationHld, {
			scrollTrigger: {
				// markers: true,
				trigger: animationHld,
				start: 'top 95%',
				end: 'bottom 10%',
				scrub: true,
				onEnter: () => anim.play(),
				onEnterBack: () => anim.play(),
				onLeave: () => anim.pause(),
				onLeaveBack: () => anim.pause(),
			},
		});
	});
}

window.addEventListener('load', () => {
	ScrollTrigger.refresh();
});
