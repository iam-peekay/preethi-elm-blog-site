const find = require('lodash/find');

const data = [
  {
    id: 0,
    author: 'Preethi Kasireddy',
    title: 'When speaking to an audience',
    body: 'Think about: 1) What from your past expeirence do you have in common? 2) Where are you headed in the future? What types of outcomes are mututally exclusive? and 3) Why are you uniquely qualified to be their guide? What similar journey have you gone on with a positive outcome?',
  },
  {
    id: 1,
    author: 'Preethi Kasireddy',
    title: 'Teaching programming',
    body: 'Explain the concept without going into the nitty gritty of it. No need to go into the scary details.',
  },
];

module.exports = {
  getPosts() {
    return data;
  },

  getPost(id) {
    return find(data, ['id', id]);
  },
};
