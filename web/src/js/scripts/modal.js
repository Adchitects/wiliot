const modalHldAll = document.querySelectorAll('.js-modal-hld');
modalHldAll.forEach(modalHld => {
	const modal = modalHld.querySelector('.js-modal-modal');
	const openModal = modalHld.querySelector('.js-modal-btn');
	const closeModalAll = modalHld.querySelectorAll('.js-modal-close');
	const iframe = modalHld.querySelector('.js-modal-iframe');
	const videoHld = modalHld.querySelector('.js-video-hld');
	let videoIsPlayed = false;
	if (modal && openModal) {
		openModal.addEventListener('click', (e) => {
			modal.classList.add('is-active');
			document.body.style.overflow = 'hidden';
			openModal.classList.remove('is-paused');
			if (iframe) {
				iframe.src = iframe.dataset.src;
			}
			if (videoHld) {
				const video = videoHld.querySelector('video');
				setTimeout(() => {
					video.play();
					videoIsPlayed = true;
					videoHld.classList.remove('is-paused');
				}, 20);
			}
		});
		closeModalAll.forEach(close => {
			close.addEventListener('click', () => {
				modal.classList.remove('is-active');
				openModal.classList.add('is-paused');
				document.body.style.overflow = '';
				if (iframe) {
					iframe.src = '';
				}
				if (videoHld) {
					const video = videoHld.querySelector('video');
					video.pause();
					videoIsPlayed = false;
					videoHld.classList.add('is-paused');
				}
			});
		});
	}
});
