import { clearClassActive } from './utilities';

const accordionHldAll = document.querySelectorAll('.js-accordion');
accordionHldAll.forEach(accordion => {
	const accordionItemAll = accordion.querySelectorAll('.js-accordion-toggle-item');
	accordionItemAll.forEach(item => {
		item.addEventListener('click', event => {
			const clickedElement = event.target;

			// Check if clicked element or its ancestors is a link
			let isLink = false;
			let currElement = clickedElement;
			while (currElement !== item && currElement !== null) {
				if (currElement.tagName === 'A') {
					isLink = true;
					break;
				}
				currElement = currElement.parentElement;
			}

			// If a link was clicked, don't toggle the accordion item
			if (isLink) {
				return;
			}
			if (item.classList.contains('is-active')) {
				item.classList.remove('is-active');
			} else {
				clearClassActive([...accordionItemAll], 'is-active');
				item.classList.add('is-active');
			}
		});
	});
});
