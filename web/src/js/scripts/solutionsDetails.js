import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import ScrollToPlugin from 'gsap/ScrollToPlugin';
gsap.registerPlugin(ScrollTrigger);
gsap.registerPlugin(ScrollToPlugin);

const toggleActiveHldAll = document.querySelectorAll('.js-toggle-active-hld');
toggleActiveHldAll.forEach(hld => {
	const toggleActiveTabItemAll = hld.querySelectorAll('.js-toggle-active-tab-item');
	const toggleActive = () => {
		const toggleActiveItemAll = hld.querySelectorAll('.js-toggle-active-item');
		toggleActiveItemAll.forEach(item => {
			const navItemAll = item.querySelectorAll(`.js-toggle-active-nav-item`);
			const contentItemAll = item.querySelectorAll('.js-toggle-active-content-item');
			navItemAll.forEach(navItem => {
				contentItemAll.forEach(contentItem => {
					if (navItem.dataset.key === contentItem.dataset.key && navItem.dataset.key !== '1') {
						gsap.to(navItem, {
							scrollTrigger: {
								// markers: true,
								trigger: contentItem,
								start: 'top 29%', // when the top of the trigger hits the 40% of the viewport
								end: 'top 29%',
								scrub: true,
								onEnter: () => navItem.classList.toggle('is-active'),
								onLeaveBack: () => navItem.classList.toggle('is-active'),
							},
						});
					} 
					if (navItem.dataset.key === contentItem.dataset.key) {
						navItem.addEventListener('click', () => {
							gsap.to(window, {
								duration: 0.5, 
								scrollTo: {
									y: contentItem,
									offsetY: 100,
								},
							});
						});
					}
				});
			});
		});
	};
	toggleActiveTabItemAll.forEach(tabItem => {
		tabItem.addEventListener('click', () => {
			ScrollTrigger.refresh();
		});
	});
	toggleActive();
	window.addEventListener('resize', ScrollTrigger.refresh);
});
