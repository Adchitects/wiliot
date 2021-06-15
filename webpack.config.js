const webpack = require('webpack');
const path = require('path');
const ESLintPlugin = require('eslint-webpack-plugin');
const BrowserSyncPlugin = require('browser-sync-webpack-plugin');
const RemovePlugin = require('remove-files-webpack-plugin');
const DelayCopyWebpackPlugin = require('delay-copy-webpack-plugin');
const userConfig = {
	proxy: {
		dirname: path.basename(__dirname),
		port: 8888,
	},
	distDirectory: `../${path.basename(__dirname)}-dist/`,
	distFiles: [
		'config/general.php',
		'storage/runtime/assets',
		'templates/',
		'web/favicon.ico',
		'web/src/uploads/',
		'web/src/img/',
		'web/src/fonts/',
		'web/src/css/style.min.css',
		'web/src/js/main.min.js',
		'web/src/favicon.ico',
	],
};
const webpackConfig = {
	stats: {
		colors: true,
		entrypoints: false,
		env: false,
		hash: false,
		version: false,
		timings: true,
		assets: false,
		chunks: false,
		modules: false,
		reasons: false,
		children: false,
		source: false,
		errors: true,
		errorDetails: true,
		warnings: true,
		publicPath: false,
	},
	entry: {
		app: './web/src/js/main.js',
	},
	output: {
		filename: 'js/main.min.js',
		path: path.resolve(__dirname, 'web/src'),
	},
	module: {
		rules: [
			{
				test: /\.js$/,
				exclude: /node_modules/,
				use: {
					loader: 'babel-loader',
					options: {
						presets: ['@babel/preset-env'],
					},
				},
			},
			{
				enforce: 'pre',
				test: /\.(js)$/,
				exclude: /node_modules/,
			},
			{
				test: [/\.scss/, /\.css/],
				use: ['css-loader', 'sass-loader'],
			},
		],
	},
	plugins: [
		new RemovePlugin({
			// Before prod/build remove entire `dist` folder to keep it clean
			before: {
				allowRootAndOutside: true,
				include: [
					userConfig.distDirectory,
				]
			},
		}),
		new webpack.optimize.LimitChunkCountPlugin({
			maxChunks: 1,
		}),
		new ESLintPlugin({
			emitWarning: true,
			fix: true,
		}),
		new BrowserSyncPlugin({
			logPrefix: 'webpack',
			files: ['**/*.twig', '**/*.php', './web/src/css/style.min.css'],
			host: 'localhost',
			port: 3000,
			proxy: `http://${userConfig.proxy.dirname}:${userConfig.proxy.port}`,
			ghostMode: false,
		}),
	],
};

module.exports = (env, argv) => {
	if (argv.mode === 'development') {
		webpackConfig.devtool = 'source-map';
	} else if (argv.mode === 'production') {
		webpackConfig.plugins.push(
			new DelayCopyWebpackPlugin({
				from: userConfig.distFiles,
				to: userConfig.distDirectory,
				interval: 2000,
			}),
		);
	}
	return webpackConfig;
};
