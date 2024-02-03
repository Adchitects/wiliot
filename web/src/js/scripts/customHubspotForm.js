const wrapElement = function(el, wrapperSelector, wrapperClass) {
	if (!el.parentNode.classList.contains(wrapperClass)) {
		const wrapper = document.createElement(wrapperSelector);
		wrapper.classList.add(wrapperClass);
		el.parentNode.insertBefore(wrapper, el);
		wrapper.appendChild(el);
	}
};

const handleState = (formEl, shortenSelects) => {
	const checkboxes = formEl.querySelectorAll('.hs-fieldtype-checkbox');
	if (shortenSelects) {
		// create multi-select container for checkboxes if there are many options to select
		if (checkboxes && checkboxes.length > 0) {
			checkboxes.forEach(checkbox => {
				if (!checkbox.classList.contains('is-shortened')) {
					const multiContainer = checkbox.querySelector('.multi-container');
					if (multiContainer) {
						const items = multiContainer.querySelectorAll('.hs-form-checkbox');
						if (items && items.length > 5) {
							checkbox.classList.add('is-shortened');
							const container = checkbox.querySelector('.input');
							if (container) {
								// container.addEventListener('click', (e) => {
								// 	e.stopPropagation();
								// });
								// add select with clicking event for toggling dropdown
								let selectToInsert = document.createElement('div');
								selectToInsert.classList.add('multi-select-btn');
								selectToInsert.innerHTML = `<span class="text">Please select</span>`;
								container.insertBefore(selectToInsert, container.firstChild);
								selectToInsert.addEventListener('click', () => {
									if (checkbox.classList.contains('is-dropdown-open')) {
										checkbox.classList.remove('is-dropdown-open');
									} else {
										checkboxes.forEach(checkboxDeeper => {
											checkboxDeeper.classList.remove('is-dropdown-open');
										});
										checkbox.classList.add('is-dropdown-open');
									}
								});
								// transform container + add buttons
								wrapElement(multiContainer, 'div', 'multi-container-hld');
								const multiContainerHld = checkbox.querySelector('.multi-container-hld');
								let buttonsToInsert = document.createElement('div');
								buttonsToInsert.classList.add('multi-container-buttons');
								buttonsToInsert.innerHTML = `<div class="multi-container-button multi-container-button--clear js-multi-container-clear"><span class="text">Clear</span></div><div class="multi-container-button multi-container-button--done js-multi-container-done"><span class="text">Done</span></div>`;
								multiContainerHld.appendChild(buttonsToInsert);
								// add event listeners for buttons
								const clearBtn = checkbox.querySelector('.js-multi-container-clear');
								clearBtn.addEventListener('click', () => {
									inputs.forEach(input => {
										input.checked = false;
										input.parentNode.parentNode.classList.remove('is-active');
									});
									const inputText = selectToInsert.querySelector('.text');
									inputText.innerHTML = 'Please select';
									inputText.classList.remove('is-active');
								});
								const doneBtn = checkbox.querySelector('.js-multi-container-done');
								doneBtn.addEventListener('click', () => {
									checkbox.classList.remove('is-dropdown-open');
								});
								// add event listeners for checkboxes, check on click, and on page load, because HS forms remember some of the choices
								const inputs = multiContainer.querySelectorAll('input');
								let activeInputsBefore = 0;
								const inputText = selectToInsert.querySelector('.text');
								inputs.forEach(input => {
									if (input.checked) {
										input.parentNode.parentNode.classList.add('is-active');
										activeInputsBefore++;
									}
									input.addEventListener('change', () => {
										let activeInputs = 0;
										if (input.checked) {
											input.parentNode.parentNode.classList.add('is-active');
										} else {
											input.parentNode.parentNode.classList.remove('is-active');
										}
										inputs.forEach(inputDeeper => {
											if (inputDeeper.checked) {
												activeInputs++;
											}
										});
										if (activeInputs > 0) {
											inputText.innerHTML = `<span class="count">${activeInputs}</span> Options selected`;
											inputText.classList.add('is-active');
										} else {
											inputText.innerHTML = 'Please select';
											inputText.classList.remove('is-active');
										}
									});
								});
								if (activeInputsBefore > 0) {
									inputText.innerHTML = `<span class="count">${activeInputsBefore}</span> Options selected`;
									inputText.classList.add('is-active');
								}
							}
						}
					}
				}
			});
		}
	}
	const fields = formEl.querySelectorAll('.field:not(.is-shortened) input');
	const selects = formEl.querySelectorAll('.hs-fieldtype-select select');
	if (fields && fields.length > 0) {
		fields.forEach(field => {
			field.parentNode.parentNode.classList.add('is-active');
			if (!field.value) {
				field.parentNode.parentNode.classList.remove('is-active');
			}
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
				handleState(formEl);
			});
		});
	}
};

document.addEventListener('customHubspotFormScripts', (event) => {
	const detail = event.detail;
	const formEl = detail.form;
	const shortenSelects = detail.shortenSelects;
	handleState(formEl, shortenSelects);

	const body = document.querySelector('body');

	body.addEventListener('click', (e) => {
		if (!e.target.closest('.is-shortened')) {
			const openedDropdowns = document.querySelectorAll('.hs-fieldtype-checkbox.is-dropdown-open');
			if (openedDropdowns) {
				openedDropdowns.forEach(openedDropdown => {
					openedDropdown.classList.remove('is-dropdown-open');
				});
			}
		}
	});
});
