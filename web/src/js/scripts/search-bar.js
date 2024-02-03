const searchBarHld = document.querySelector('.js-search-bar-hld');
if (searchBarHld) {
	const searchBar = searchBarHld.querySelector('.js-search-bar');
	const closeButton = searchBarHld.querySelector('.js-search-bar-close-button');
	const searchBarInput = searchBarHld.querySelector('.js-algolia-form-input');
	const closeResults = () => {
		searchBarInput.value = '';
		searchBarInput.focus();
	};
	document.addEventListener('click', (e) => {
		if (!searchBar.contains(e.target)) {
			searchBar.classList.remove('is-visible');
		}
	});
	document.addEventListener('scroll', () => {
		if (!searchBar.classList.contains('is-visible')) {
			return;
		}
		searchBar.classList.remove('is-visible');
	});
	closeButton.addEventListener('click', closeResults);
	document.onkeydown = function(evt) {
		evt = evt || window.event;
		let isEscape = false;
		if ('key' in evt) {
			isEscape = (evt.key === 'Escape' || evt.key === 'Esc');
		} else {
			isEscape = (evt.keyCode === 27);
		}
		if (isEscape) {
			closeResults();
		}
	};
}
