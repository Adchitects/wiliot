setTimeout(() => {
	const warehouseTargetElements = document.querySelectorAll('g[transform="matrix(1,0,0,1,380.34698486328125,251.5240020751953)"], g[transform="matrix(0.3333300054073334,0,0,0.3333300054073334,140.50054931640625,252.0009307861328)"]');
	const transportTargetElements = document.querySelectorAll('g[transform="matrix(1,0,0,1,686.802001953125,251.5240020751953)"], g[transform="matrix(-0.3499999940395355,0,0,0.3499999940395355,554.9000244140625,338.20001220703125)"]');
	const warehouseAnimation = document.querySelector('.js-supply-chain-lottie-animation[data-label="warehouse"]');
	const transportAnimation = document.querySelector('.js-supply-chain-lottie-animation[data-label="transport"]');
	console.log(warehouseTargetElements, transportTargetElements);

	const addHoverEffects = (targetElements, animation) => {
		if (targetElements.length > 0 && animation) {
			targetElements.forEach(targetElement => {
				targetElement.addEventListener('mouseover', function() {
					animation.classList.add('is-active');
				});
				targetElement.addEventListener('mouseout', function() {
					animation.classList.remove('is-active');
				});
			});
		}
	};

	addHoverEffects(warehouseTargetElements, warehouseAnimation);
	addHoverEffects(transportTargetElements, transportAnimation);
}, 2000);
