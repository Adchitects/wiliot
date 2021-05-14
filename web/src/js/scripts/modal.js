const videoModalHld = document.querySelector('.js-video-modal-hld');
if (videoModalHld) {
	const closeModalAll = videoModalHld.querySelectorAll('.js-video-modal-close');
	const openModal = videoModalHld.querySelector('.js-video-modal-btn');
	const modal = videoModalHld.querySelector('.js-video-modal-modal');
	openModal.addEventListener('click', () => {
		modal.classList.add('is-active');
	});
	closeModalAll.forEach(close => {
		close.addEventListener('click', () => {
			modal.classList.remove('is-active');
		});
	});
}
