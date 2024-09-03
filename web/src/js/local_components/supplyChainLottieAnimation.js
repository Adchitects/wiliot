console.log('supplyChainLottieAnimation script lazy-loaded');
import { gsap } from 'gsap';

function setupHoverEffects() {
	const hldAll = document.querySelectorAll('.js-supply-chain-lottie-animation-hld');
	hldAll.forEach(hld => {
		const labelHoverAreaAll = hld.querySelectorAll('.js-supply-chain-lottie-animation-hover-area');
		const labelAll = hld.querySelectorAll('.js-supply-chain-lottie-animation-label');

		labelHoverAreaAll.forEach(area => {
			labelAll.forEach(label => {
				if (area && label && area.dataset.label === label.dataset.label) {
					area.addEventListener('mouseover', function() {
						label.classList.add('is-active');
					});
					area.addEventListener('mouseout', function() {
						label.classList.remove('is-active');
					});
				}
			});

			// Add floating text for elements with .is-link class
			if (area.classList.contains('is-link')) {
				const boxText = document.createElement('div');
				boxText.classList.add('js-supply-chain-lottie-animation-text');
				boxText.textContent = 'Click to learn more';
				boxText.style.position = 'absolute';
				boxText.style.bottom = '-14px';
				boxText.style.right = '-50px';
				boxText.style.pointerEvents = 'none';
				boxText.style.opacity = '0';
				boxText.style.zIndex = '99992';
				boxText.style.color = '#27BCBC';
				boxText.style.padding = '4px 10px 2px';
				boxText.style.fontSize = '16px';
				boxText.style.fontWeight = '500';
				boxText.style.whiteSpace = 'nowrap';
				boxText.style.borderRadius = '4px';
				area.appendChild(boxText);

				area.addEventListener('mouseenter', () => {
					gsap.to(boxText, { opacity: 1, duration: 0.3 });
				});

				area.addEventListener('mouseleave', () => {
					gsap.to(boxText, { opacity: 0, duration: 0.3 });
				});
			}
		});
	});
}

setTimeout(setupHoverEffects, 1000);
setTimeout(setupHoverEffects, 2000);
setTimeout(setupHoverEffects, 3000);
