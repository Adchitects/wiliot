const isTwoColumnsSection = document.querySelector('.js-section-two-columns');
if (isTwoColumnsSection) {
	const openModal = document.querySelector('.js-two-columns-modal-btn');
	const modal = document.querySelector('.js-two-columns-modal');
	const closeModal = document.querySelector('.js-two-columns-modal-close');

	openModal.addEventListener('click', () => {
		modal.classList.add('is-active');
	});
	closeModal.addEventListener('click', () => {
		modal.classList.remove('is-active');
	});
}
