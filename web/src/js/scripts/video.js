const videoHldAll = document.querySelectorAll('.js-video-hld');
videoHldAll.forEach(hld => {
	const vid = hld.querySelector('video');
	let videoIsPlayed = hld.classList.contains('is-paused') ? false : true;
	vid.addEventListener('click', () => {
		hld.classList.remove('show-thumbnail');
		hld.classList.remove('is-before-play');
		if (!videoIsPlayed) {
			vid.play();
			videoIsPlayed = true;
			hld.classList.remove('is-paused');
			setTimeout(() => {
				vid.setAttribute('controls', 'controls');
			}, 500);
		} else {
			if (vid.hasAttribute('controls')) {
				vid.removeAttribute('controls');
				setTimeout(() => {
					vid.pause();
					videoIsPlayed = false;
					hld.classList.add('is-paused');
				}, 500);
			} else {
				vid.pause();
				videoIsPlayed = false;
				hld.classList.add('is-paused');
			}
		}
	});
});
