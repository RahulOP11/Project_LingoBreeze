const words = require('../data/words');

const getWords = (req, res) => {
  res.json(words);
};

module.exports = {
  getWords,
};
