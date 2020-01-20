import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Models/Paper.dart';
import 'package:flutter_app/PaperCell.dart';
import 'package:flutter_html/flutter_html.dart';

class PaperDetailController extends StatefulWidget{

  ExamDetailInfo exam;
  PaperDetailController(this.exam);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PaperDetailControllerState(exam);
  }
}

class PaperDetailControllerState extends State <PaperDetailController>{

  ExamDetailInfo exam;
  PaperDetailControllerState(this.exam);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.red,
          title:Text(exam.subjectIndex+exam.exaPoint)
      ) ,
      body: _buildList(),
    );
  }
//
  _buildList() {

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 1,
      itemBuilder: (context, int index) {
        return _buildRow();
      },
    );

  }
  Widget _buildRow(){

    ///材料
    Container _materialContainer = exam.materialDecript.length > 0?Container(
      child:Html(data: exam.materialDecript,) ,):Container();

    var keys = {
      "0": "A. ",
      "1": "B. ",
      "2": "C. ",
      "3": "D. ",
      "4": "E. ",
      "5": "F. ",
      "6": "G. ",
      "7": "H. ",
      "8": "I. ",
      "9": "G. ",
      "10": "K. ",
    };
    ///答案
    List<Html> answerTiles = [];
    Column _ansContent;
    for(int i = 0;i<exam.selections.length;i++){
      var item = exam.selections[i];
      answerTiles.add(
          Html(
            data: keys[i.toString()]+item.itemDecript,
            //Optional parameters:
            backgroundColor: Colors.white70,
            defaultTextStyle: TextStyle(fontFamily: 'serif'),
            linkStyle: const TextStyle(
              color: Colors.redAccent,
            ),
            onLinkTap: (url) {
              // open url in a webview
            },
            onImageTap: (src) {
              // Display the image in large form.
            },

          )
      );
    }


    _ansContent = new Column(children: answerTiles);
    return Column(
      children: <Widget>[
        _materialContainer,///材料
        Html(
          data: exam.subjectDes,
          //Optional parameters:
          padding: EdgeInsets.all(8.0),
          backgroundColor: Colors.white70,
          defaultTextStyle: TextStyle(fontFamily: 'serif'),
          linkStyle: const TextStyle(
            color: Colors.redAccent,
          ),
          onLinkTap: (url) {
            // open url in a webview
          },
          onImageTap: (src) {
            // Display the image in large form.
          },

        ),
        _ansContent,
      ],
    );
  }
}