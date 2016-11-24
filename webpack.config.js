const path = require('path');
const webpack = require('webpack');
const merge = require('webpack-merge');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const autoprefixer = require('autoprefixer');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');

console.log( 'Starting webpack in 3, 2, 1...GO!');

// Detemine build env
const TARGET_ENV = process.env.npm_lifecycle_event === 'build' ? 'production' : 'development';

// Common webpack config
const commonConfig = {
  output: {
    path: path.resolve( __dirname, 'build/' ),
    filename: '[hash].js',
  },
  resolve: {
    modulesDirectories: ['node_modules'],
    extensions: ['', '.js', '.elm']
  },
  module: {
    noParse: /\.elm$/,
    loaders: [
      {
        test: /\.(eot|ttf|woff|woff2|svg)$/,
        loader: 'file-loader'
      }
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: 'src/static/index.html',
      inject:   'body',
      filename: 'index.html'
    })
  ],
  postcss: [ autoprefixer( { browsers: ['last 2 versions'] } ) ],
}

// Additional webpack settings for dev env
if (TARGET_ENV === 'development') {
  console.log( 'Serving locally...');

  module.exports = merge(commonConfig, {
    entry: [
      'webpack-dev-server/client?http://localhost:8080/',
      path.join( __dirname, 'src/static/index.js' )
    ],
    devServer: {
      inline:   true,
      progress: true
    },
    module: {
      loaders: [
        {
          test: /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          loader: 'elm-hot!elm-webpack?verbose=true&warn=true'
        },
        {
          test: /\.(css|scss)$/,
          loaders: [
            'style-loader',
            'css-loader',
            'postcss-loader',
            'sass-loader'
          ]
        }
      ]
    }

  });
}

// Additional webpack settings for production env
if ( TARGET_ENV === 'production' ) {
  console.log( 'Building for production...');

  module.exports = merge(commonConfig, {
    entry: path.join( __dirname, 'src/static/index.js' ),
    module: {
      loaders: [
        {
          test:    /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          loader:  'elm-webpack'
        },
        {
          test: /\.(css|scss)$/,
          loader: ExtractTextPlugin.extract('style-loader', [
            'css-loader',
            'postcss-loader',
            'sass-loader'
          ])
        }
      ]
    },
    plugins: [
      new CopyWebpackPlugin([
        {
          from: 'src/static/img/',
          to:   'static/img/'
        },
      ]),
      new webpack.optimize.OccurenceOrderPlugin(),
      // Extract CSS into a separate file
      new ExtractTextPlugin( './[hash].css', { allChunks: true } ),
      // Minify & mangle JS/CSS
      new webpack.optimize.UglifyJsPlugin({
          minimize:   true,
          compressor: { warnings: false }
      })
    ]
  });
}
