/**
 * Created by yangzhongmin on 16/3/30.
 */
var mockjs = require('mockjs');
var assign = require('object-assign');

module.exports = function(rules) {
  rules['http://fccsmng.d1323.mayibank.net/help/*'] = 'http://fccsmng.d1323.mayibank.net/';
};
