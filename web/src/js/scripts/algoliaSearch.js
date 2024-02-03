import algoliasearch from 'algoliasearch';

// be careful not to include the WRITE API KEY in the live version of the scripts on website frontend
// const client = algoliasearch('BW16XZ9HAY', '56e27ff1f9dc7d41a1d5204da1417d36');

// API KEY WITH SEARCH-ONLY
const client = algoliasearch('BW16XZ9HAY', 'da53a277d8695f1185ede202a3ae958b');
const index = client.initIndex('prod_Wiliot');

const searchLimit = 5;

const urlString = window.location.href;
const urlParams = new URL(urlString);

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
				if (hit.pageType === type) {
					objectsToDeleteIDs.push(hit.objectID);
				}
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
	const record = {
		pageTitle: item.dataset.title,
		pageType: item.dataset.type,
		link: item.dataset.link,
		objectID: item.dataset.objectId,
	};
	index.saveObject(record).then(() => {
		console.log('Item updated successfully');
	}).catch(error => {
		console.error('Error updating item:', error);
	});
};

const removeItem = (objectID) => {
	index.deleteObject(objectID).then(() => {
		console.log('Item cleared successfully');
	}).catch(error => {
		console.error('Error clearing item:', error);
	});
};

const updateAllItems = () => {
	const itemsToUpdate = document.querySelectorAll('.js-algolia-item');
	itemsToUpdate.forEach((item) => {
		updateItem(item);
	});
	alert('Everything has been updated.');
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
				alert(type + 's updated.');
			}
		})
		.catch(error => {
			console.error(error);
		});
};

const logItems = (type) => {
	let hits = [];
	index.browseObjects({
		query: type, // empty query to retrieve all objects
		// attributesToRetrieve: ['pageType'],
		batch: (batch) => {
			hits = hits.concat(batch);
		},
		onError: (err) => {
			console.error(err);
		},
	})
		.then(() => {
			let objectsToLog = [];
			hits.forEach((hit) => {
				if (hit.pageType === type) {
					objectsToLog.push(hit);
				}
			});
			console.log(objectsToLog);
		});
};

if (urlParams.searchParams.get('updateRecord')) {
	const item = document.querySelector('.js-algolia-item[data-object-id="' + urlParams.searchParams.get('updateRecord') + '"]');
	updateItem(item);
}

if (urlParams.searchParams.get('removeRecord')) {
	removeItem(urlParams.searchParams.get('removeRecord'));
}

const browseIndexBtns = document.querySelectorAll('.js-algolia-browse');
const updateAllBtns = document.querySelectorAll('.js-algolia-update-all');
const clearIndexBtns = document.querySelectorAll('.js-algolia-clear-index');
const updateRecordsBtns = document.querySelectorAll('.js-algolia-update');
const logRecordsBtns = document.querySelectorAll('.js-algolia-log');
const updateRecordBtns = document.querySelectorAll('.js-algolia-item-update');
const clearItemBtns = document.querySelectorAll('.js-algolia-item-remove');
const algoliaInput = document.querySelector('.js-agolia-input');
const algoliaInputRemove = document.querySelector('.js-algolia-remove-from-input');
const algoliaInputUpdate = document.querySelector('.js-algolia-add-from-input');

const searchBarHld = document.querySelector('.js-search-bar-hld');
if (searchBarHld) {
	const searchBar = searchBarHld.querySelector('.js-search-bar');
	const searchInput = searchBarHld.querySelector('.js-algolia-form-input');
	const closeButton = searchBarHld.querySelector('.js-search-bar-close-button');
	if (searchInput && closeButton) {
		closeButton.addEventListener('click', () => {
			searchBar.classList.remove('is-visible');
		});
		searchInput.addEventListener('click', () => {
			searchBar.classList.add('is-visible');
		});
	}
}

if (algoliaInput && algoliaInputRemove && algoliaInputUpdate) {
	algoliaInputRemove.addEventListener('click', () => {
		const objectID = algoliaInput.value;
		removeItem(objectID);
	});

	algoliaInputUpdate.addEventListener('click', () => {
		const objectID = algoliaInput.value;
		const item = document.querySelector('.js-algolia-item[data-object-id="' + objectID + '"]');
		updateItem(item);
	});
}

if (updateRecordBtns) {
	updateRecordBtns.forEach((btn) => {
		btn.addEventListener('click', () => {
			updateItem(btn.closest('.js-algolia-item'));
		});
	});
}

if (clearItemBtns) {
	clearItemBtns.forEach((btn) => {
		btn.addEventListener('click', () => {
			const objectID = btn.dataset.objectId;
			removeItem(objectID);
		});
	});
}

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

// scripts for search inputs in navigation
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

		const createSearchResults = (hits, query) => {
			if (hits && hits.length > 0) {
				clearResults();
				hits.forEach((hit, i) => {
					if (i > searchLimit - 1) {
						const moreResults = document.createElement('a');
						if (window.location.href.indexOf('/web') !== -1) {
							moreResults.setAttribute('href', '/web/search?query=' + query);
						} else {
							moreResults.setAttribute('href', '/search?query=' + query);
						}
						moreResults.classList.add('search-bar__algolia-more-results', 'u-btn', 'u-btn--arrow');
						moreResults.innerHTML = '<span class="text">See more results</span>';
						resultsContainer.appendChild(moreResults);
						return;
					}
					const result = document.createElement('a');
					if (window.location.href.indexOf('/web') !== -1) {
						result.setAttribute('href', '/web' + hit.link);
					} else {
						result.setAttribute('href', hit.link);
					}
					result.setAttribute('data-id', hit.objectID);
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
							hitsPerPage: searchLimit + 1,
						}).then(({ hits }) => {
							createSearchResults(hits, query);
						});
					}
				}, 500);
			});
		}
	});
}

// scripts for search page
const mainSearchBar = document.querySelector('.js-main-search-bar');
if (mainSearchBar) {
	const searchBarInput = mainSearchBar.querySelector('.js-algolia-form-input');
	const resultsContainer = document.querySelector('.js-search-page-results-hld');
	const itemsLimit = Number(resultsContainer.dataset.itemsLimit);
	const resultsTypesContainer = document.querySelector('.js-search-page-types');

	const clearResults = () => {
		resultsContainer.innerHTML = '';
	};

	const noResults = () => {
		resultsContainer.innerHTML = '<h2 class="search-results__no-results u-title u-title--section">0 results found, please try to rephrase</h2>';
	};

	const noSearch = () => {
		resultsContainer.innerHTML = '<h2 class="search-results__no-results u-title u-title--section">Please enter phrase to search for.</h2>';
	};

	const checkLoadMoreBtn = () => {
		// if there are more results that are is-capped and not is-totally-hidden than limit, create load more button, if not, remove the button
		const relevantSearchResults = resultsContainer.querySelectorAll('.js-search-results-item:not(.is-totally-hidden)');
		const loadMoreBtnHldAlready = resultsContainer.querySelector('.js-search-results-more-btn-hld');
		if (loadMoreBtnHldAlready) {
			loadMoreBtnHldAlready.remove();
		}
		if (relevantSearchResults.length > itemsLimit) {
			const loadMoreBtnHld = document.createElement('div');
			loadMoreBtnHld.classList.add('search-results__more-btn-hld', 'js-search-results-more-btn-hld');
			const loadMoreBtn = document.createElement('button');
			loadMoreBtn.classList.add('search-results__more-btn', 'u-btn', 'u-btn--light', 'js-search-results-more-btn');
			loadMoreBtn.innerHTML = '<span class="text">Load more</span>';
			loadMoreBtnHld.appendChild(loadMoreBtn);
			resultsContainer.appendChild(loadMoreBtnHld);
			loadMoreBtn.addEventListener('click', () => {
				relevantSearchResults.forEach(result => {
					result.classList.remove('is-capped');
				});
				loadMoreBtnHld.remove();
			});
		}
	};

	const createResultsTypes = (types = []) => {
		resultsTypesContainer.innerHTML = '';
		if (types.length < 1) {
			const allItems = document.createElement('li');
			allItems.classList.add('is-disabled');
			allItems.innerHTML = `<span class="title">All types (0)</span>`;
			resultsTypesContainer.appendChild(allItems);
		} else {
			const allItems = document.createElement('li');
			allItems.classList.add('js-search-results-filter', 'is-active');
			allItems.innerHTML = `<span class="title">All types (${types.length})</span>`;
			allItems.setAttribute('data-type', 'all');
			resultsTypesContainer.appendChild(allItems);
			// count occurences of each type
			const typesCount = {};
			types.forEach((type) => {
				typesCount[type] = (typesCount[type] || 0) + 1;
			});
			// create types li according to typesCount
			Object.keys(typesCount).forEach((key) => {
				const type = document.createElement('li');
				type.classList.add('js-search-results-filter');
				type.setAttribute('data-type', key);
				type.innerHTML = `<span class="title">${key} (${typesCount[key]})</span>`;
				resultsTypesContainer.appendChild(type);
			});
			const typesFilters = document.querySelectorAll('.js-search-results-filter');
			typesFilters.forEach((typeFilter) => {
				typeFilter.addEventListener('click', (e) => {
					window.scrollTo({
						top: 0,
					});
					let countActiveItems = 0;
					const type = e.target.closest('.js-search-results-filter').getAttribute('data-type');
					const results = document.querySelectorAll('.js-search-results-item');
					if (type === 'all') {
						results.forEach((result) => {
							result.classList.remove('is-totally-hidden', 'is-capped');
							countActiveItems++;
							if (countActiveItems > itemsLimit) {
								result.classList.add('is-capped');
							}
						});
					} else {
						results.forEach((result) => {
							result.classList.remove('is-capped');
							if (result.getAttribute('data-type') === type) {
								result.classList.remove('is-totally-hidden');
								countActiveItems++;
								if (countActiveItems > itemsLimit) {
									result.classList.add('is-capped');
								}
							} else {
								result.classList.add('is-totally-hidden');
							}
						});
					}
					checkLoadMoreBtn();
					typesFilters.forEach((filter) => {
						filter.classList.remove('is-active');
					});
					e.target.closest('.js-search-results-filter').classList.add('is-active');
				});
			});
		}
	};

	const createSearchResults = (hits, query) => {
		const types = [];
		if (hits && hits.length > 0) {
			clearResults();
			let countActiveItems = 0;
			resultsContainer.innerHTML = `<h2 class="search-results__results-title u-title u-title--section">${hits.length} ${hits.length > 1 ? 'results' : 'result'} for "${query}"</h2><div class="search-results__results js-search-results"></div>`;
			const searchResults = document.querySelector('.js-search-results');
			hits.forEach(hit => {
				const result = document.createElement('a');
				if (window.location.href.indexOf('/web') !== -1) {
					result.setAttribute('href', '/web' + hit.link);
				} else {
					result.setAttribute('href', hit.link);
				}
				result.classList.add('search-results-item', 'js-search-results-item');
				countActiveItems++;
				if (countActiveItems > itemsLimit) {
					result.classList.add('is-capped');
				}
				result.setAttribute('data-type', hit.pageType);
				result.setAttribute('data-id', hit.objectID);
				result.innerHTML = `<span class="type">${hit.pageType}</span> <span class="title">${hit.pageTitle}</span>`;
				searchResults.appendChild(result);
				// populate types with hits type by result.pageType
				types.push(hit.pageType);
			});
			checkLoadMoreBtn();
		} else {
			noResults();
		}
		createResultsTypes(types);
	};

	if (searchBarInput && resultsContainer) {
		let typingTimer;
		searchBarInput.addEventListener('keyup', (e) => {
			clearTimeout(typingTimer);
			typingTimer = setTimeout(() => {
				const query = e.target.value;
				if (query === '') {
					noSearch();
				} else {
					index.search(query, {
						attributesToRetrieve: ['pageType', 'pageTitle', 'link'],
						hitsPerPage: 999,
					}).then(({ hits }) => {
						createSearchResults(hits, query);
					});
				}
			}, 500);
		});
	}

	if (searchBarInput.value !== '') {
		index.search(searchBarInput.value, {
			attributesToRetrieve: ['pageType', 'pageTitle', 'link'],
			hitsPerPage: 999,
		}).then(({ hits }) => {
			createSearchResults(hits, searchBarInput.value);
		});
	} else {
		noSearch();
		createResultsTypes();
	}
}
