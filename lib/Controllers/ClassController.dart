import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Controllers/TeacherDetailController.dart';
import 'package:flutter_app/DioTestpage.dart';
import 'package:flutter_app/Models/People.dart';
import 'dart:convert';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_app/ClassCell.dart';
import 'package:flutter_app/Controllers/PaperController.dart';
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
                People user = _Datas[index];
                return ClassCell(user,pushSaved);
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

  void pushSaved(String uid) {
    print("跳转啦");
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {

      return PaperController();
      //return TeacherDetailController(uid);
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
