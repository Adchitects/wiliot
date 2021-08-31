const careersListing = document.querySelector('.js-careers-listing');

if (careersListing) {
	const options = {method: 'GET'};
	fetch('https://www.comeet.co/careers-api/2.0/company/F6.003/positions?details=false&token=6F329B2DE6379829B229B2037983E8B3E8B', options)
		.then(response => response.json())
		.then(offers => {
			let offersHTML = '';
			offers.forEach(offer => {
				offersHTML += `
                <a href="{{ jobUrl.url }}" class="careers-listing__item">
                    <div class="title u-subtitle u-subtitle--big">${offer.name}</div>
                    <div class="city">${offer.location.name}</div>
                    <div class="arrow icon icon-arrow-right"></div>
                </a>
                `;
			});
			careersListing.innerHTML = offersHTML;
		})
		.catch(err => console.error(err));
}

