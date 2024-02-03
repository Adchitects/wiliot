const hldAll = document.querySelectorAll('.js-yt-video-placeholder-hld');
hldAll.forEach(hld => {
	if (hld) {
		const image = hld.querySelector('.js-yt-video-placeholder-image');
		const iframe = hld.querySelector('.js-yt-video-placeholder-iframe');
		// Load the external yt script on interactions
		const userInteractionEvents = ['scroll', 'mouseover', 'keydown', 'touchmove', 'touchstart', 'click'];
		let scriptLoaded = false;
		const loadScript = () => {
			if (!scriptLoaded) {
				scriptLoaded = true;
				image.style.display = 'none';
				iframe.style.display = 'block';
			}
		};
		userInteractionEvents.forEach(e => {
			window.addEventListener(e, loadScript, { passive: true, once: true });
		});
	}
});
