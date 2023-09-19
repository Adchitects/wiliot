console.log('stickyTextSwitch script lazy-loaded');

function offset(el) {
	let rect = el.getBoundingClientRect();
	let scrollLeft = window.pageXOffset || document.documentElement.scrollLeft;
	let scrollTop = window.pageYOffset || document.documentElement.scrollTop;
	return { top: rect.top + scrollTop, left: rect.left + scrollLeft };
}

function throttle(fn, wait) {
	let time = Date.now();
	return function() {
		if ((time + wait - Date.now()) < 0) {
			fn();
			time = Date.now();
		}
	};
}

const stickyImages = document.querySelectorAll('.js-sticky-image-item');
const stickyTexts = document.querySelectorAll('.js-sticky-text-item');
const stickyTextsImgs = document.querySelectorAll('.js-sticky-text-item-img');

if (stickyImages && stickyTexts && stickyTextsImgs) {
	const checkActiveSection = function() {
		let activeSection;
		let activeSectionImg;
		stickyImages.forEach(stickyImage => {
			if ((window.pageYOffset + ((window.innerHeight / 2) + 100)) > offset(stickyImage).top) {
				activeSection = document.querySelector('.js-sticky-text-item[data-id="' + stickyImage.dataset.id + '"]');
				activeSectionImg = document.querySelector('.js-sticky-text-item-img[data-id="' + stickyImage.dataset.id + '"]');
			}
		});
		if (activeSection) {
			stickyTexts.forEach(stickyText => {
				if (activeSection.dataset.id !== stickyText.dataset.id) {
					stickyText.classList.remove('is-active');
				} else {
					stickyText.classList.add('is-active');
				}
			});
			// activeSection.classList.add('is-active');
		} else {
			stickyTexts.forEach(stickyText => {
				if (stickyText.dataset.id > 1) {
					stickyText.classList.remove('is-active');
				} else {
					stickyText.classList.add('is-active');
				}
			});
			// document.querySelector('.js-sticky-text-item[data-id="1"]').classList.add('is-active');
		}
		if (activeSectionImg) {
			stickyTextsImgs.forEach(stickyTextImg => {
				if (activeSectionImg.dataset.id !== stickyTextImg.dataset.id) {
					stickyTextImg.classList.remove('is-active');
				} else {
					stickyTextImg.classList.add('is-active');
				}
			});
			// activeSectionImg.classList.add('is-active');
		} else {
			stickyTextsImgs.forEach(stickyTextImg => {
				if (stickyTextImg.dataset.id > 1) {
					stickyTextImg.classList.remove('is-active');
				} else {
					stickyTextImg.classList.add('is-active');
				}
			});
			// document.querySelector('.js-sticky-text-item-img[data-id="1"]').classList.add('is-active');
		}
	};

	checkActiveSection();

	window.addEventListener('scroll', throttle(checkActiveSection, 100));

	window.addEventListener('resize', () => {
		checkActiveSection();
	});
}
