const videoHldAll = document.querySelectorAll('.js-video-hld');
videoHldAll.forEach(hld => {
	const vid = hld.querySelector('video');
	let videoIsPlayed = hld.classList.contains('is-paused') ? false : true;
	vid.addEventListener('click', () => {
		hld.classList.remove('show-thumbnail');
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
