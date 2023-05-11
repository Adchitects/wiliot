import { clearClassActive } from './utilities';
const accordionHldAll = document.querySelectorAll('.js-accordion');
accordionHldAll.forEach(accordion => {
	console.log('accordion');
	const accordionItemAll = accordion.querySelectorAll('.js-accordion-toggle-item');
	console.log(accordion.querySelector('.js-accordion-toggle-item'));
	accordionItemAll.forEach(item => {
		item.addEventListener('click', () => {
			console.log('click');
			if (item.classList.contains('is-active')) {
				item.classList.remove('is-active');
			} else {
				clearClassActive([...accordionItemAll], 'is-active');
				item.classList.toggle('is-active');
			}
		});
	});
});
