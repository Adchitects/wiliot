console.log('bbImplementingNav script lazy-loaded');

const hldAll = document.querySelectorAll('.js-bb-implementing-tabs-hld');
hldAll.forEach(hld => {
	const navItemAll = hld.querySelectorAll('.js-bb-implementing-tabs-item-nav');
	navItemAll.forEach((navItem, index) => {
		navItem.addEventListener('click', () => {
			navItemAll.forEach(item => {
				if (item !== navItem) {
					item.classList.remove('is-active');
				}
			});
			navItem.classList.toggle('is-active');
			const contentItemAll = hld.querySelectorAll('.js-bb-implementing-tabs-item-text');
			contentItemAll.forEach(item => item.classList.remove('is-active'));
			contentItemAll[index].classList.add('is-active');
		});
	});
});
