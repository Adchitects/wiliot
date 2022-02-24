const careersListing = document.querySelector('.js-careers-listing');
const careersListingFiltersHld = document.querySelector('.js-careers-listing-filters-hld');
const careersListingSortHld = document.querySelector('.js-careers-listing-sort-hld');
if (careersListing) {
	const COMPANY_UID = 'F6.003';
	const TOKEN = '6F329B2DE6379829B229B2037983E8B3E8B';
	const options = {method: 'GET'};
	fetch(`https://www.comeet.co/careers-api/2.0/company/${COMPANY_UID}/positions?details=false&token=${TOKEN}`, options)
		.then(response => response.json())
		.then(offers => {
			const printOffers = () => {
				let offersHTML = '';
				offers.forEach((offer, index) => {
					console.log(index);
					offersHTML += `
					<a href="/single-career?id=${offer.uid}" class="careers-listing__item js-careers-listing-item" data-city="${offer.location.name.toLowerCase().replace(/\s/g, '')}" data-name="${offer.name.toLowerCase().replace(/\s/g, '')}">
						<div class="title u-subtitle u-subtitle--big">${offer.name}</div>
						<div class="city">${offer.location.name}</div>
						<div class="arrow icon icon-arrow-right"></div>
					</a>
					`;
				});
				careersListing.innerHTML = offersHTML;
				careersListing.classList.remove('hidden');
			};
			offers.sort((a, b) => (a.location.country > b.location.country) ? 1 : (b.location.country > a.location.country) ? -1 : 0);
			printOffers();
			// Filtering by city
			if (careersListingFiltersHld) {
				const filtersChosen = careersListingFiltersHld.querySelector('.js-careers-listing-filters-chosen');
				const filtersDropdown = careersListingFiltersHld.querySelector('.js-careers-listing-filters-dropdown');
				let filtersHTML = '';
				let cities = [];
				offers.forEach(offer => {
					if (cities.indexOf(offer.location.name) === -1) {
						cities.push(offer.location.name);
					}
				});
				filtersHTML += `<div class="filter-item js-careers-listing-filter-item-reset is-active" data-city="">All</div>`;
				cities.forEach(city => {
					filtersHTML += `<div class="filter-item js-careers-listing-filter-item" data-city="${city.toLowerCase().replace(/\s/g, '')}">${city}</div>`;
				});
				filtersDropdown.innerHTML = filtersHTML;
				let filtersChosenOpened;
				filtersChosen.addEventListener('click', (e) => {
					e.stopPropagation();
					if (!filtersChosenOpened) {
						filtersChosen.classList.add('is-active');
						filtersDropdown.classList.remove('is-hidden');
						filtersChosenOpened = true;
					} else {
						filtersChosen.classList.remove('is-active');
						filtersDropdown.classList.add('is-hidden');
						filtersChosenOpened = false;
					}
				});
				document.addEventListener('click', () => {
					filtersChosen.classList.remove('is-active');
					filtersDropdown.classList.add('is-hidden');
					filtersChosenOpened = false;
				});
				const filterItemAll = careersListingFiltersHld.querySelectorAll('.js-careers-listing-filter-item');
				const filterItemReset = careersListingFiltersHld.querySelector('.js-careers-listing-filter-item-reset');
				filterItemAll.forEach(filterItem => {
					filterItem.addEventListener('click', () => {
						if (careersListingSortHld) {
							const sortChosen = careersListingSortHld.querySelector('.js-careers-listing-sort-chosen');
							const s1 = careersListingSortHld.querySelector('.js-careers-listing-sort-item-1');
							const s2 = careersListingSortHld.querySelector('.js-careers-listing-sort-item-2');
							const s3 = careersListingSortHld.querySelector('.js-careers-listing-sort-item-3');
							const s4 = careersListingSortHld.querySelector('.js-careers-listing-sort-item-4');
							s1.style.display = 'none';
							s2.style.display = 'none';
							if (s1.classList.contains('is-active') || s2.classList.contains('is-active')) {
								if (s4.classList.contains('is-active')) {
									sortChosen.innerHTML = 'Sort: ' + s4.innerHTML;
									s4.classList.add('is-active');
								} else {
									sortChosen.innerHTML = 'Sort: ' + s3.innerHTML;
									s3.classList.add('is-active');
								}
							}
						}
						const listingItemAll = careersListing.querySelectorAll('.js-careers-listing-item');
						filterItemAll.forEach(fI => {
							fI.classList.remove('is-active');
						});
						filterItemReset.classList.remove('is-active');
						filterItem.classList.add('is-active');
						filtersChosen.innerHTML = 'Location: ' + filterItem.innerHTML;
						filtersChosen.classList.remove('is-active');
						filtersDropdown.classList.add('is-hidden');
						listingItemAll.forEach(listingItem => {
							listingItem.classList.add('is-hidden');
							if (listingItem.dataset.city === filterItem.dataset.city) {
								listingItem.classList.remove('is-hidden');
							}
						});
					});
				});
				filterItemReset.addEventListener('click', () => {
					if (careersListingSortHld) {
						const s1 = careersListingSortHld.querySelector('.js-careers-listing-sort-item-1');
						const s2 = careersListingSortHld.querySelector('.js-careers-listing-sort-item-2');
						s1.style.display = 'block';
						s2.style.display = 'block';
						if (s1.classList.contains('is-active') || s2.classList.contains('is-active')) {
							s1.classList.remove('is-active');
							s2.classList.remove('is-active');
						}
					}
					const listingItemAll = careersListing.querySelectorAll('.js-careers-listing-item');
					filterItemAll.forEach(fI => {
						fI.classList.remove('is-active');
					});
					filterItemReset.classList.add('is-active');
					filtersChosen.innerHTML = 'Location: ' + filterItemReset.innerHTML;
					listingItemAll.forEach(listingItem => {
						listingItem.classList.remove('is-hidden');
					});
					filtersChosen.classList.remove('is-active');
					filtersDropdown.classList.add('is-hidden');
				});
			}
			// Sorting
			if (careersListingSortHld) {
				const sortChosen = careersListingSortHld.querySelector('.js-careers-listing-sort-chosen');
				const sortDropdown = careersListingSortHld.querySelector('.js-careers-listing-sort-dropdown');
				let sortChosenOpened;
				sortChosen.addEventListener('click', (e) => {
					e.stopPropagation();
					if (!sortChosenOpened) {
						sortChosen.classList.add('is-active');
						sortDropdown.classList.remove('is-hidden');
						sortChosenOpened = true;
					} else {
						sortChosen.classList.remove('is-active');
						sortDropdown.classList.add('is-hidden');
						sortChosenOpened = false;
					}
				});
				document.addEventListener('click', () => {
					sortChosen.classList.remove('is-active');
					sortDropdown.classList.add('is-hidden');
					sortChosenOpened = false;
				});
				const filterItemAll = careersListingFiltersHld.querySelectorAll('.js-careers-listing-filter-item');
				const filterActive = () => {
					filterItemAll.forEach(filterItem => {
						if (filterItem.classList.contains('is-active')) {
							const listingItemAll = careersListing.querySelectorAll('.js-careers-listing-item');
							listingItemAll.forEach(listingItem => {
								listingItem.classList.add('is-hidden');
								if (listingItem.dataset.city === filterItem.dataset.city) {
									listingItem.classList.remove('is-hidden');
								}
							});
						}
					});
				};
				// Country A to Z
				const s1 = careersListingSortHld.querySelector('.js-careers-listing-sort-item-1');
				s1.addEventListener('click', () => {
					offers.sort((a, b) => (a.location.country > b.location.country) ? 1 : (b.location.country > a.location.country) ? -1 : 0);
					printOffers();
					sortChosen.innerHTML = 'Sort: ' + s1.innerHTML;
					s2.classList.remove('is-active');
					s3.classList.remove('is-active');
					s4.classList.remove('is-active');
					s1.classList.add('is-active');
				});
				// Country Z to A
				const s2 = careersListingSortHld.querySelector('.js-careers-listing-sort-item-2');
				s2.addEventListener('click', () => {
					offers.sort((a, b) => (b.location.country > a.location.country) ? 1 : (a.location.country > b.location.country) ? -1 : 0);
					printOffers();
					sortChosen.innerHTML = 'Sort: ' + s2.innerHTML;
					s1.classList.remove('is-active');
					s3.classList.remove('is-active');
					s4.classList.remove('is-active');
					s2.classList.add('is-active');
				});
				// Job title A to Z
				const s3 = careersListingSortHld.querySelector('.js-careers-listing-sort-item-3');
				s3.addEventListener('click', () => {
					offers.sort((a, b) => (a.name > b.name) ? 1 : (b.name > a.name) ? -1 : 0);
					printOffers();
					sortChosen.innerHTML = 'Sort: ' + s3.innerHTML;
					s1.classList.remove('is-active');
					s2.classList.remove('is-active');
					s4.classList.remove('is-active');
					s3.classList.add('is-active');
					if (careersListingFiltersHld) {
						filterActive();
					}
				});
				// Job title Z to A
				const s4 = careersListingSortHld.querySelector('.js-careers-listing-sort-item-4');
				s4.addEventListener('click', () => {
					offers.sort((a, b) => (b.name > a.name) ? 1 : (a.name > b.name) ? -1 : 0);
					printOffers();
					sortChosen.innerHTML = 'Sort: ' + s4.innerHTML;
					s1.classList.remove('is-active');
					s2.classList.remove('is-active');
					s3.classList.remove('is-active');
					s4.classList.add('is-active');
					if (careersListingFiltersHld) {
						filterActive();
					}
				});
			}
		})
		.catch(err => console.error(err));
}
