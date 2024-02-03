const headerAll = document.querySelectorAll('.js-header');
headerAll.forEach(header => {
	const headerHeight = header.getBoundingClientRect().height;
	let currentScroll;
	let prevScroll = window.scrollY || document.documentElement.scrollTop;
	let prevDirection = 0;
	let direction = 0;
	const limit = Math.max(document.body.scrollHeight, document.body.offsetHeight, document.documentElement.clientHeight, document.documentElement.scrollHeight, document.documentElement.offsetHeight) - window.innerHeight;
	const checkScroll = () => {
		currentScroll = window.scrollY || document.documentElement.scrollTop;
		// Find the direction of scroll:
		// 0 - initial,
		// 1 - up,
		// 2 - down
		if (currentScroll > prevScroll) {
			direction = 2;
		} else if (currentScroll < prevScroll) {
			direction = 1;
		}
		// Secure bouncing out of window bottom at Safari
		if (currentScroll >= limit) {
			direction = 2;
		}
		if (direction !== prevDirection) {
			toggleHeader(direction, currentScroll);
		}
		if (currentScroll > headerHeight) {
			header.classList.add('is-scrolled');
			header.style.transition = 'transform 0.2s';
		} else {
			header.classList.remove('is-scrolled');
			if (direction === 1) {
				header.style.transform = `translateY(0px)`;
				header.style.transition = 'transform 0.2s';
			} else if (direction === 2) {
				header.style.transform = `translateY(${-currentScroll}px)`;
				header.style.transition = 'transform 0.1s';
			}
		}
		prevScroll = currentScroll;
	};
	const toggleHeader = (dir, curScroll) => {
		if (dir === 2 && curScroll > headerHeight) {
			header.classList.add('is-scrolled-down');
			header.style.transform = `translateY(-100%)`;
			prevDirection = dir;
		} else if (dir === 1) {
			header.classList.remove('is-scrolled-down');
			header.style.transform = `translateY(0px)`;
			prevDirection = dir;
		}
	};
	window.addEventListener('scroll', checkScroll);
	window.addEventListener('load', checkScroll);
	// Check dropdown
	const headerItemWithDropdownAll = header.querySelectorAll('.js-header-has-dropdown');
	headerItemWithDropdownAll.forEach(itemWithDropdown => {
		itemWithDropdown.addEventListener('mouseover', () => {
			itemWithDropdown.classList.add('is-dropdown-active');
			header.classList.add('is-dropdown-active');
		});
		itemWithDropdown.addEventListener('mouseleave', () => {
			itemWithDropdown.classList.remove('is-dropdown-active');
			header.classList.remove('is-dropdown-active');
		});
	});
});
