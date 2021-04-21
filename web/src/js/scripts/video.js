const videoHldAll = document.querySelectorAll('.js-video-hld');
videoHldAll.forEach(hld => {
	const vid = hld.querySelector('video');
	let videoIsPlayed = false;
	vid.addEventListener('click', () => {
		if (!videoIsPlayed) {
			vid.play();
			videoIsPlayed = true;
			hld.classList.remove('is-paused');
		} else {
			vid.pause();
			videoIsPlayed = false;
			hld.classList.add('is-paused');
		}
	});
});
