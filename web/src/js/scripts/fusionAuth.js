import axios from 'axios';
import jwt from 'jsonwebtoken';
import jwkToPem from 'jwk-to-pem';
const key = {
	'alg': 'RS256',
	'e': 'AQAB',
	'kid': 'o972XdwHFdL9ZYVw6bwAmvAwTs4',
	'kty': 'RSA',
	'n': 'pH-2BjhKO4MiPf5VXRVTc_vnBO00CqI0NOq-g3Y5lpIv3a-IYsnswnfhm5yQha7OGlTRh5Nfpys2NZybuzY5MOe5I3EIJEZzHw5racQPsbJ6FmVdiF8O0Pikxgxlq5gihiWjdWQ9dmaqyARwdgbOfpB3jvIFYR7Ca02ykqSvhtEch6sYwJqlZWzmc10v3bVrKLieN6YqDOYdvzG__5VVqpN4Tj-I0aNq5LPfCF0sSiHBS76tl941U0v5Dy1XCZmaINlqehn1MGmZBr9pj40-BX90boly8O67B9rkhYGwicVqUkuFarTZBKA1xEbQuus_KpdgyoIFl5rYM4jGOgKgMw',
	'use': 'sig',
};
const pem = jwkToPem(key);
const options = { algorithms: ['RS256'] };
const isLoginLinkText = document.querySelector('.menu-desktop__list-item.is-login .text');
const login = () => {
	const host = 'https://api.wiliot.com';
	const eventPath = ''; // What is the value? “/”
	const path = `${eventPath}/v1/auth/token`;
	const clientId = '21ffd444-76e2-4c3f-9317-38c5fddb169d'; // What is the value? Is it 21ffd444-76e2-4c3f-9317-38c5fddb169d ?
	// const redirectUri = `${window.location.origin}/login`;
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const code = urlParams.get('code');
	// const url = `${host}${path}?code=${code}&client_id=${clientId}&redirect_uri=${redirectUri}&grant_type=authorization_code`;
	const url = `${host}${path}?code=${code}&client_id=${clientId}&redirect_uri=https://www.wiliot.com/login&grant_type=authorization_code`;
	// console.log(code);
	if (code) {
		axios.post(url, null, {}).then((response) => {
			localStorage.setItem('access_token', response.data.access_token);
			localStorage.setItem('refresh_token', response.data.refresh_token);
			localStorage.setItem('expires_in', response.data.expires_in);
			// console.log('logged in');
			const decoded = jwt.verify(response.data.access_token, pem, options);
			const user = {
				email: decoded.email,
				username: decoded.preferred_username,
			};
			// console.log(user);
			localStorage.setItem('username', user.username);
			const username = localStorage.getItem('username');
			if (username) {
				isLoginLinkText.innerText = username;
			}
		}).catch((err) => {
			console.error(err);
		});
		// const logoutBtn = document.querySelector('.js-logout');
		// if (logoutBtn) {
		// 	logoutBtn.addEventListener('click', () => {
		// 		localStorage.removeItem('access_token');
		// 		localStorage.removeItem('refresh_token');
		// 		localStorage.removeItem('expires_in');
		// 		localStorage.removeItem('username');
		// 		console.log('logout clicked');
		// 		// window.location.replace('https://login.wiliot.com/oauth2/logout?client_id=3c219e58-ed0e-4b18-ad48-f4f92793ae32');
		// 		window.open('https://login.wiliot.com/oauth2/logout?client_id=3c219e58-ed0e-4b18-ad48-f4f92793ae32', '_blank');
		// 	}, {once: true});
		// 	const username = localStorage.getItem('username');
		// 	if (username) {
		// 		isLoginLinkText.innerText = username;
		// 	} else {
		// 		isLoginLinkText.innerText = 'Login';
		// 	}
		// }
	} else {
		// console.log('returned');
		return;
	}
};

const loginPage = document.querySelector('.js-login');
const token = localStorage.getItem('access_token');
const isAuthenticate = () => {
	try {
		jwt.verify(token, pem, options);
		// console.log('true token');
		const username = localStorage.getItem('username');
		if (username) {
			isLoginLinkText.innerText = username;
		}
		// const logoutBtn = document.querySelector('.js-logout');
		// if (logoutBtn) {
		// 	logoutBtn.addEventListener('click', () => {
		// 		localStorage.removeItem('access_token');
		// 		localStorage.removeItem('refresh_token');
		// 		localStorage.removeItem('expires_in');
		// 		console.log('logout clicked');
		// 		window.location.replace('https://login.wiliot.com/oauth2/logout?client_id=3c219e58-ed0e-4b18-ad48-f4f92793ae32');
		// 	}, {once: true});
		// }
		return true;
	} catch {
		localStorage.removeItem('access_token');
		localStorage.removeItem('refresh_token');
		localStorage.removeItem('expires_in');
		// console.log('false token');
		return false;
	}
};

if (!token) {
	if (loginPage) {
		login();
	}
} else {
	isAuthenticate();
}
