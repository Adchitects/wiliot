import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { ScrollToPlugin } from 'gsap/ScrollToPlugin';
gsap.registerPlugin(ScrollTrigger, ScrollToPlugin);

const sectionAll = document.querySelectorAll('section[id]');
let currentSectionId = '';
let isScrolling = false;

// Debounce function
function debounce(func, wait) {
	let timeout;
	return function executedFunction(...args) {
		const later = () => {
			clearTimeout(timeout);
			func(...args);
		};
		clearTimeout(timeout);
		timeout = setTimeout(later, wait);
	};
}

// Function to update URL
const updateUrl = debounce((sectionId) => {
	if (currentSectionId !== sectionId && !isScrolling) {
		currentSectionId = sectionId;
		window.history.replaceState({ page: 'messages', sectionId: sectionId }, '', `#${sectionId}`);
		console.log('URL updated:', window.location.hash);
	}
}, 100);

// Create a single ScrollTrigger for all sections
ScrollTrigger.create({
	trigger: 'body',
	start: 'top top',
	end: 'bottom bottom',
	onUpdate: (self) => {
		const scrollPosition = window.pageYOffset || document.documentElement.scrollTop;
		for (let i = sectionAll.length - 1; i >= 0; i--) {
			const section = sectionAll[i];
			const sectionTop = section.offsetTop;
			const sectionHeight = section.offsetHeight;
			if (scrollPosition >= sectionTop - window.innerHeight * 0.4 &&
                scrollPosition < sectionTop + sectionHeight) {
				updateUrl(section.id);
				break;
			}
		}
	},
	fastScrollEnd: true,
});

// Handle back button navigation
window.addEventListener('popstate', (event) => {
	console.log('Popstate event triggered');
	console.log('Event state:', event.state);
	console.log('Current URL:', window.location.href);

	isScrolling = true;
	gsap.to(window, {
		duration: 0.5,
		scrollTo: 0,
		ease: 'power2.inOut',
		onComplete: () => {
			isScrolling = false;
			currentSectionId = '';
			// Remove hash from URL after scrolling to top
			history.replaceState(null, document.title, window.location.pathname + window.location.search);
			console.log('Scroll to top complete');
			console.log('Updated URL:', window.location.href);
		},
	});
});

// Batch ScrollTrigger updates
ScrollTrigger.config({ limitCallbacks: true });
gsap.ticker.lagSmoothing(0);

console.log('Script loaded');
