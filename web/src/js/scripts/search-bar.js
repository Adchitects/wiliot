const searchBarHld = document.querySelector('.js-search-bar-hld');
if (searchBarHld) {
	const bar = searchBarHld.querySelector('.js-search-bar');
	const openButton = searchBarHld.querySelector('.js-search-bar-open-button');
	const closeButton = searchBarHld.querySelector('.js-search-bar-close-button');
	const searchBarInput = searchBarHld.querySelector('.js-search-form-input');
	const toggleBar = () => {
		bar.classList.toggle('is-visible');
		if (bar.classList.contains('is-visible')) {
			searchBarInput.focus();
		} else {
			searchBarInput.blur();
		}
	};
	openButton.addEventListener('click', toggleBar);
	closeButton.addEventListener('click', toggleBar);
	document.onkeydown = function(evt) {
		evt = evt || window.event;
		let isEscape = false;
		if ('key' in evt) {
			isEscape = (evt.key === 'Escape' || evt.key === 'Esc');
		} else {
			isEscape = (evt.keyCode === 27);
		}
		if (isEscape) {
			toggleBar();
		}
	};
}
