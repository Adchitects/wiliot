const videoModalHld = document.querySelector('.js-modal-hld');
if (videoModalHld) {
	const closeModalAll = videoModalHld.querySelectorAll('.js-modal-close');
	const openModal = videoModalHld.querySelector('.js-modal-btn');
	const modal = videoModalHld.querySelector('.js-modal-modal');
	openModal.addEventListener('click', () => {
		modal.classList.add('is-active');
		document.body.style.overflow = 'hidden';
	});
	closeModalAll.forEach(close => {
		close.addEventListener('click', () => {
			modal.classList.remove('is-active');
			document.body.style.overflow = '';
		});
	});
}
