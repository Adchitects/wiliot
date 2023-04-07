import algoliasearch from 'algoliasearch';

const client = algoliasearch('BW16XZ9HAY', '56e27ff1f9dc7d41a1d5204da1417d36');
const index = client.initIndex('prod_Wiliot');

const getItems = (type) => {
	let hits = [];
	return index.browseObjects({
		query: type,
		attributesToRetrieve: ['pageType'],
		batch: batch => {
			hits = hits.concat(batch);
		},
	})
		.then(() => {
			let objectsToDeleteIDs = [];
			hits.forEach((hit) => {
				objectsToDeleteIDs.push(hit.objectID);
			});
			return objectsToDeleteIDs;
		});
};

const browseIndex = () => {
	index.browseObjects({
		query: '', // empty query to retrieve all objects
		batch: (batch) => {
			console.log(batch);
		},
		onError: (err) => {
			console.error(err);
		},
	});
};

const clearWholeIndex = () => {
	const result = confirm('Are you sure you want to clear the whole index?');
	if (result) {
		index.clearObjects().then(() => {
			alert('Index cleared successfully');
		}).catch(error => {
			console.error('Error clearing index:', error);
		});
	}
};

const updateItem = (item) => {
	const date = new Date();
	const record = {
		pageTitle: item.dataset.title,
		pageType: item.dataset.type,
		link: item.dataset.link,
		objectID: item.dataset.objectId,
		date: date.toLocaleDateString(),
	};
	index.saveObject(record);
};

const updateAllItems = () => {
	const itemsToUpdate = document.querySelectorAll('.js-algolia-item');
	itemsToUpdate.forEach((item) => {
		updateItem(item);
	});
	alert('Everything has been updated!');
};

const updateItems = (type) => {
	const itemsToUpdate = document.querySelectorAll('.js-algolia-item[data-type="' + type + '"]');
	getItems(type).then(objects => {
		// remove old items
		return index.deleteObjects(objects);
	})
		.then(() => {
			if (itemsToUpdate) {
				itemsToUpdate.forEach((item) => {
					updateItem(item);
				});
				alert(type + 's updated!');
			}
		})
		.catch(error => {
			console.error(error);
		});
};

const logItems = (type) => {
	index.browseObjects({
		query: type, // empty query to retrieve all objects
		attributesToRetrieve: ['pageType'],
		batch: (batch) => {
			console.log(batch);
		},
		onError: (err) => {
			console.error(err);
		},
	});
};

const browseIndexBtns = document.querySelectorAll('.js-algolia-browse');
const updateAllBtns = document.querySelectorAll('.js-algolia-update-all');
const clearIndexBtns = document.querySelectorAll('.js-algolia-clear-index');
const updateRecordsBtns = document.querySelectorAll('.js-algolia-update');
const logRecordsBtns = document.querySelectorAll('.js-algolia-log');

if (browseIndexBtns) {
	browseIndexBtns.forEach((btn) => {
		btn.addEventListener('click', () => {
			browseIndex();
		});
	});
}

if (updateAllBtns) {
	updateAllBtns.forEach((btn) => {
		btn.addEventListener('click', () => {
			index.clearObjects().then(() => {
				updateAllItems();
			}).catch(error => {
				console.error('Error clearing index:', error);
			});
		});
	});
}

if (updateRecordsBtns) {
	updateRecordsBtns.forEach((btn) => {
		btn.addEventListener('click', () => {
			updateItems(btn.dataset.type);
		});
	});
}

if (clearIndexBtns) {
	clearIndexBtns.forEach((btn) => {
		btn.addEventListener('click', () => {
			clearWholeIndex();
		});
	});
}

if (logRecordsBtns) {
	logRecordsBtns.forEach((btn) => {
		btn.addEventListener('click', () => {
			logItems(btn.dataset.type);
		});
	});
}

const searchBars = document.querySelectorAll('.js-search-bar');

if (searchBars) {
	searchBars.forEach((searchBar) => {
		const searchBarInput = searchBar.querySelector('.js-algolia-form-input');
		const resultsContainer = searchBar.querySelector('.js-algolia-results');

		const clearResults = () => {
			resultsContainer.innerHTML = '';
		};

		const noResults = () => {
			resultsContainer.innerHTML = '<span class="search-bar__algolia-no-results">No results</span>';
		};

		const createSearchResults = (hits) => {
			if (hits && hits.length > 0) {
				clearResults();
				hits.forEach((hit) => {
					const result = document.createElement('a');
					if (window.location.href.indexOf('/web') !== -1) {
						result.setAttribute('href', '/web' + hit.link);
					} else {
						result.setAttribute('href', hit.link);
					}
					result.classList.add('search-bar__algolia-result');
					result.innerHTML = `<span class="title">${hit.pageTitle}</span> <span class="type">${hit.pageType}</span>`;
					resultsContainer.appendChild(result);
				});
			} else {
				noResults();
			}
		};

		if (searchBarInput && resultsContainer) {
			let typingTimer;
			searchBarInput.addEventListener('keyup', (e) => {
				clearTimeout(typingTimer);
				typingTimer = setTimeout(() => {
					const query = e.target.value;
					if (query === '') {
						clearResults();
					} else {
						index.search(query, {
							attributesToRetrieve: ['pageType', 'pageTitle', 'link'],
							// hitsPerPage: 10,
						}).then(({ hits }) => {
							createSearchResults(hits);
						});
					}
				}, 500);
			});
		}
	});
}

