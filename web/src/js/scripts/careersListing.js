const careersListing = document.querySelector('.js-careers-listing');
const careersListingFiltersHld = document.querySelector('.js-careers-listing-filters-hld');
if (careersListing) {
	const COMPANY_UID = 'F6.003';
	const TOKEN = '6F329B2DE6379829B229B2037983E8B3E8B';
	const options = {method: 'GET'};
	fetch(`https://www.comeet.co/careers-api/2.0/company/${COMPANY_UID}/positions?details=false&token=${TOKEN}`, options)
		.then(response => response.json())
		.then(offers => {
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
			// Order items by descending names
			const listingItemAll = careersListing.querySelectorAll('.js-careers-listing-item');
			listingItemAll.forEach((listingItem, key) => {
				// By default order is by ascending names so I just turn that around
				listingItem.style.order = -(key + 1);
			});
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
		})
		.catch(err => console.error(err));
}
