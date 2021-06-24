import { clearClassActive } from './utilities';
const accordionHldAll = document.querySelectorAll('.js-accordion');

accordionHldAll.forEach(accordion => {
	const accordionItems = accordion.querySelectorAll('.js-accordion-toggle-item');
	// const accordionList = accordion.querySelector('.js-accordion-list');
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
	// document.addEventListener('click', (e) => {
	// 	console.log(accordionList);
	// 	let targetElement = e.target;
	// 	let isClickInside = accordionList.contains(targetElement);
	// 	if (!isClickInside) {
	// 		clearClassActive([...accordionItems], 'is-active');
	// 	}
	// });
});
