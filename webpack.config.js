const webpack = require('webpack');
const path = require('path');
const glob = require('glob');
const ESLintPlugin = require('eslint-webpack-plugin');
const BrowserSyncPlugin = require('browser-sync-webpack-plugin');
const RemovePlugin = require('remove-files-webpack-plugin');
const DelayCopyWebpackPlugin = require('delay-copy-webpack-plugin');
const componentsJS = Object.assign(
	...glob.sync('web/src/js/local_components/*.js').map((section) => {
		const name = path.basename(section, '.js');
		const files = glob.sync(`./${section}`);
		if (files.length !== 0) {
			return {[name]: files};
		}
	}),
);
const userConfig = {
	distDirectory: `../${path.basename(__dirname)}-dist/`,
	distFiles: [
		'config/general.php',
		'storage/runtime/assets',
		'templates/',
		'web/favicon.ico',
		'web/src/uploads/',
		'web/src/img/',
		'web/src/fonts/',
		'web/src/css/',
		'web/src/js/*.min.js',
		'web/src/favicon.ico',
		'sitemap.xml',
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
		main: './web/src/js/main.js',
		...componentsJS,
	},
	output: {
		path: path.resolve(__dirname, 'web/src'),
        filename: 'js/[name].min.js',
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
			files: ['**/*.twig', '**/*.php', './web/src/css/style.css', './web/src/css/components/*.css'],
			host: 'localhost',
			port: 3000,
			proxy: `https://wiliot.ddev.site`,
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
