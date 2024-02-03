console.log('buyTilesIcons script lazy-loaded');

import Vivus from 'vivus';
const tilesHld = document.querySelector('.js-buy-tiles-hld');
if (tilesHld) {
	const tilesAll = tilesHld.querySelectorAll('.js-buy-tiles-item');
	tilesAll.forEach(item => {
		const icon = item.querySelector('.js-buy-tiles-icon');
		if (icon) {
			const iconAnimation = new Vivus(icon, {
				start: 'manual',
				type: 'scenario',
				animTimingFunction: Vivus.EASE,
			});
			iconAnimation.finish();
			item.addEventListener('mouseenter', () => {
				iconAnimation.stop();
				iconAnimation.reset();
				iconAnimation.play();
			});
		}
	});
}
