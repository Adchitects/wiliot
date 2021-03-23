import gsap from 'gsap';

// eslint-disable-next-line
const texts = ['wow', 'uszanowanko', 'wow', 'wow mocno', 'starter taki', 'miłość bardzo', 'wow', 'fajne takie', 'starter bardzo', 'wow', 'dużo uszanowanka', 'dobro mocno', 'wow', 'wow pieseł', 'wow', 'przygód wiele', 'eksctytacja dużo', 'wow', 'developieseł silny', 'łebpak bardzo', 'wow', 'tak bardzo wow', 'łebpak mocno', 'łebpak wow', 'wow', 'starter mocno', 'przygód wiele', 'eksctytacja dużo', 'pieseł', 'miłość', 'miłość dużo', 'wow', 'uszanowanko', 'wow', 'łebpak mocno', 'wow', 'takie dobro', 'developieseł', 'starter taki', 'adchitekteł taki', 'miłość bardzo', 'przygód wiele', 'frontendeł', 'łebpak mocno', 'eksctytacja dużo', 'fajne takie', 'starter mocno', 'wow', 'wow', 'adam', 'siła bardzo', 'dużo uszanowanka', 'developieseł', 'dobro mocno', 'wow', 'adchitekteł taki', 'przygód wiele', 'eksctytacja dużo', 'wow pieseł', 'adchitekteł taki', 'wow', 'łebpak bardzo', 'tak bardzo wow', 'wow', 'łebpak mocno', 'łebpak silny', 'frontendeł', 'starter mocno', 'wow', 'pieseł miłość', 'developieseł mocny', 'wow', 'miłość dużo', 'wow', 'uszanowanko', 'frontendeł', 'wow', 'takie dobro', 'starter taki', 'miłość bardzo', 'wow', 'fajne takie', 'starter mocno', 'adchitekteł taki', 'wow', 'dużo uszanowanka', 'dobro mocno', 'siła bardzo', 'wow', 'wow pieseł', 'wow', 'siła bardzo', 'przygód wiele', 'eksctytacja dużo', 'wow', 'developieseł', 'łebpak bardzo', 'wow', 'adam', 'tak bardzo wow', 'łebpak mocno', 'łebpak wow', 'wow', 'starter mocno', 'przygód wiele', 'eksctytacja dużo', 'pieseł miłość', 'miłość dużo', 'wow', 'uszanowanko', 'wow', 'wow', 'takie dobro', 'developieseł silny', 'starter taki', 'siła bardzo', 'miłość bardzo', 'przygód wiele', 'eksctytacja dużo', 'fajne takie', 'starter mocno', 'wow', 'wow', 'dużo uszanowanka', 'developieseł', 'dobro mocno', 'wow', 'przygód wiele', 'eksctytacja dużo', 'wow pieseł', 'wow', 'łebpak bardzo', 'tak bardzo wow', 'wow', 'łebpak mocno', 'łebpak silny', 'frontendeł', 'starter mocno', 'siła bardzo', 'wow', 'pieseł', 'miłość', 'adam', 'wow', 'wow', 'wow', 'developieseł', 'wow', 'miłość dużo', 'łebpak mocno', 'wow', 'uszanowanko mocno', 'wow', 'adchitekteł taki', 'takie dobro', 'starter taki', 'miłość bardzo', 'wow', 'fajne takie', 'starter mocno', 'wow', 'dużo uszanowanka', 'dobro mocno', 'wow', 'siła bardzo', 'wow pieseł', 'wow', 'przygód wiele', 'eksctytacja dużo', 'wow', 'developieseł', 'łebpak bardzo', 'wow', 'tak bardzo wow', 'łebpak mocno', 'łebpak wow', 'wow', 'starter mocno', 'przygód wiele', 'eksctytacja dużo', 'pieseł', 'miłość dużo', 'frontendeł', 'wow', 'uszanowanko', 'wow', 'wow', 'takie dobro', 'developieseł silny', 'starter taki', 'miłość bardzo', 'przygód wiele', 'adchitekteł taki', 'eksctytacja dużo', 'fajne takie', 'starter mocno', 'wow', 'wow', 'dużo uszanowanka', 'developieseł', 'dobro mocno', 'wow', 'frontendeł', 'przygód wiele', 'adam', 'eksctytacja dużo', 'wow pieseł', 'wow', 'frontendeł', 'adchitekteł taki', 'łebpak bardzo', 'tak bardzo wow', 'wow', 'łebpak mocno', 'łebpak silny', 'starter mocno', 'wow', 'pieseł silny', 'developieseł', 'miłość', 'łebpak mocno', 'wow', 'miłość dużo', 'wow', ' mocno', 'wow', 'takie dobro', 'siła bardzo', 'starter taki', 'miłość bardzo', 'wow', 'fajne takie', 'starter mocno', 'wow', 'dużo uszanowanka', 'dobro mocno', 'wow', 'wow pieseł', 'wow', 'przygód wiele'];
// eslint-disable-next-line
const colors = ['green', 'red', 'yellow', 'purple', 'cyan', 'white', 'green', 'red', 'yellow', 'purple', 'red', 'cyan', 'green'];
const divsHld = document.createElement('divs-hld');
document.body.appendChild(divsHld);
const createNewDiv = () => {
	const div = document.createElement('div');
	divsHld.appendChild(div);
	div.classList.add('js-div');
	div.classList.add('u-title');
};
for (let i = 0; i < texts.length; i++) {
	createNewDiv();
}
const divAll = document.querySelectorAll('.js-div');
const showDiv = (secs) => {
	const randomElement = divAll[Math.floor(gsap.utils.random(0, divAll.length))];
	const tll = gsap.timeline();
	randomElement.innerHTML = texts[Math.floor(gsap.utils.random(0, texts.length))];
	gsap.set(randomElement, {
		position: 'absolute',
		top: 'random(0, 90)' + '%',
		left: 'random(0, 90)' + '%',
		zIndex: 999,
		pointerEvents: 'none',
		color: colors[Math.floor(gsap.utils.random(0, colors.length))],
		fontSize: 25,
		textShadow: '-1px 0 1px black, 0 1px 1px black, 1px 0 1px black, 0 -1px 1px black',
		opacity: 0,
	});
	tll.to(randomElement, {
		duration: secs,
		opacity: 1,
	});
	tll.to(randomElement, {
		duration: secs / 3,
		opacity: 0,
	});
};
const dogeImg = document.querySelector('.js-doge-img');
if (dogeImg) {
	dogeImg.addEventListener('mousemove', () => {
		showDiv(1);
		console.warn(texts[Math.floor(gsap.utils.random(0, texts.length))]);
	});
	dogeImg.addEventListener('touchmove', () => {
		showDiv(1);
		console.warn(texts[Math.floor(gsap.utils.random(0, texts.length))]);
	});
}
