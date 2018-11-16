var express = require('express');
var router = express.Router();

var db = require('./rdbms.js');

/* GET home page. */
router.get('/', function(req, res, next) {
  var qid = req.query.qid + '';
  var sp_qid = qid.replace('ejm', '').replace('xoh', '');
  var sql = 'SELECT q_id, q_cg, q_text, q_ylink, q_length, q_rate FROM questions WHERE q_id = '+sp_qid;
  db.query(sql, (err, qData)=>{
    if(err){
      res.status(500).send("Sorry... <br>Error : " + err);
    }else{
      //must be one quetion.
      res.render('game_view', { 
        title: qData[0].q_text,
        category: qData[0].q_cg,
        uid: qData[0].q_ylink,
        qid: sp_qid
      });
    }
  });
});

router.get('/q', function(req, res, next) {
  var qid = req.query.qid + '';
  var sp_qid = qid.replace('ejm', '').replace('ezs5sxo6h', '');

  var sql = 'SELECT q_id, ql_type, ql_text, ql_one, ql_two, ql_three, ql_four, ql_answer FROM question_list WHERE q_id = '+sp_qid;
  db.query(sql, (err, qData)=>{
    if(err){
      res.status(500).send("Sorry... <br>Error : " + err);
    }else{
      //must be one quetion.
      res.render('game_question', { 
        qlist : qData,
        qid : sp_qid,
        ql : qData.length
      });
    }
  });
});

router.post('/score', (req, res)=>{
  var qid = req.query.qid + '';
  var ql = req.query.ql + '';
  var sp_qid = qid.replace('ejm', '').replace('ezs5sxo6h', '');
  console.log("sp_qid : " + sp_qid);
  console.log("QL : " + ql);
  if(ql == '3'){
    var q1 = req.body.q_1_select;
    var q2 = req.body.q_2_select;
    var q3 = req.body.q_3_select;
  }else if(ql == '5'){
    var q1 = req.body.q_1_select;
    var q2 = req.body.q_2_select;
    var q3 = req.body.q_3_select;
    var q4 = req.body.q_4_select;
    var q5 = req.body.q_5_select;
  }else if(ql == '7'){
    var q1 = req.body.q_1_select;
    var q2 = req.body.q_2_select;
    var q3 = req.body.q_3_select;
    var q4 = req.body.q_4_select;
    var q5 = req.body.q_5_select;
    var q6 = req.body.q_6_select;
    var q7 = req.body.q_7_select;
  }else if(ql == '10'){
    var q1 = req.body.q_1_select;
    var q2 = req.body.q_2_select;
    var q3 = req.body.q_3_select;
    var q4 = req.body.q_4_select;
    var q5 = req.body.q_5_select;
    var q6 = req.body.q_6_select;
    var q7 = req.body.q_7_select;
    var q8 = req.body.q_8_select;
    var q9 = req.body.q_9_select;
    var q10 = req.body.q_10_select;
  }
  var sql = 'SELECT q_id, ql_answer FROM question_list WHERE q_id = '+sp_qid;
  db.query(sql, (err, qData)=>{
    if(err){
      res.status(500).send("Sorry... <br>Error : " + err);
    }else{
      var length = 0;
      var score = 0;
      console.log("length : " + qData.length);
      qData.forEach((item, index)=>{
        length++;
        console.log("item : " + item.ql_answer);
        switch(index){
          case 0:
            console.log("TF : " + (item.ql_answer == q1));
            score += ( (item.ql_answer == q1) ? 1 : 0);
            console.log("score : " + score);
            break;
          case 1:
            console.log("TF : " + (item.ql_answer == q2));
            score += ( (item.ql_answer == q2) ? 1 : 0);
            console.log("score : " + score);
            break;
          case 2:
            console.log("TF : " + (item.ql_answer == q3));
            score += ( (item.ql_answer == q3) ? 1 : 0);
            console.log("score : " + score);
            break;
          case 3:
            score += ( (item.ql_answer == q4) ? 1 : 0);
            break;
          case 4:
            score += ( (item.ql_answer == q5) ? 1 : 0);
            break;
          case 5:
            score += ( (item.ql_answer == q6) ? 1 : 0);
            break;
          case 6:
            score += ( (item.ql_answer == q7) ? 1 : 0);
            break;
          case 7:
            score += ( (item.ql_answer == q8) ? 1 : 0);
            break;
          case 8:
            score += ( (item.ql_answer == q9) ? 1 : 0);
            break;
          case 9:
            score += ( (item.ql_answer == q10) ? 1 : 0);
            break;
        }
      }); 

      console.log("end score : " + score);
      console.log("end total : " + length);
      res.status(200).render('game_score', { 
        score : score,
        total : length
      });
    }
  });
});

module.exports = router;
