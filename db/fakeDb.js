const find = require('lodash/find');

const data = [
  {
    id: 0,
    author: 'Preethi Kasireddy',
    title: 'First Blog Post',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam maximus interdum ante sit amet tempor. Phasellus molestie facilisis nisl sit amet finibus. Sed congue purus in lectus tincidunt mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam in velit dui. Nullam in viverra ante, non imperdiet odio. Aenean sed malesuada tellus. Morbi turpis arcu, hendrerit eget convallis a, fringilla vitae lorem. Sed turpis enim, blandit quis neque non, ullamcorper condimentum mauris. Duis vel neque libero. Donec auctor tortor urna, non laoreet massa hendrerit sit amet. Vestibulum luctus cursus finibus. Morbi rutrum, leo sit amet maximus sollicitudin, turpis urna dapibus libero, vel finibus nunc mi vitae lectus. Mauris tempor congue ex a auctor.',
  },
  {
    id: 1,
    author: 'Preethi Kasireddy',
    title: 'Second Blog Post',
    body: 'Aliquam ultricies semper massa. Cras vulputate nisi sit amet justo vehicula auctor. In hac habitasse platea dictumst. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi maximus justo sodales pellentesque scelerisque. Etiam eu lacus in sapien pharetra malesuada vel ut justo. Etiam tempus, felis ac laoreet tristique, purus lorem euismod mi, sit amet tincidunt leo orci sodales nunc. Aenean tortor libero, dapibus in maximus hendrerit, feugiat ut diam.',
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
