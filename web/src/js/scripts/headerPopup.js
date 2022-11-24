const headerPopups = document.querySelectorAll('.js-header-popup-hld');
const headerPopupsClose = document.querySelectorAll('.js-header-popup-close');

if (headerPopups && headerPopupsClose) {
	headerPopupsClose.forEach(closeBtn => {
		closeBtn.addEventListener('click', () => {
			headerPopups.forEach(headerPopup => {
				headerPopup.remove();
			});
		});
	});
}
