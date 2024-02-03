const typeformButtons = document.querySelectorAll('[data-tf-popup]');

if (typeformButtons) {
	typeformButtons.forEach(button => {
		button.addEventListener('click', () => {
			/* eslint-disable */
			gtag('event', 'TypeformOpen', {'event_category': 'SFck2QZD', 'event_label': 'Typeform Modal Opened', 'value': '0'});
            /* eslint-enable */
		});
	});
}
