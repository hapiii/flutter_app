import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/Models/People.dart';

class ClassCell extends StatelessWidget {
  final People user;
  final Function(String) callBack;
  ClassCell(this.user,this.callBack);

  @override
  Widget build(BuildContext context) {
    return buildRow(user, context);
  }

  buildRow(People user, BuildContext context) {

    bool showTips = false;
    ///头部
    Widget _headContainer = Container(
      margin:
      new EdgeInsets.only(left: 0, top: 6.0, bottom: 2.0, right:0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            //margin:  new EdgeInsets.only(left: 8, top: 2.0, bottom: 2.0, right: 0),
            child: ClipOval(
              child: Image.network(
                user.avatar,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            //padding:new EdgeInsets.only(left:10,top: 6.0, bottom: 2.0,right: 4),
            margin:
                new EdgeInsets.only(left: 8, top: 6.0, bottom: 2.0, right:0),
            width: MediaQuery.of(context).size.width - 130,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    user.name,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                ),
                Container(
                    margin: new EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 0),
                    child: new Text(
                      user.title,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    alignment: Alignment.topLeft),
              ],
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 30,
                height: 30,
                child: PopupMenuButton(
                  child: Image.asset("imgs/home_more.png",width: 20,height: 20,),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  itemBuilder: (BuildContext context) =>
                  [

                    new PopupMenuItem<String>(

                        value: 'value01',
                        height: 20,
                        textStyle:  TextStyle(
                            color: Colors.white,
                            backgroundColor: Color.fromARGB(255,119, 136, 153)
                        ),
                        child: new Text('不感兴趣',)),
                  ],
//                onPressed: (){
//                  showTips = !showTips;
//                  print("点击了");
//                  showTips?  Text("不感兴趣"): new Container();
//                },
                ),
              )

          ),

        ],
      ),
    );

    ///任务标签
    List<ClipRRect> tiles = [];
    Widget _tagContent;
    for (var item in user.tags) {
      tiles.add(ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            color: Color.fromARGB(255, 242, 242, 242),
            alignment: Alignment.centerLeft,
            padding:
                const EdgeInsets.only(left: 3.0, top: 3, bottom: 3, right: 3),
            margin: const EdgeInsets.only(left: 10.0, top: 3, bottom: 3),
            child: Text(
              item.name,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 11,
                color: Color.fromARGB(255, 140, 140, 140),
              ),
            )),
      ));
    }
    _tagContent = new Row(children: tiles);

    ///话题
    List<Row> topicTiles = [];
    Widget _topicContent;
    for (var item in user.topics) {
      topicTiles.add(Row(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 8.0, top: 3, bottom: 3),
            child: Image.asset("imgs/icon_tag_more3~iphone@2x.png"),
            width: 16,
            height: 16,
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 7.0, top: 3, bottom: 3),
              child: Text(
                item.title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              )),
        ],
      ));
    }
    _topicContent = new Column(children: topicTiles);

    ///底部富文本
    Widget _bottomContainer = Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 8,top: 5,bottom: 15),
          child: Image.asset(
            'imgs/icon_place~iphone@2x.png',
            width: 15,
            height: 15,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 7, top: 5, bottom: 15, right: 7),
          child: RichText(
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: user.city + ' • ',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromARGB(255, 154, 154, 154),
                        )),
                    TextSpan(
                        text: '帮助了',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromARGB(255, 154, 154, 154),
                        )),
                    TextSpan(
                        text: user.meetsCount.toString(),
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.red,
                        )),
                    TextSpan(
                        text: '人 • 评分',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromARGB(255, 154, 154, 154),
                        )),
                    TextSpan(
                        text: (user.rankScore % 100).toString(),
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.red,
                        )),
                  ])),
        ),
      ],
    );

    Widget _line = Container(
      height: 0.15,
      color:Color.fromARGB(255, 154, 154, 154),
      padding: EdgeInsets.only(left: 0,top:0,right: 0,bottom: 0),
    );

    return FlatButton(

      padding: new EdgeInsets.only(top: 8,left: 0,right: 0,),
          child: Container(
            margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0,0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                _headContainer,//头部
                _topicContent, //话题
                _tagContent, //标签
                _bottomContainer,
                _line,
              ],
            ),
          ),
      onPressed: onTap,
    );
  }

  void onTap(){

    callBack(user.uid);
  }

}

/*  StatefulWidget写法

class ClassCell extends StatefulWidget {

  final People user;

  ClassCell(this.user);

  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    return ClassCellStates(user);
  }
}

class ClassCellStates extends State <ClassCell>{
  final People user;

  ClassCellStates(this.user);
  @override
  Widget build(BuildContext context) {
   return buildRow(user, context);

  }
  // TODO: implement build

  buildRow(People user, BuildContext context) {
    ///任务标签
    List<ClipRRect> tiles = [];
    Widget _tagContent;
    for (var item in user.tags) {
      tiles.add(ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
            color: Color.fromARGB(255, 242, 242, 242),
            alignment: Alignment.centerLeft,
            padding:
            const EdgeInsets.only(left: 3.0, top: 3, bottom: 3, right: 3),
            margin: const EdgeInsets.only(left: 10.0, top: 3, bottom: 3),
            child: Text(
              item.name,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 11,
                color: Color.fromARGB(255, 140, 140, 140),
              ),
            )),
      ));
    }
    _tagContent = new Row(children: tiles);

    ///话题
    List<Row> topicTiles = [];
    Widget _topicContent;
    for (var item in user.topics) {
      topicTiles.add(Row(
        children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 8.0, top: 3, bottom: 3),
              child: Text(
                "#",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 182, 182, 182)),
              )),
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 7.0, top: 3, bottom: 3),
              child: Text(
                item.title,
                textAlign: TextAlign.left,
              )),
        ],
      ));
    }

    _topicContent = new Column(children: topicTiles);

    return Container(
        child: Container(
          margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 56,
                      height: 56,
                      padding: EdgeInsets.only(left: 10),
                      margin: new EdgeInsets.only(
                          left: 0, top: 6.0, bottom: 2.0, right: 4),
                      child: ClipOval(
                        child: Image.network(
                          user.avatar,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      //padding:new EdgeInsets.only(left:10,top: 6.0, bottom: 2.0,right: 4),
                      margin: new EdgeInsets.only(
                          left: 8, top: 6.0, bottom: 2.0, right: 8),
                      width: MediaQuery.of(context).size.width - 130,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              user.name,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: "Courier",
                              ),
                            ),
                          ),
                          Container(
                              margin: new EdgeInsets.only(
                                  left: 0, top: 0, bottom: 0, right: 0),
                              child: new Text(
                                user.title,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              alignment: Alignment.topLeft),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              _topicContent, //话题
              _tagContent, //标签

              Row(

                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    child: Image.asset('imgs/icon_place~iphone.png',),
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 7, top: 5, bottom: 7, right: 7),
                    child: RichText(
                        text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                  text: user.city+' • ',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Color.fromARGB(255, 154, 154, 154),
                                  )),
                              TextSpan(
                                  text: '帮助了',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Color.fromARGB(255, 154, 154, 154),
                                  )),
                              TextSpan(
                                  text: user.meetsCount.toString(),
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.red,
                                  )),
                              TextSpan(
                                  text: '人 • 评分',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Color.fromARGB(255, 154, 154, 154),
                                  )),
                              TextSpan(
                                  text: (user.rankScore % 100).toString(),
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.red,
                                  )),
                            ])),
                  ),
                ],
              ),

            ],
          ),
        ));
  }
}

* */
