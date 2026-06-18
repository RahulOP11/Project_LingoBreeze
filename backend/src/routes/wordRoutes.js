const express = require('express');
const { getWords } = require('../controllers/wordController');
const router = express.Router();

router.get('/words', getWords);

module.exports = router;
