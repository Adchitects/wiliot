const mainFuncion = () => {
	const modalHldAll = document.querySelectorAll('.js-hero-modal-hld');
	modalHldAll.forEach(modalHld => {
		const modalAll = document.querySelectorAll('.js-hero-modal-modal');
		const openModal = modalHld.querySelector('.js-hero-modal-btn');
		const closeModalAll = document.querySelectorAll('.js-hero-modal-close');
		if (openModal) {
			openModal.addEventListener('click', () => {
				const buttonId = openModal.dataset.modalId;
				modalAll.forEach(modal => {
					if (buttonId === modal.dataset.modalId) {
						modal.classList.add('is-active');
						const iframe = modal.querySelector('.js-hero-modal-iframe');
						if (iframe) {
							iframe.src = iframe.dataset.source;
						}
					}
				});
				document.body.style.overflow = 'hidden';
			});
			closeModalAll.forEach(close => {
				close.addEventListener('click', () => {
					modalAll.forEach(modal => {
						modal.classList.remove('is-active');
						const iframe = modal.querySelector('.js-hero-modal-iframe');
						if (iframe) {
							iframe.src = '';
						}
					});
					document.body.style.overflow = '';
				});
			});
		}
	});
};

window.addEventListener('load', mainFuncion);
export const heroSliderModalLoad = mainFuncion;
