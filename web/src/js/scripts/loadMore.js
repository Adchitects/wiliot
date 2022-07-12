import gsap from 'gsap';

const loadMoreHld = document.querySelectorAll('.js-load-more-hld');
if (loadMoreHld) {
	loadMoreHld.forEach(hld => {
		const itemAll = hld.querySelectorAll('.js-load-more-item');
		const loadMoreBtnHld = hld.querySelector('.js-load-more-btn-hld');
		const loadMoreBtn = hld.querySelector('.js-load-more-btn');
		const itemDataMax = hld.querySelector('.js-load-more-item').dataset.maxItems;
		const itemDataLoadItems = hld.querySelector('.js-load-more-item').dataset.loadItems;
		let maxItems = itemDataMax ? parseInt(itemDataMax, 10) : 3;
		let loadItems = itemDataLoadItems ? parseInt(itemDataLoadItems, 10) : 2;
		itemAll.forEach((item, index, originalArray) => {
			if (index > maxItems - 1) {
				gsap.set(item, {
					display: 'none',
					autoAlpha: 0,
				});
			} else {
				item.dataset.displayed = 'true';
			}
			if (maxItems >= originalArray.length) {
				gsap.set(loadMoreBtn, {
					display: 'none',
					autoAlpha: 0,
				});
			}
		});
		loadMoreBtn.addEventListener('click', () => {
			loadItems = maxItems + loadItems;
			itemAll.forEach((item, index, originalArray) => {
				if (item.dataset.displayed !== 'true') {
					if (index < loadItems) {
						item.dataset.displayed = 'true';
						gsap.set(item, {
							top: -50,
						});
						const displayType = item.dataset.displayType ? item.dataset.displayType : 'block';
						gsap.to(item, {
							display: displayType,
							autoAlpha: 1,
							top: 0,
						});
					}
				}
				if (loadItems >= originalArray.length) {
					if (loadMoreBtnHld) {
						loadMoreBtnHld.classList.add('is-hidden');
					} else {
						gsap.to(loadMoreBtn, {
							display: 'none',
							autoAlpha: 0,
						});
					}
				}
			});
		});
	});
}
