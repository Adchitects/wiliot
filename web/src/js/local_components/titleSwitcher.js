console.log('titleSwitcher script lazy-loaded');

const titleSwitchers = document.querySelectorAll('.js-title-switcher-switch-title-hld');
if (titleSwitchers) {
	titleSwitchers.forEach(titleSwitcher => {
		const switchCount = titleSwitcher.dataset.count;
		const switchInterval = titleSwitcher.dataset.interval;
		if (switchCount && switchInterval) {
			const titles = titleSwitcher.querySelectorAll('.js-title-switcher-switch-title');
			setInterval(() => {
				const currentTitle = titleSwitcher.querySelector('.is-active');
				const currentIndex = Number(currentTitle.dataset.index);
				const nextIndex = currentIndex === Number(switchCount) ? 1 : Number(currentIndex) + 1;
				currentTitle.classList.add('is-up');
				titles.forEach(title => {
					if (Number(title.dataset.index) === nextIndex) {
						title.classList.add('is-active');
					} else {
						if (!title.classList.contains('is-up')) {
							title.classList.remove('is-active');
						}
					}
				});
				setTimeout(() => {
					currentTitle.classList.remove('is-active');
					currentTitle.classList.remove('is-up');
				}, 500);
			}, Number(switchInterval));
		}
	});
}
