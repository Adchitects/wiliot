const popup = document.querySelector('.js-popup');
if (popup) {
	const closeBtnAll = popup.querySelectorAll('.js-popup-close');
	const closeIcon = popup.querySelector('.js-popup-close-icon');
	closeBtnAll.forEach(closeBtn => {
		closeBtn.addEventListener('click', () => {
			localStorage.setItem('popup', 'shown');
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
	document.onkeydown = function(evt) {
		evt = evt || window.event;
		let isEscape = false;
		if ('key' in evt) {
			isEscape = (evt.key === 'Escape' || evt.key === 'Esc');
		} else {
			isEscape = (evt.keyCode === 27);
		}
		if (isEscape) {
			localStorage.setItem('popup', 'shown');
			popup.classList.remove('is-active');
			document.body.style.overflow = '';
		}
	};
	if (!localStorage.getItem('popup')) {
		popup.classList.add('is-active');
		document.body.style.overflow = 'hidden';
	} else {
		popup.classList.remove('is-active');
	}
}
