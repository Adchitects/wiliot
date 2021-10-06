import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
gsap.registerPlugin(ScrollTrigger);
const sectionAll = document.querySelectorAll('section');
sectionAll.forEach((section, key) => {
	let sectionId = '#' + ('0' + parseInt(key + 1, 16)).slice(-2);
	const updateUrl = () => {
		window.history.replaceState({page: 'messages' }, '', sectionId);
		console.log(key + 1);
	};
	gsap.to(section, {
		scrollTrigger: {
			// markers: true,
			trigger: section,
			start: 'top top',
			end: '40% top',
			scrub: true,
			onEnter: updateUrl,
			onEnterBack: updateUrl,
			// onLeave: updateUrl,
			// onLeaveBack: updateUrl,
		},
	});
});
