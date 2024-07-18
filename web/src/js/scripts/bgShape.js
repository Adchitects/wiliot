import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
gsap.registerPlugin(ScrollTrigger);

const isMobile = () => /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
if (!isMobile()) {
	const bgShapeHldAll = document.querySelectorAll('.js-bg-shape-hld');
	const createTimeline = () => gsap.timeline({ repeat: -1, yoyo: true }).pause();
	const setupScrollTrigger = (hld, tl) => {
		ScrollTrigger.create({
			trigger: hld,
			start: 'top 85%',
			end: 'bottom 10%',
			scrub: true,
			onEnter: () => tl.play(),
			onEnterBack: () => tl.play(),
			onLeave: () => tl.pause(),
			onLeaveBack: () => tl.pause(),
		});
	};
	const animateShape = (bgShape, tl) => {
		const bgShapeVersion = bgShape.dataset.version;
		const getShape = (selector) => bgShape.querySelector(selector);
		const animations = {
			'top-right': () => {
				const [shape1, shape2, shape3] = ['.js-s1', '.js-s2', '.js-s3'].map(getShape);
				tl.to(shape1, { y: 100, duration: 6, opacity: 1, rotation: 5 }, 0)
					.to(shape2, { duration: 2, opacity: 1, rotation: 30 }, 2)
					.to(shape2, { duration: 2, opacity: 0, rotation: 30 }, 4)
					.to(shape3, { duration: 4, x: 200, opacity: 1, rotation: -15 }, 4);
			},
			'center-right': () => {
				const shape1 = getShape('.js-s1');
				tl.to(shape1, { duration: 15, y: 200, scaleX: 1.2, transformOrigin: 'center right' })
					.to(shape1, { duration: 7, scaleX: 0.5 });
			},
			'bottom-right': () => {
				const [shape1, shape2] = ['.js-s1', '.js-s2'].map(getShape);
				tl.to(shape1, { duration: 10, opacity: 0, scale: 4 })
					.to(shape2, { duration: 6, opacity: 1 }, 1);
			},
			'bottom-left': () => {
				const shape2 = getShape('.js-s2');
				tl.to(shape2, { duration: 5, opacity: 1 }, 1);
			},
			'center-left': () => {
				const shape1 = getShape('.js-s1');
				tl.to(shape1, { duration: 10, y: 150, scaleX: 1.7, scaleY: 1.7, transformOrigin: 'center left' })
					.to(shape1, { duration: 10, y: 400, scaleX: 2, scaleY: 2 });
			},
			'center-left-sticky': () => {
				const shape1 = getShape('.js-s1');
				tl.to(shape1, { duration: 10, scaleX: 1.7, scaleY: 1.7, transformOrigin: 'center left' })
					.to(shape1, { duration: 10, scaleX: 2, scaleY: 2 });
			},
			'center-center': () => {
				const shape1 = getShape('.js-s1');
				tl.to(shape1, { duration: 15, scale: 1.5, transformOrigin: 'center center' })
					.to(shape1, { duration: 15, scale: 0.8, y: -150 });
			},
		};
		if (animations[bgShapeVersion]) {
			animations[bgShapeVersion]();
		}
		bgShape.addEventListener('click', () => {
			const origin = {
				'top-right': 'center center',
				'center-right': 'right center',
				'bottom-right': 'bottom center',
				'bottom-left': 'bottom center',
				'center-left': 'top left',
				'center-left-sticky': 'top left',
				'center-center': 'center center',
			}[bgShapeVersion] || 'center center';
			const scale = bgShapeVersion === 'center-center' ? 2 : 5;
			gsap.to(bgShape, {
				duration: 10,
				scale,
				transformOrigin: origin,
				onComplete: () => {
					gsap.to(bgShape, {
						duration: 5,
						scale: 1,
						transformOrigin: origin,
					});
				},
			});
		});
	};
	bgShapeHldAll.forEach(hld => {
		const bgShapeAll = hld.querySelectorAll('.js-bg-shape');
		bgShapeAll.forEach(bgShape => {
			const tl = createTimeline();
			setupScrollTrigger(hld, tl);
			animateShape(bgShape, tl);
		});
	});
}
