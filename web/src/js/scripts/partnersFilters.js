const partnersFiltersHld = document.querySelector('.js-partners-filters-hld');
if (partnersFiltersHld) {
	const filterAll = partnersFiltersHld.querySelectorAll('.js-partners-filters-filter');
	const itemAll = partnersFiltersHld.querySelectorAll('.js-partners-filters-item');
	const btnApplyFilter = partnersFiltersHld.querySelector('.js-partners-filters-apply-btn');
	const btnResetFilter = partnersFiltersHld.querySelector('.js-partners-filters-reset-btn');
	// let activeFilters = [];
	filterAll.forEach(filter => {
		const filterDataCategory = filter.dataset.category;
		let isActive = false;
		filter.addEventListener('click', () => {
			if (!isActive) {
				isActive = true;
				filter.classList.add('is-active');
				// activeFilters.push(filterDataCategory);
				itemAll.forEach(item => {
					if (item.getAttribute('data-' + filterDataCategory)) {
						item.dataset.checked = true;
					}
				});
				// console.log(activeFilters);
			} else {
				isActive = false;
				filter.classList.remove('is-active');
				// const filterIndex = activeFilters.indexOf(filterDataCategory);
				// activeFilters.splice(filterIndex, 1);
				itemAll.forEach(item => {
					if (item.getAttribute('data-' + filterDataCategory)) {
						item.dataset.checked = false;
					}
				});
			}
		});
		btnApplyFilter.addEventListener('click', () => {
			itemAll.forEach(item => {
				item.style.display = 'none';
				if (item.dataset.checked === 'true') {
					item.style.display = 'block';
				}
			});
		});
		btnResetFilter.addEventListener('click', () => {
			itemAll.forEach(item => {
				item.style.display = 'block';
			});
		});
	});
}
