const partnersFiltersHld = document.querySelector('.js-partners-filters-hld');
if (partnersFiltersHld) {
	const itemAll = partnersFiltersHld.querySelectorAll('.js-partners-filters-item');
	const filterAll = partnersFiltersHld.querySelectorAll('.js-partners-filters-filter');
	const partnersItemsHld = partnersFiltersHld.querySelector('.js-partners-items-hld');
	const filtersCategoryType = partnersFiltersHld.querySelectorAll('.js-partners-filters-category[data-filters-category="type"] .js-partners-filters-filter');
	const filtersCategoryService = partnersFiltersHld.querySelectorAll('.js-partners-filters-category[data-filters-category="service"] .js-partners-filters-filter');
	const filtersCategoryRegion = partnersFiltersHld.querySelectorAll('.js-partners-filters-category[data-filters-category="region"] .js-partners-filters-filter');
	const filtersCategoryExpertise = partnersFiltersHld.querySelectorAll('.js-partners-filters-category[data-filters-category="expertise"] .js-partners-filters-filter');
	const activeFilterAll = partnersFiltersHld.querySelectorAll('.js-partners-filters-active');
	const activeFilterEverything = partnersFiltersHld.querySelector('.js-partners-filters-active-everything');
	const filterEverything = partnersFiltersHld.querySelector('.js-partners-filters-filter-everything');
	// const btnApplyFilter = partnersFiltersHld.querySelector('.js-partners-filters-apply-btn');
	// const btnResetFilter = partnersFiltersHld.querySelector('.js-partners-filters-reset-btn');
	const resultsNumber = partnersFiltersHld.querySelector('.js-partners-filters-results-number');
	let autoFilterTimeout;
	const scrollToFiltersTop = () => {
		window.scrollTo({
			top: partnersFiltersHld.getBoundingClientRect().top - document.body.getBoundingClientRect().top - 100,
			left: 0,
			behavior: 'smooth',
		});
	};
	const filterThemThings = () => {
		// HANDLE WHAT SHOULD BE VISIBLE
		let filtersCategoryTypeToCheck = [];
		filtersCategoryType.forEach(item => {
			if (item.classList.contains('is-active')) {
				filtersCategoryTypeToCheck.push(item.dataset.category);
			}
		});
		let filtersCategoryServiceToCheck = [];
		filtersCategoryService.forEach(item => {
			if (item.classList.contains('is-active')) {
				filtersCategoryServiceToCheck.push(item.dataset.category);
			}
		});
		let filtersCategoryRegionToCheck = [];
		filtersCategoryRegion.forEach(item => {
			if (item.classList.contains('is-active')) {
				filtersCategoryRegionToCheck.push(item.dataset.category);
			}
		});
		let filtersCategoryExpertiseToCheck = [];
		filtersCategoryExpertise.forEach(item => {
			if (item.classList.contains('is-active')) {
				filtersCategoryExpertiseToCheck.push(item.dataset.category);
			}
		});

		itemAll.forEach(item => {
			let typeApproved = false;
			let serviceApproved = false;
			let regionApproved = false;
			let expertiseApproved = false;

			if (filtersCategoryTypeToCheck.length) {
				filtersCategoryTypeToCheck.forEach(activeFilter => {
					if (item.getAttribute('data-' + activeFilter) === '1') {
						typeApproved = true;
					}
				});
			} else {
				typeApproved = true;
			}

			if (filtersCategoryServiceToCheck.length) {
				filtersCategoryServiceToCheck.forEach(activeFilter => {
					if (item.getAttribute('data-' + activeFilter) === '1') {
						serviceApproved = true;
					}
				});
			} else {
				serviceApproved = true;
			}

			if (filtersCategoryRegionToCheck.length) {
				filtersCategoryRegionToCheck.forEach(activeFilter => {
					if (item.getAttribute('data-' + activeFilter) === '1') {
						regionApproved = true;
					}
				});
			} else {
				regionApproved = true;
			}

			if (filtersCategoryExpertiseToCheck.length) {
				filtersCategoryExpertiseToCheck.forEach(activeFilter => {
					if (item.getAttribute('data-' + activeFilter) === '1') {
						expertiseApproved = true;
					}
				});
			} else {
				expertiseApproved = true;
			}

			if (typeApproved && serviceApproved && regionApproved && expertiseApproved) {
				item.dataset.checked = 'true';
			} else {
				item.dataset.checked = 'false';
			}
		});

		// MAKE THE VISIBILITY HAPPEN
		let results = [];
		itemAll.forEach(item => {
			item.style.display = 'none';
			if (item.dataset.checked === 'true') {
				item.style.display = 'block';
				results.push(item);
			}
		});
		resultsNumber.innerHTML = results.length;

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
		scrollToFiltersTop();

		if (results.length < 1) {
			let noResultsInfo = document.createElement('div');
        	noResultsInfo.classList.add('partners-listing__no-results');
			noResultsInfo.innerText = 'There are no partners fulfilling all the chosen criteria.';
			partnersItemsHld.append(noResultsInfo);
		} else {
			let noResultsInfo = partnersItemsHld.querySelector('.partners-listing__no-results');
			if (noResultsInfo) {
				noResultsInfo.remove();
			}
		}
	};
	// const resetFilters = () => {
	// 	resultsNumber.innerHTML = itemAll.length;
	// 	activeFilterEverything.classList.add('is-chosen');
	// 	itemAll.forEach(item => {
	// 		item.style.display = 'block';
	// 	});
	// 	// Reset isActive state for filters
	// 	filterAll.forEach(filter => {
	// 		filter.classList.remove('is-active');
	// 	});
	// 	activeFilterAll.forEach(activeFilter => {
	// 		activeFilter.classList.remove('is-chosen');
	// 	});
	// 	// Activate Everything filter
	// 	filterEverything.classList.add('is-active');
	// 	itemAll.forEach(item => {
	// 		item.dataset.checked = true;
	// 	});
	// 	scrollToFiltersTop();
	// };
	itemAll.forEach(item => {
		item.dataset.checked = true;
		resultsNumber.innerHTML = itemAll.length;
	});
	filterEverything.addEventListener('click', () => {
		if (!filterEverything.classList.contains('is-active')) {
			// Reset isActive state for filters
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
		clearTimeout(autoFilterTimeout);
		filterThemThings();
	});
	filterAll.forEach(filter => {
		// const filterDataCategory = filter.dataset.category;
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
				// // Activate checked filter
				// itemAll.forEach(item => {
				// 	if (item.getAttribute('data-' + filterDataCategory)) {
				// 		item.dataset.checked = true;
				// 	}
				// });
			} else {
				filter.classList.remove('is-active');
				// itemAll.forEach(item => {
				// 	if (item.getAttribute('data-' + filterDataCategory)) {
				// 		item.dataset.checked = false;
				// 	}
				// });
				let atLeastOneIsActive = false;
				filterAll.forEach(f => {
					if (f.classList.contains('is-active')) {
						atLeastOneIsActive = true;
					}
				});
				if (!atLeastOneIsActive) {
					// Activate Everything filter
					filterEverything.classList.add('is-active');
					// itemAll.forEach(item => {
					// 	item.dataset.checked = true;
					// });
				}
			}
			clearTimeout(autoFilterTimeout);
			autoFilterTimeout = setTimeout(() => {
				filterThemThings();
			}, 1000);
		});
	});

	// btnApplyFilter.addEventListener('click', () => {
	// 	filterThemThings();
	// });
	// btnResetFilter.addEventListener('click', () => {
	// 	resetFilters();
	// });
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
				activeFilterEverything.classList.add('is-chosen');
				filterEverything.classList.add('is-active');
				// itemAll.forEach(item => {
				// 	item.dataset.checked = true;
				// });
			}
			clearTimeout(autoFilterTimeout);
			autoFilterTimeout = setTimeout(() => {
				filterThemThings();
			}, 1000);
		});
	});
}
