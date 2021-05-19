const modalHldAll = document.querySelectorAll('.js-modal-hld');
modalHldAll.forEach(modalHld => {
	const modal = modalHld.querySelector('.js-modal-modal');
	const openModal = modalHld.querySelector('.js-modal-btn');
	const closeModalAll = modalHld.querySelectorAll('.js-modal-close');
	if (modal && openModal) {
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
});
