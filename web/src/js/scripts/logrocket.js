console.log('LogRocket exist');
let logRocketInitialized = false;

// Function to check if a cookie exists
const getCookie = (name) => {
	let matches = document.cookie.match(new RegExp(
		'(?:^|; )' + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + '=([^;]*)'
	));
	return matches ? decodeURIComponent(matches[1]) : undefined;
};

// Function to set a cookie
const setCookie = (name, value, hours) => {
	const d = new Date();
	d.setTime(d.getTime() + (hours * 60 * 60 * 1000));
	let expires = 'expires=' + d.toUTCString();
	document.cookie = `${name}=${value};${expires};path=/`;
};

const loadScript = async() => {
	if (!logRocketInitialized && getCookie('LogRocketQualified') === 'true') {
		try {
			// Dynamically import LogRocket as a module
			const LogRocketModule = await import('logrocket');
			const LogRocket = LogRocketModule.default;
			console.log('LogRocket init');
			LogRocket.init('dbgrvh/wiliot');
			logRocketInitialized = true;
		} catch (error) {
			console.error('Failed to load LogRocket:', error);
		}
	}
};

// Determine if the user qualifies for LogRocket initialization
const qualifyUser = () => {
	if (getCookie('LogRocketQualified') === undefined) {
		// Randomly qualify users (100% chance)
		if (Math.random() < 1) {
			setCookie('LogRocketQualified', 'true', 1); // Expires in 1 hour
			console.log('User qualified for LogRocket');
			loadScript(); // Directly attempt to load LogRocket if qualified
		} else {
			setCookie('LogRocketQualified', 'false', 1); // Expires in 1 hour
			console.log('User not qualified for LogRocket');
		}
	} else {
		loadScript(); // If already qualified/not qualified, check if it can be loaded
	}
};

// Qualify user on their first interaction
const userInteractionEvents = ['scroll', 'mouseover', 'keydown', 'touchmove', 'touchstart', 'click'];
userInteractionEvents.forEach(e => {
	window.addEventListener(e, qualifyUser, {
		passive: true,
		once: true,
	});
});
