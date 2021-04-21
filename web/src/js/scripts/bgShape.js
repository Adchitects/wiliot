import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
gsap.registerPlugin(ScrollTrigger);

const bgShapeHldAll = document.querySelectorAll('.js-bg-shape-hld');
bgShapeHldAll.forEach(hld => {
	const bgShapeAll = hld.querySelectorAll('.js-bg-shape');
	bgShapeAll.forEach(bgShape => {
		const tl = gsap.timeline({
			repeat: -1, 
			yoyo: true,
		});
		tl.pause();
		const bgShapeVersion = bgShape.dataset.version;
		gsap.to(hld, {
			scrollTrigger: {
				markers: true,
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
		}
		if (bgShapeVersion === 'center-right') {
			const shape1 = bgShape.querySelector('.js-s1');
			tl.to(shape1, {
				duration: 15,
				y: 100,
				scaleX: 2,
				rotationX: -45,
				transformOrigin: 'center right',
			});
			tl.to(shape1, {
				duration: 7,
				scaleX: 0.5,
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
				rotation: -15,
			}, 1);
		}
		if (bgShapeVersion === 'bottom-left') {
			const shape1 = bgShape.querySelector('.js-s1');
			const shape2 = bgShape.querySelector('.js-s2');
			tl.to(shape1, {
				duration: 4,
				x: -100,
				opacity: 0,
				scale: 1.2,
			});
			tl.to(shape2, {
				duration: 4,
				opacity: 1,
				rotation: 10,
			}, 1);
		}
		if (bgShapeVersion === 'center-left') {
			const shape1 = bgShape.querySelector('.js-s1');
			tl.to(shape1, {
				duration: 15,
				y: -100,
				scaleX: 2,
				rotationX: 45,
				transformOrigin: 'center left',
			});
			tl.to(shape1, {
				duration: 15,
				y: 300,
				scaleX: 3,
				scaleY: 2,
			});
		}
	});
});
