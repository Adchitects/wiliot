const isBubblesSection = document.querySelector('.u-section--bubbles');
if (isBubblesSection) {
	const openModal = document.querySelector('.js-bubbles-modal-btn');
	const modal = document.querySelector('.js-bubbles-modal');
	const closeModal = document.querySelector('.js-bubbles-modal-close');

	openModal.addEventListener('click', () => {
		modal.classList.add('is-active');
	});
	closeModal.addEventListener('click', () => {
		modal.classList.remove('is-active');
	});
}
