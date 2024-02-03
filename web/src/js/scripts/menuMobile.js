// Handle menu toggling
const body = document.querySelector('body');
const menuMobileHld = document.querySelector('.js-menu-mobile-hld');
const menuMobileMenuHld = document.querySelector('.js-menu-mobile-menu-hld');
if (menuMobileHld && menuMobileMenuHld) {
	const menuMobileButtonsAll = document.querySelectorAll('.js-menu-mobile-btn');
	let isOpen = false;
	const openMobile = () => {
		isOpen = true;
		body.classList.add('is-open-menu-mobile');
	};
	const closeMobile = () => {
		isOpen = false;
		body.classList.remove('is-open-menu-mobile');
	};
	const toggleMobile = () => {
		if (!isOpen) {
			openMobile();
			body.style.overflow = 'hidden';
		} else {
			closeMobile();
			body.style.overflow = '';
		}
	};
	if (menuMobileButtonsAll) {
		menuMobileButtonsAll.forEach((button) => {
			button.addEventListener('click', toggleMobile);
		});
	}
	// Handle dropdowns toggling
	const menuMobileDropdownHldAll = menuMobileMenuHld.querySelectorAll('.js-menu-mobile-dropdown-hld');
	menuMobileDropdownHldAll.forEach(dropdownHld => {
		// Dropdown variables
		const openDropdown = (hld, el, inn) => {
			if (el) {
				// Close other open dropdowns
				menuMobileDropdownHldAll.forEach(drHld => {
					const dropdown = drHld.querySelector('.js-menu-mobile-dropdown');
					if (drHld.classList.contains('is-dropdown-open')) {
						drHld.classList.remove('is-dropdown-open');
						dropdown.classList.remove('is-dropdown-open');
					}
				});
				// Open the one
				hld.classList.add('is-dropdown-open');
				// el.style.transition = `max-height ${inn.getBoundingClientRect().height / 100}s`;
				el.classList.add('is-dropdown-open');
			}
		};
		const closeDropdown = (hld, el, inn) => {
			if (el) {
				hld.classList.remove('is-dropdown-open');
				// el.style.transition = `max-height ${inn.getBoundingClientRect().height / 200}s`;
				el.classList.remove('is-dropdown-open');
			}
		};
		const toggleDropdown = (holder, element, inner) => {
			if (!element.classList.contains('is-dropdown-open')) {
				openDropdown(holder, element, inner);
			} else {
				closeDropdown(holder, element, inner);
			}
		};
		const dropdown = dropdownHld.querySelector('.js-menu-mobile-dropdown');
		const list = dropdownHld.querySelector('.js-menu-mobile-dropdown-list');
		dropdownHld.addEventListener('click', (e) => {
			e.stopPropagation();
			toggleDropdown(dropdownHld, dropdown, list);
		});
	});
}
