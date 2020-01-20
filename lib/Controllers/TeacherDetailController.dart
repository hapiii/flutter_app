import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DioTestpage.dart';
import 'package:flutter_app/Models/TeacherDetail.dart';
import 'dart:convert';

class TeacherDetailController extends StatefulWidget{
  String uid;
  TeacherDetailController(this.uid);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TeacherDetailControllerState(uid);
  }
}

class TeacherDetailControllerState extends State<TeacherDetailController>{

  String uid;
  TeacherDetailControllerState(this.uid);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
    print(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


    );
  }

  void _getData() {
    String url =
        "http://apis-falcon-mentor.zaih.com/v1/mentors/"+uid;
    NetUtil2.get(url, (response) {
      setState(() {

        Map<String,dynamic> data= jsonDecode(response.data.toString());
        TeacherDetail teacher = TeacherDetail.fromJson(data);
        print(teacher.uid);
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