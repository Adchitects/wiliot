const cookieBox = document.querySelector('.js-cookie-box');
const cookieBoxAccept = document.querySelector('.js-cookie-box-accept');

if (cookieBox && cookieBoxAccept) {
	if (localStorage.getItem('cookiesAccepted') !== 'true') {
		cookieBox.classList.add('is-active');
	}
	cookieBoxAccept.addEventListener('click', () => {
		localStorage.setItem('cookiesAccepted', 'true');
		cookieBox.classList.remove('is-active');
	});
}
