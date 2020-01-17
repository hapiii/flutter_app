import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_app/Models/ZhiHuNews.dart';

class MyController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyControllerState();
}

class MyControllerState extends State<MyController> {

  int _pageIndex = 1;
  RefreshController _refreshController = RefreshController(
      initialRefresh: false);
  Future<List<Stories>> _Datas;
  Future<List<Stories>> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('知乎日报'),
        backgroundColor: Colors.red,
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
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
        onRefresh: _getData,
        onLoading: _getData,
        child: _buildList(),

      ),
    );
  }


  Widget _buildList() {
    return FutureBuilder<List<Stories>>(
      future: _future,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return SpinKitPulse(
              color: Colors.grey,
              size: 100.0,
            );
          case ConnectionState.done:
            print('done');
            if (snapshot.hasError) {
              return Center(
                child: Text('网络请求出错'),
              );
            }
            return generateListView(snapshot.data);
          default:
            return Text("unknow");
        }
      },
    );
  }

  Widget generateListView(List<Stories> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        var indexData = data[index];
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, right: 10, left: 6),
                    child: Text(
                      indexData.title, style: TextStyle(fontSize: 15),),
                  ),
                  flex: 1,
                ),
                Image.network(
                  indexData.images[0],
                  height: 100,
                  width: 100,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<List<Stories>> _onRefresh() async {
    _pageIndex = 1;
    Future<List<Stories>> data = _getData();
    _refreshController.refreshCompleted();
    return data;
  }

  Future<List<Stories>> _loadingMore() async {
    _pageIndex++;
    Future<List<Stories>> data =  _getData();
    _refreshController.loadComplete();
    return data;
  }


  Future<List<Stories>> _getData() async {
    Dio _dio = new Dio();
    var response =
    await _dio.get('https://news-at.zhihu.com/api/4/news/before/20200116');
    return   ZhiHuNews
        .fromJson(response.data)
        .stories;

    return _Datas;
  }


}
