import { clearClassActive } from './utilities';
const accordionHldAll = document.querySelectorAll('.js-accordion');
accordionHldAll.forEach(accordion => {
	const accordionItemAll = accordion.querySelectorAll('.js-accordion-toggle-item');
	accordionItemAll.forEach(item => {
		item.addEventListener('click', () => {
			if (item.classList.contains('is-active')) {
				item.classList.remove('is-active');
			} else {
				clearClassActive([...accordionItemAll], 'is-active');
				item.classList.toggle('is-active');
			}
		});
	});
});
