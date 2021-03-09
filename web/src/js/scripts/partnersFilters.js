const partnersFiltersHld = document.querySelector('.js-partners-filters-hld');
if (partnersFiltersHld) {
	const itemAll = partnersFiltersHld.querySelectorAll('.js-partners-filters-item');
	const filterAll = partnersFiltersHld.querySelectorAll('.js-partners-filters-filter');
	const activeFilterAll = partnersFiltersHld.querySelectorAll('.js-partners-filters-active');
	const activeFilterEverything = partnersFiltersHld.querySelector('.js-partners-filters-active-everything');
	const filterEverything = partnersFiltersHld.querySelector('.js-partners-filters-filter-everything');
	const btnApplyFilter = partnersFiltersHld.querySelector('.js-partners-filters-apply-btn');
	const btnResetFilter = partnersFiltersHld.querySelector('.js-partners-filters-reset-btn');
	itemAll.forEach(item => {
		item.dataset.checked = true;
	});
	filterEverything.addEventListener('click', () => {
		if (!filterEverything.classList.contains('is-active')) {
			// // Reset isActive state for filters
			filterAll.forEach(filter => {
				filter.classList.remove('is-active');
			});
			itemAll.forEach(item => {
				item.dataset.checked = false;
			});
			// Activate Everything filter
			filterEverything.classList.add('is-active');
			itemAll.forEach(item => {
				item.dataset.checked = true;
			});
		} 
		// else {
		// 	filterEverything.classList.remove('is-active');
		// 	itemAll.forEach(item => {
		// 		item.dataset.checked = false;
		// 	});
		// }
	});
	filterAll.forEach(filter => {
		const filterDataCategory = filter.dataset.category;
		filter.addEventListener('click', () => {
			// Reset isEverythingActive state
			if (filterEverything.classList.contains('is-active')) {
				filterEverything.classList.remove('is-active');
				itemAll.forEach(item => {
					item.dataset.checked = false;
				});
			}
			if (!filter.classList.contains('is-active')) {
				filter.classList.add('is-active');
				// Activate checked filter
				itemAll.forEach(item => {
					if (item.getAttribute('data-' + filterDataCategory)) {
						item.dataset.checked = true;
					}
				});
			} else {
				filter.classList.remove('is-active');
				itemAll.forEach(item => {
					if (item.getAttribute('data-' + filterDataCategory)) {
						item.dataset.checked = false;
					}
				});
				let atLeastOneIsActive = false;
				filterAll.forEach(f => {
					if (f.classList.contains('is-active')) {
						atLeastOneIsActive = true;
					} 
				});
				if (!atLeastOneIsActive) {
					// Activate Everything filter
					filterEverything.classList.add('is-active');
					itemAll.forEach(item => {
						item.dataset.checked = true;
					});
				}
			}
		});
	});
	btnApplyFilter.addEventListener('click', () => {
		itemAll.forEach(item => {
			item.style.display = 'none';
			if (item.dataset.checked === 'true') {
				item.style.display = 'block';
			}
		});
		activeFilterAll.forEach(activeFilter => {
			const activeFilterDataCategory = activeFilter.dataset.category;
			activeFilter.classList.remove('is-chosen');
			filterAll.forEach(filter => {
				if (filter.classList.contains('is-active')) {
					const filterDataCategory = filter.dataset.category;
					if (filterDataCategory === activeFilterDataCategory) {
						activeFilterEverything.classList.remove('is-chosen');
						activeFilter.classList.add('is-chosen');
					}
				}
				if (filterEverything.classList.contains('is-active')) {
					activeFilterEverything.classList.add('is-chosen');
				}
			});
		});
	});
	btnResetFilter.addEventListener('click', () => {
		activeFilterEverything.classList.add('is-chosen');
		itemAll.forEach(item => {
			item.style.display = 'block';
		});
		// // Reset isActive state for filters
		filterAll.forEach(filter => {
			filter.classList.remove('is-active');
		});
		activeFilterAll.forEach(activeFilter => {
			activeFilter.classList.remove('is-chosen');
		});
		// Activate Everything filter
		filterEverything.classList.add('is-active');
		itemAll.forEach(item => {
			item.dataset.checked = true;
		});
	});
	activeFilterAll.forEach(activeFilter => {
		const activeFilterDataCategory = activeFilter.dataset.category;
		activeFilter.addEventListener('click', () => {
			activeFilter.classList.remove('is-chosen');
			filterAll.forEach(filter => {
				if (filter.classList.contains('is-active')) {
					const filterDataCategory = filter.dataset.category;
					if (filterDataCategory === activeFilterDataCategory) {
						filter.classList.remove('is-active');
					}
				}
			});
			itemAll.forEach(item => {
				if (item.getAttribute('data-' + activeFilterDataCategory)) {
					item.dataset.checked = false;
				}
			});
			let atLeastOneIsActive = false;
			filterAll.forEach(f => {
				if (f.classList.contains('is-active')) {
					atLeastOneIsActive = true;
				} 
			});
			if (!atLeastOneIsActive) {
				// Activate Everything filter
				filterEverything.classList.add('is-active');
				itemAll.forEach(item => {
					item.dataset.checked = true;
				});
			}
		});
	});
}
