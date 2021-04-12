import { clearClassActive } from './utilities';
const accordion = document.querySelector('.accordion');

if (accordion) {
	const accordionItems = document.querySelectorAll('.js-accordion-toggle-item');
	const accordionList = document.querySelector('.js-accordion-list');


	accordionItems.forEach(item => {
		item.addEventListener('click', () => {
			if (item.classList.contains('is-active')) {
				item.classList.remove('is-active');
			} else {
				clearClassActive([...accordionItems], 'is-active');
				item.classList.toggle('is-active');
			}
		});
	});

	document.addEventListener('click', (e) => {
		let targetElement = e.target;

		let isClickInside = accordionList.contains(targetElement);

		if (!isClickInside) {
			clearClassActive([...accordionItems], 'is-active');
		}
	});
}
