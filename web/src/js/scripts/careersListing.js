const careersListing = document.querySelector('.js-careers-listing');
const careersListingFiltersHld = document.querySelector('.js-careers-listing-filters-hld');
const careersListingSortsHld = document.querySelector('.js-careers-listing-sort-hld');
if (careersListing) {
	const COMPANY_UID = 'F6.003';
	const TOKEN = '6F329B2DE6379829B229B2037983E8B3E8B';
	const options = {method: 'GET'};
	fetch(`https://www.comeet.co/careers-api/2.0/company/${COMPANY_UID}/positions?details=false&token=${TOKEN}`, options)
		.then(response => response.json())
		.then(offers => {
			const printOffers = () => {
				let offersHTML = '';
				offers.forEach(offer => {
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
			printOffers();
			// Filtering by city
			if (careersListingFiltersHld) {
				const filtersChosen = careersListingFiltersHld.querySelector('.js-careers-listing-filters-chosen');
				const filtersDropdown = careersListingFiltersHld.querySelector('.js-careers-listing-filters-dropdown');
				let filtersHTML = '';
				let cities = [];
				offers.forEach(offer => {
					console.log(offer);
					if (cities.indexOf(offer.location.name) === -1) {
						cities.push(offer.location.name);
					}
				});
				filtersHTML += `<div class="filter-item js-careers-listing-filter-item-reset is-active" data-city="">All locations</div>`;
				cities.forEach(city => {
					filtersHTML += `<div class="filter-item js-careers-listing-filter-item" data-city="${city.toLowerCase().replace(/\s/g, '')}">${city}</div>`;
				});
				filtersDropdown.innerHTML = filtersHTML;
				filtersChosen.addEventListener('click', (e) => {
					e.stopPropagation();
					filtersChosen.classList.add('is-active');
					filtersDropdown.classList.remove('is-hidden');
				});
				document.addEventListener('click', () => {
					filtersChosen.classList.remove('is-active');
					filtersDropdown.classList.add('is-hidden');
				});
				const filterItemAll = careersListingFiltersHld.querySelectorAll('.js-careers-listing-filter-item');
				const filterItemReset = careersListingFiltersHld.querySelector('.js-careers-listing-filter-item-reset');
				filterItemAll.forEach(filterItem => {
					filterItem.addEventListener('click', () => {
						const listingItemAll = careersListing.querySelectorAll('.js-careers-listing-item');
						filterItemAll.forEach(fI => {
							fI.classList.remove('is-active');
						});
						filterItemReset.classList.remove('is-active');
						filterItem.classList.add('is-active');
						filtersChosen.innerHTML = filterItem.innerHTML;
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
					const listingItemAll = careersListing.querySelectorAll('.js-careers-listing-item');
					filterItemAll.forEach(fI => {
						fI.classList.remove('is-active');
					});
					filterItemReset.classList.add('is-active');
					filtersChosen.innerHTML = filterItemReset.innerHTML;
					listingItemAll.forEach(listingItem => {
						listingItem.classList.remove('is-hidden');
					});
					filtersChosen.classList.remove('is-active');
					filtersDropdown.classList.add('is-hidden');
				});
			}
			// Sorting
			// Country A to Z
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
			const s1 = careersListingSortsHld.querySelector('.js-s1');
			s1.addEventListener('click', () => {
				offers.sort((a, b) => (a.location.country > b.location.country) ? 1 : (b.location.country > a.location.country) ? -1 : 0);
				printOffers();
			});
			// Country Z to A
			const s2 = careersListingSortsHld.querySelector('.js-s2');
			s2.addEventListener('click', () => {
				offers.sort((a, b) => (b.location.country > a.location.country) ? 1 : (a.location.country > b.location.country) ? -1 : 0);
				printOffers();
			});
			// Job title A to Z
			const s3 = careersListingSortsHld.querySelector('.js-s3');
			s3.addEventListener('click', () => {
				offers.sort((a, b) => (a.name > b.name) ? 1 : (b.name > a.name) ? -1 : 0);
				printOffers();
				if (careersListingFiltersHld) {
					filterActive();
				}
			});
			// Job title Z to A
			const s4 = careersListingSortsHld.querySelector('.js-s4');
			s4.addEventListener('click', () => {
				offers.sort((a, b) => (b.name > a.name) ? 1 : (a.name > b.name) ? -1 : 0);
				printOffers();
				if (careersListingFiltersHld) {
					filterActive();
				}
			});
		})
		.catch(err => console.error(err));
}
