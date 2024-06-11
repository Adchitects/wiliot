setTimeout(() => {
	const hldAll = document.querySelectorAll('.js-supply-chain-lottie-animation-hld');
	hldAll.forEach(hld => {
		const labelHoverAreaAll = hld.querySelectorAll('.js-supply-chain-lottie-animation-hover-area');
		const labelAll = hld.querySelectorAll('.js-supply-chain-lottie-animation-label');
		labelHoverAreaAll.forEach(area => {
			console.log(area);
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
		});
	});
}, 3000);
