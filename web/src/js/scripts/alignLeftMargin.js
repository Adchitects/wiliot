const alignLeftMargin = () => {
	const hldAll = document.querySelectorAll('.js-align-left-margin-hld');
	hldAll.forEach(hld => {
		const sample = hld.querySelector('.js-align-left-margin-sample');
		const sampleLeftMargin = sample.getBoundingClientRect().left;
		const sampleLeftPadding = window.getComputedStyle(sample, null).getPropertyValue('padding-left');
		const elementHld = hld.querySelector('.js-align-left-margin-element-hld');
		const element = hld.querySelector('.js-align-left-margin-element');
		elementHld.style.marginRight = sampleLeftPadding;
		element.style.marginLeft = sampleLeftMargin + 'px';
		element.style.paddingLeft = sampleLeftPadding;

		const mQuery = window.matchMedia('(max-width: 599px)');
		const elementDesktopGrid = element.dataset.desktopGtc;
		const elementMobileGrid = element.dataset.mobileGtc;
		const handleMediaQueries = (e) => {
			if (e.matches && elementMobileGrid) {
				element.style.gridTemplateColumns = elementMobileGrid;
			} else {
				element.style.gridTemplateColumns = elementDesktopGrid;
			}
		};
		mQuery.addEventListener('change', handleMediaQueries);
		handleMediaQueries(mQuery);
	});
};
window.addEventListener('load', alignLeftMargin);
window.addEventListener('resize', alignLeftMargin);
