import jwt from 'jsonwebtoken';
import jwkToPem from 'jwk-to-pem';
// import config from 'react-global-configuration';
// import _ from "lodash";

// class Auth {
function login() {
	const host = 'https://login.wiliot.com'; // L
	const path = '/oauth2/authorize';
	const clientId = '21ffd444-76e2-4c3f-9317-38c5fddb169d'; // L
	const nonce = 'yyoA8d4TVFwjKA076iWIy5Xk';
	const state = 'LyKQtQEAUaD1ti1YG2pkAJW8';
	const redirectUri = `https://wiliot.com/login`;
	const responseType = 'code';
	const scope = 'openid%20profile%20email%20offline_access';

	// 'https://login-dev.aws.wiliot.com/oauth2/authorize?response_type=code&client_id=21ffd444-76e2-4c3f-9317-38c5fddb169d&state=LyKQtQEAUaD1ti1YG2pkAJW8&redirect_uri=https%3A%2F%2Fdeveloper.wiliot.com%2F_api%2Fdev%2Fauth&nonce=yyoA8d4TVFwjKA076iWIy5Xk&scope=openid%20profile%20email%20offline_access'
	// https://login.wiliot.com/oauth2/authorize?response_type=code&client_id=21ffd444-76e2-4c3f-9317-38c5fddb169d&state=LyKQtQEAUaD1ti1YG2pkAJW8&redirect_uri=https://wiliot.com/login&nonce=yyoA8d4TVFwjKA076iWIy5Xk&scope=openid%20profile%20email%20offline_access
	window.location.href = `${host}${path}?response_type=${responseType}&client_id=${clientId}&state=${state}&redirect_uri=${redirectUri}&nonce=${nonce}&scope=${scope}`;
}

// logout(t, msg) {
// 	const apps = localStorage.getItem("appsFavourites");
// 	const gateways = localStorage.getItem("gatewaysFavourites");
// 	localStorage.clear();
// 	localStorage.setItem("appsFavourites", apps);
// 	localStorage.setItem("gatewaysFavourites", gateways);
// 	let path = `/logout?from=${window.location.pathname}`;
// 	path = msg ? path + `&msg=${msg}` : path;
// 	window.location.href = path;
// }

// isAuthenticate() {
//   const token = localStorage.getItem("access_token");
//   if (token) {
//     return true;
//   } else {
//     return false;
//   }
// }

// isAuthenticate() {
// 	const token = localStorage.getItem("access_token");
// 	const key = config.get("login.key"); // L
// 	const pem = jwkToPem(key);
// 	const options = { algorithms: ["RS256"] };
// 	try {
// 		jwt.verify(token, pem, options);
// 		return true;
// 	} catch {
// 		localStorage.removeItem("access_token");
// 		localStorage.removeItem("refresh_token");
// 		localStorage.removeItem("expires_in");
// 	return false;
// 	}
// }

function getUserInfo() {
	const token = localStorage.getItem('access_token');

	if (!token) {
		console.log('no access token');
		login();
	}

	// const key = config.get('login.key'); // L
	const key = ''; // L
	const pem = jwkToPem(key);
	const options = { algorithms: ['RS256'] };

	try {
		const decoded = jwt.verify(token, pem, options);
		let user = {
			email: decoded.email,
			ownerId: decoded.ownerId,
			// ownerIds: _.uniq([...decoded.ownerIds, decoded.ownerId]),
			roles: decoded.roles,
		};

		// const ownerId = localStorage.getItem("ownerId");
		// if (ownerId) {
		//   user.ownerId = ownerId;
		// }

		return user;
	} catch (err) {
		return {};
	}
}
// }

// export default new Auth();

const testBtn = document.querySelector('.login-tiles__title');
if (testBtn) {
	testBtn.addEventListener('click', () => {
		console.log('click');
		getUserInfo();
	});
}

