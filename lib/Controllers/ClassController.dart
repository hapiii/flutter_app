import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DioTestpage.dart';
import 'package:flutter_app/Models/People.dart';
import 'package:flutter_app/HomeRouter.dart';
import 'dart:convert';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ClassController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ClassControllerState();
}

class ClassControllerState extends State<ClassController> {
  List _Datas = List<People>();
  int _pageIndex = 1;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('在行'),
        backgroundColor: Colors.red,
      ),
      body: _Datas == null
          ? Center(child: CircularProgressIndicator())
          : _buildList(),
    );
  }

  Widget _buildList() {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: ClassicHeader(

      ),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("上拉加载");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("加载失败！点击重试！");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("松手,加载更多!");
          } else {
            body = Text("没有更多数据了!");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _loadingMore,
      child: _Datas.length == 0
          ? SpinKitPulse(
              color: Colors.grey,
              size: 100.0,
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _Datas.length,
              itemBuilder: (context, int index) {
                return _buildRow(_Datas[index]);
              },
            ),
    );
  }

  Future<Null> _onRefresh() async {
    _pageIndex = 1;
    _Datas.clear();
    _getData();
    _refreshController.refreshCompleted();
    return;
  }

  Future<Null> _loadingMore() async {
    _pageIndex++;
    _getData();
    _refreshController.loadComplete();
    return;
  }

  Widget _buildRow(People user) {
    ///任务标签
    List<Container> tiles = [];
    Widget _tagContent;
    for (var item in user.tags) {
      tiles.add(Container(
          //左边添加8像素补白
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 10.0, top: 3, bottom: 3),
          child: Text(
            item.name,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 11,
              backgroundColor: Color.fromARGB(255, 242, 242, 242),
              color: Color.fromARGB(255, 140, 140, 140),
            ),
          )));
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
              //左边添加8像素补白
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
      child: Column(
        children: <Widget>[
          Row(

            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Container(
                padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 2.0),
               child: ClipOval(

                  child: Image.network(
                    user.avatar,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 7, top: 5, bottom: 7 ,right: 7),
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                    child: Text(
                      user.title,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),

          _topicContent, //话题
          _tagContent, //标签

          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 7, top: 5, bottom: 7 ,right: 7),
            child:Text(user.location,
            textAlign: TextAlign.left,
              style: TextStyle(
              color: Colors.blueGrey,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return HomeRouter();
    }));
  }

  void _getData() {
    String url =
        "http://apis-falcon-mentor.zaih.com/v1/mentors/banner?geo=40.00114800347222%2C116.4236773003472&page=${_pageIndex}&per_page=20&rm=manualoperation";
    print(url);
    NetUtil2.get(url, (response) {
      setState(() {
        List<dynamic> users = jsonDecode(response.data.toString());
        print(users);
        for (int i = 0; i < users.length; i++) {
          People user = People.fromJson(users[i]);
          _Datas.add(user);
        }
      });
    }, errorCallBack: (errorMsg) {
      setState(() {
        print("请求出错");
        print(errorMsg);
      });
    });
  }
}
