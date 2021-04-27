window.addEventListener('load', () => {
	const fields = document.querySelectorAll('.field input');
	const selects = document.querySelectorAll('.hs-fieldtype-select select');

	if (fields && fields.length > 0) {
		fields.forEach(field => {
			field.addEventListener('input', () => {
				field.parentNode.parentNode.classList.add('is-active');
				if (!field.value) {
					field.parentNode.parentNode.classList.remove('is-active');
				}
			});
		});
	}
	if (selects && selects.length > 0) {
		selects.forEach(select => {
			select.addEventListener('change', () => {
				select.parentNode.parentNode.classList.add('is-active');
			});
		});
	}
});
