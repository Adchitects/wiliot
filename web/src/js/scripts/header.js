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

			// Update this block to set is-tab-active on both tab and content
			const defaultActiveTab = header.querySelector('.js-menu-desktop-tab.is-default-tab-active');
			const defaultActiveContent = header.querySelector('.js-menu-desktop-tab-content.is-default-tab-active');
			if (defaultActiveTab && defaultActiveContent) {
				defaultActiveTab.classList.add('is-tab-active');
				defaultActiveContent.classList.add('is-tab-active');
			}
		});

		itemWithDropdown.addEventListener('mouseleave', () => {
			itemWithDropdown.classList.remove('is-dropdown-active');
			header.classList.remove('is-dropdown-active');

			// Update this block to remove is-tab-active from all tabs and contents
			const allTabs = header.querySelectorAll('.js-menu-desktop-tab, .js-menu-desktop-tab-content');
			allTabs.forEach(tab => {
				tab.classList.remove('is-tab-active');
			});
		});
	});

	const tabs = header.querySelectorAll('.js-menu-desktop-tab');
	const tabContents = header.querySelectorAll('.js-menu-desktop-tab-content');

	function activateTab(tabNumber, isDefault = false) {
		tabs.forEach(t => {
			t.classList.remove('is-tab-active');
			t.classList.remove('is-default-tab-active');
		});
		tabContents.forEach(content => {
			content.classList.remove('is-tab-active');
			content.classList.remove('is-default-tab-active');
		});

		const activeTab = header.querySelector(`.js-menu-desktop-tab[data-tab="${tabNumber}"]`);
		const activeContent = header.querySelector(`.js-menu-desktop-tab-content[data-tab-content="${tabNumber}"]`);

		if (activeTab && activeContent) {
			if (isDefault) {
				activeTab.classList.add('is-default-tab-active');
				activeContent.classList.add('is-default-tab-active');
			} else {
				activeTab.classList.add('is-tab-active');
				activeContent.classList.add('is-tab-active');
			}
		}
	}

	// Set the first tab and content as default without activating it
	const firstTab = header.querySelector('.js-menu-desktop-tab[data-tab="1"]');
	const firstTabContent = header.querySelector('.js-menu-desktop-tab-content[data-tab-content="1"]');
	if (firstTab && firstTabContent) {
		firstTab.classList.add('is-default-tab-active');
		firstTabContent.classList.add('is-default-tab-active');
	}

	tabs.forEach(tab => {
		tab.addEventListener('mouseenter', () => {
			const tabNumber = tab.getAttribute('data-tab');
			activateTab(tabNumber);
		});
	});

	const dropdown = header.querySelector('.menu-desktop__dropdown--tabs');
	if (dropdown) {
		dropdown.addEventListener('mouseleave', () => {
			// Remove active classes from all tabs and contents
			tabs.forEach(t => {
				t.classList.remove('is-tab-active');
				t.classList.remove('is-default-tab-active');
			});
			tabContents.forEach(content => {
				content.classList.remove('is-tab-active');
				content.classList.remove('is-default-tab-active');
			});

			// Ensure the first tab and content have the is-default-tab-active class
			if (firstTab && firstTabContent) {
				firstTab.classList.add('is-default-tab-active');
				firstTabContent.classList.add('is-default-tab-active');
			}
		});
	}
});
