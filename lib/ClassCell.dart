import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/Models/People.dart';

class ClassCell extends StatelessWidget {
  final People user;

  ClassCell(this.user);

  @override
  Widget build(BuildContext context) {
    return buildRow(user, context);
  }

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

    return Card(
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
                      left: 8, top: 6.0, bottom: 2.0, right: 4),
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
    ));
  }
}
