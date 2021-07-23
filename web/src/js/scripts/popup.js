const popup = document.querySelector('.js-popup');
if (popup) {
	const closeBtnAll = popup.querySelectorAll('.js-popup-close');
	const closeIcon = popup.querySelector('.js-popup-close-icon');
	closeBtnAll.forEach(closeBtn => {
		closeBtn.addEventListener('click', () => {
			popup.classList.remove('is-active');
			document.body.style.overflow = '';
		});
		closeBtn.addEventListener('mouseenter', () => {
			closeIcon.style.color = '#000000';
		});
		closeBtn.addEventListener('mouseleave', () => {
			closeIcon.style.color = '';
		});
	});
	if (!localStorage.getItem('popup')) {
		localStorage.setItem('popup', 'shown');
		popup.classList.add('is-active');
		document.body.style.overflow = 'hidden';
	} else {
		popup.classList.remove('is-active');
	}
}
