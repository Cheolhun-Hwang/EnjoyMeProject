var express = require('express');
var router = express.Router();

var qList = [];

// Temp Q Define
var q1 = new Object();
q1.title = '하나투어 테마여행 CF_시네마 편';
q1.category = '여행';
q1.uid = 'BiOH_s5kIQ8';

/* GET home page. */
router.get('/', function(req, res, next) {
  

  res.render('game_view', { 
    title: q1.title,
    category: q1.category,
    uid: q1.uid
  });
});

module.exports = router;
