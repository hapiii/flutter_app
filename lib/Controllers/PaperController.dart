
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Controllers/PaperDetailController.dart';
import 'package:flutter_app/DioTestpage.dart';
import 'package:flutter_app/Models/Paper.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PaperController extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PaperControllerState();
  }
}

class PaperControllerState extends State<PaperController>{

  Paper _paper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: _paper== null ? SpinKitPulse(
       color: Colors.grey,
       size: 100.0,
     ) : PageView.builder(

       physics: ClampingScrollPhysics(),
     //  padding: const EdgeInsets.all(16.0),
  scrollDirection: Axis.horizontal,
       itemCount: _paper.result.examDetailInfo.length,
       itemBuilder: (context, int index) {
         ExamDetailInfo exam = _paper.result.examDetailInfo[index];
         return PaperDetailController(exam);
       },
     ),
   );
  }

  void _getData() {
    String url =
        "http://api.platform.winlesson.com/api/bskgk/subject/mock/exam/all/detail?app_type=2&application_id=1&device=phone&from=ios&paperId=201911241958439810778615&paperTypeId=201607301639232601224301&pid=69b81504767483cf&platform=2&udid=h6998c8c39f81f7ebb37320b329094c04&user_id=201706011749087697860000&userid=201706011749087697860000&ver=6.6.3&_s_=93a104b9dac45fff062a1c1b5212122e&_t_=1579485919";
    NetUtil2.get(url, (response) {
      setState(() {


        Map<String,dynamic> data= jsonDecode(response.data.toString());
        print(data);
        _paper = Paper.fromJson(data);
        print(_paper);

      });
      setState(() {

      });
    }, errorCallBack: (errorMsg) {
      setState(() {
        print("请求出错");
        print(errorMsg);
      });
    });
  }
}