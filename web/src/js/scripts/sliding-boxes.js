import { clearClassActive } from './utilities';
const slidingBoxes = document.querySelector('.sliding-boxes');
if (slidingBoxes) {
	const boxesList = document.querySelectorAll('.sliding-box');
	let prevIndex = 0;
	boxesList.forEach((element, index) => {
		element.addEventListener('mousemove', () => {
			if (prevIndex !== index) {
				clearClassActive([...boxesList], 'is-active');
				element.classList.add('is-active');
				prevIndex = index;
			}
		});
	});
}
