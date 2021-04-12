// Remove a active class from all of the given array of elements
export function clearClassActive(listOfElements, classname) {
	if (Array.isArray(listOfElements)) {
		listOfElements.forEach(element => {
			element.classList.remove(classname);
		});
	} else {
		return false;
	}
}
