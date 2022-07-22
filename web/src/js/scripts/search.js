const searchHldAll = document.querySelectorAll('.js-search-hld');
searchHldAll.forEach(hld => {
	const input  = hld.querySelector('.js-search-input');
	input.addEventListener('input', () => {
		if (input.value !== '') {
			hld.classList.add('is-active');
		} else {
			hld.classList.remove('is-active');
		}
	});
});
const searchCountAll = document.querySelectorAll('.js-search-count-hld');
searchCountAll.forEach(countHld => {
	const input = countHld.querySelector('.js-search-count-input');
	const output = countHld.querySelector('.js-search-count-output');
	if (input && output) {
		output.innerHTML = input.value;
	}
});
