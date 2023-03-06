// import axios from 'axios';
// const csrfTokenItem = document.querySelector('input[name="CRAFT_CSRF_TOKEN"]');

// if (csrfTokenItem) {
// 	axios.post('/actions/algolia/default/browse', {
// 		index: 'prod_Wiliot',
// 		query: 'optional query',
// 		params: {
// 			distinct: true,
// 			getRankingInfo: true,
// 		},
// 	}, {
// 		headers: {
// 			'X-CSRF-Token': csrfTokenItem.value,
// 		},
// 	}).then(response => {
// 		// Handle the response
// 		console.log(response);
// 	}).catch(error => {
// 		// Handle the error
// 		console.log(error);
// 	});
// }

import algoliasearch from 'algoliasearch';

const client = algoliasearch('BW16XZ9HAY', 'da53a277d8695f1185ede202a3ae958b');
const index = client.initIndex('prod_Wiliot');

console.log(index.exists());

// let hits = [];

// Get all records as an iterator
// index.browseObjects({
// 	batch: batch => {
// 		hits = hits.concat(batch);
// 	},
// }).then(() => console.log(hits));

// const record = { objectID: 1, name: 'test_record' };
// index.saveObject(record).wait();

// // // Search the index and print the results
// index.search('test_record', (err, content) => {
// 	if (err) {
// 		console.error(err);
// 	} else {
// 		console.log(content);
// 	}
// });
// index
// 	.search('test_record')
// 	.then(({ hits }) => console.log(hits[0]));
