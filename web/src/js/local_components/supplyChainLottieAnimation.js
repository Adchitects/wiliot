console.log('supplyChainLottieAnimation script lazy-loaded');

function setupHoverEffects() {
	const hldAll = document.querySelectorAll('.js-supply-chain-lottie-animation-hld');
	hldAll.forEach(hld => {
		const labelHoverAreaAll = hld.querySelectorAll('.js-supply-chain-lottie-animation-hover-area');
		const labelAll = hld.querySelectorAll('.js-supply-chain-lottie-animation-label');
		const svgBoxMap = {
			'warehouse': '.js-warehouse-box-hoverable',
			'transport': '.js-transport-box-hoverable',
			'distribution': '.js-distribution-box-hoverable',
			'return': '.js-return-logistics-box-hoverable',
			'home': '.js-home-box-hoverable',
			'store': '.js-store-box-hoverable',
			'delivery': '.js-delivery-box-hoverable',
			'farm': '.js-farm-box-hoverable',
			'processing': '.js-processing-box-hoverable',
		};
		labelHoverAreaAll.forEach(area => {
			labelAll.forEach(label => {
				if (area && label && area.dataset.label === label.dataset.label) {
					['mouseenter', 'mouseleave'].forEach(eventType => {
						area.addEventListener(eventType, function() {
							const isEnter = eventType === 'mouseenter';
							label.classList.toggle('is-active', isEnter);
							if (area.classList.contains('is-link')) {
								const svgBoxSelector = svgBoxMap[area.dataset.label];
								const svgBox = hld.querySelector(svgBoxSelector);
								svgBox?.classList.toggle('is-active', isEnter);
							}
						});
					});
				}
			});
		});
	});
}

setTimeout(setupHoverEffects, 1000);
setTimeout(setupHoverEffects, 2000);
setTimeout(setupHoverEffects, 3000);
