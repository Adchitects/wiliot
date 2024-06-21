console.log('supplyChainLottieAnimation script lazy-loaded');

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
					// area.addEventListener('mouseover', function() {
					// 	labelAll.forEach(l => l.classList.remove('is-active'));
					// 	label.classList.add('is-active');
					// });
					// document.addEventListener('click', function(event) {
					// 	if (!label.contains(event.target)) {
					// 		label.classList.remove('is-active');
					// 	}
					// });
				}
			});
		});
	});
}

setTimeout(setupHoverEffects, 2000);
setTimeout(setupHoverEffects, 3000);
