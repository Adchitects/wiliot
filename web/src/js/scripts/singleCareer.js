const COMPANY_UID = 'F6.003';
const TOKEN = '6F329B2DE6379829B229B2037983E8B3E8B';

if ( document.body.matches('.is-page-single.career') ) {
	const urlParams = new URLSearchParams(window.location.search);
	const POSITION_UID = urlParams.get('id');

	if ( !POSITION_UID ) {
		window.location.replace('/careers');
	}

	const options = {method: 'GET'};
	fetch(`https://www.comeet.co/careers-api/2.0/company/${COMPANY_UID}/positions/${POSITION_UID}?token=${TOKEN}&details=true`, options)
		.then(response => response.json())
		.then(response => {
			const formHld = document.querySelector('.js-career-form');
			const formScript = document.createElement('script');
			formScript.type = 'comeet-applyform';
			formScript.dataset.positionUid = POSITION_UID;
			formHld.appendChild(formScript);

			const iframeInterval = setInterval(() => {
				const comeetIframe = document.querySelector('.comeet-iframe');
				if (comeetIframe) {
					comeetIframe.addEventListener('load', () => {
						formHld.classList.remove('hidden');
					});
					clearInterval(iframeInterval);
				}
			}, 100);


			const {
				name: careerTitle,
				location: { name: careerLocation },
				employment_type: careerLevel,
				experience_level: careerType,
				details: careerDetails,
			} = response;

			const careerDescription = careerDetails.filter(d => d.name === 'Description')[0].value.replaceAll('ul', 'ol');
			const careerRequirements = careerDetails.filter(d => d.name === 'Requirements')[0].value.replaceAll('ul', 'ol');

			const careerDetailsHld = document.querySelector('.js-career-details');

			const careerTitleHld = careerDetailsHld.querySelector('.js-career-title');
			careerTitleHld.innerText = careerTitle;

			const careerLocationHld = careerDetailsHld.querySelector('.js-career-location');
			if (careerLocation) {
				careerLocationHld.innerText = careerLocation;
			} else {
				careerLocationHld.remove();
			}

			const careerLevelHld = careerDetailsHld.querySelector('.js-career-level');
			if (careerLevel) {
			    careerLevelHld.innerText = careerLevel;
			} else {
				careerLevelHld.remove();
			}

			const careerTypeHld = careerDetailsHld.querySelector('.js-career-type');
			if (careerType) {
			    careerTypeHld.innerText = careerType;
			} else {
				careerTypeHld.remove();
			}

			const careerDescriptionHld = careerDetailsHld.querySelector('.js-career-description');
			careerDescriptionHld.innerHTML = careerDescription;
			const careerRequirementsHld = careerDetailsHld.querySelector('.js-career-requirements');
			careerRequirementsHld.innerHTML = careerRequirements;

			careerDetailsHld.classList.remove('hidden');
		})
		.catch(err => console.error(err));
}
