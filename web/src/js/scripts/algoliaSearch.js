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

const client = algoliasearch('BW16XZ9HAY', '56e27ff1f9dc7d41a1d5204da1417d36');
const index = client.initIndex('prod_Wiliot');

const objects = [{
	firstname: 'Jimmie',
	lastname: 'Barninger',
	objectID: 'myID1',
}, {
	firstname: 'Warren',
	lastname: 'Speach',
	objectID: 'myID2',
}];

index.saveObjects(objects).then(({ objectIDs }) => {
	console.log(objectIDs);
});

index.browseObjects({
	query: '', // empty query to retrieve all objects
	batch: (batch) => {
		console.log(batch);
	},
	complete: () => {
		console.log('Done browsing');
	},
	onError: (err) => {
		console.error(err);
	},
});
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
