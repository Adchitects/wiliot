const modalHldAll = document.querySelectorAll('.js-modal-hld');
modalHldAll.forEach(modalHld => {
	const modal = modalHld.querySelector('.js-modal-modal');
	const openModal = modalHld.querySelector('.js-modal-btn');
	const closeModalAll = modalHld.querySelectorAll('.js-modal-close');
	const iframe = modalHld.querySelector('.js-modal-iframe');
	if (modal && openModal) {
		openModal.addEventListener('click', () => {
			modal.classList.add('is-active');
			document.body.style.overflow = 'hidden';
			if (iframe) {
				iframe.src = iframe.dataset.src;
			}
		});
		closeModalAll.forEach(close => {
			close.addEventListener('click', () => {
				modal.classList.remove('is-active');
				document.body.style.overflow = '';
				if (iframe) {
					iframe.src = '';
				}
			});
		});
	}
});
