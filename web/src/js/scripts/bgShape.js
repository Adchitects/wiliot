import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
gsap.registerPlugin(ScrollTrigger);
// const isSafari = /^((?!chrome|android).)*safari/i.test(navigator.userAgent);
function isMobile() {
	return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
}
if (!isMobile()) {
	const bgShapeHldAll = document.querySelectorAll('.js-bg-shape-hld');
	bgShapeHldAll.forEach(hld => {
		const bgShapeAll = hld.querySelectorAll('.js-bg-shape');
		bgShapeAll.forEach(bgShape => {
			const bgShapeVersion = bgShape.dataset.version;
			const tl = gsap.timeline({
				repeat: -1, 
				yoyo: true,
			});
			tl.pause();
			gsap.to(hld, {
				scrollTrigger: {
					// markers: true,
					trigger: hld,
					start: 'top 85%', // when the top of the trigger hits the 90% of the viewport
					end: 'bottom 10%',
					scrub: true,
					onEnter: () => tl.play(),
					onEnterBack: () => tl.play(),
					onLeave: () => tl.pause(),
					onLeaveBack: () => tl.pause(),
				},
			});
			if (bgShapeVersion === 'top-right') {
				const shape1 = bgShape.querySelector('.js-s1');
				const shape2 = bgShape.querySelector('.js-s2');
				const shape3 = bgShape.querySelector('.js-s3');
				tl.to(shape1, {
					y: 100,
					duration: 6,
					opacity: 1,
					rotation: 5,
				}, 0);
				tl.to(shape2, {
					duration: 2,
					opacity: 1,
					rotation: 30,
				}, 2);
				tl.to(shape2, {
					duration: 2,
					opacity: 0,
					rotation: 30,
				}, 4);
				tl.to(shape3, {
					duration: 4,
					x: 200,
					opacity: 1,
					rotation: -15,
				}, 4);
				bgShape.addEventListener('click', () => {
					gsap.to(bgShape, {
						duration: 5,
						scale: 5,
						transformOrigin: 'center center',
					});
					gsap.to(bgShape, {
						duration: 5,
						scale: 1,
						delay: 1,
						transformOrigin: 'center center',
					});
				});
			}
			if (bgShapeVersion === 'center-right') {
				const shape1 = bgShape.querySelector('.js-s1');
				tl.to(shape1, {
					duration: 15,
					y: 200,
					scaleX: 1.2,
					// rotationX: -45,
					transformOrigin: 'center right',
				});
				tl.to(shape1, {
					duration: 7,
					scaleX: 0.5,
				});
				bgShape.addEventListener('click', () => {
					gsap.to(bgShape, {
						duration: 5,
						scale: 5,
						transformOrigin: 'right center',
					});
					gsap.to(bgShape, {
						duration: 5,
						scale: 1,
						delay: 1,
						transformOrigin: 'right center',
					});
				});
			}
			if (bgShapeVersion === 'bottom-right') {
				const shape1 = bgShape.querySelector('.js-s1');
				const shape2 = bgShape.querySelector('.js-s2');
				tl.to(shape1, {
					duration: 10,
					opacity: 0,
					scale: 4,
				});
				tl.to(shape2, {
					duration: 6,
					opacity: 1,
					// rotation: -15,
				}, 1);
				bgShape.addEventListener('click', () => {
					gsap.to(bgShape, {
						duration: 5,
						scale: 5,
						transformOrigin: 'bottom center',
					});
					gsap.to(bgShape, {
						duration: 5,
						scale: 1,
						delay: 1,
						transformOrigin: 'bottom center',
					});
				});
			}
			if (bgShapeVersion === 'bottom-left') {
				const shape2 = bgShape.querySelector('.js-s2');
				tl.to(shape2, {
					duration: 5,
					opacity: 1,
				}, 1);
				bgShape.addEventListener('click', () => {
					gsap.to(bgShape, {
						duration: 5,
						scale: 5,
						transformOrigin: 'bottom center',
					});
					gsap.to(bgShape, {
						duration: 5,
						scale: 1,
						delay: 1,
						transformOrigin: 'bottom center',
					});
				});
			}
			if (bgShapeVersion === 'center-left') {
				const shape1 = bgShape.querySelector('.js-s1');
				tl.to(shape1, {
					duration: 10,
					y: 150,
					scaleX: 1.7,
					scaleY: 1.7,
					// rotationX: 45,
					transformOrigin: 'center left',
				});
				tl.to(shape1, {
					duration: 10,
					y: 400,
					scaleX: 2,
					scaleY: 2,
				});
				bgShape.addEventListener('click', () => {
					gsap.to(bgShape, {
						duration: 5,
						scale: 2.2,
						transformOrigin: 'top left',
					});
					gsap.to(bgShape, {
						duration: 5,
						scale: 1,
						delay: 1,
						transformOrigin: 'top left',
					});
				});
			}
			if (bgShapeVersion === 'center-left-sticky') {
				const shape1 = bgShape.querySelector('.js-s1');
				tl.to(shape1, {
					duration: 10,
					scaleX: 1.7,
					scaleY: 1.7,
					transformOrigin: 'center left',
				});
				tl.to(shape1, {
					duration: 10,
					scaleX: 2,
					scaleY: 2,
				});
				bgShape.addEventListener('click', () => {
					gsap.to(bgShape, {
						duration: 5,
						scale: 2.2,
						transformOrigin: 'top left',
					});
					gsap.to(bgShape, {
						duration: 5,
						scale: 1,
						delay: 1,
						transformOrigin: 'top left',
					});
				});
			}
			if (bgShapeVersion === 'center-center') {
				const shape1 = bgShape.querySelector('.js-s1');
				tl.to(shape1, {
					duration: 15,
					scale: 1.5,
					// rotationX: -45,
					transformOrigin: 'center center',
				});
				tl.to(shape1, {
					duration: 15,
					scale: 0.8,
					y: -150,
				});
				bgShape.addEventListener('click', () => {
					gsap.to(bgShape, {
						duration: 5,
						scale: 2,
						transformOrigin: 'center center',
					});
					gsap.to(bgShape, {
						duration: 5,
						scale: 1,
						delay: 1,
						transformOrigin: 'center center',
					});
				});
			}
		});
	});
}
