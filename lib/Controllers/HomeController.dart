import 'package:flutter/material.dart';
import 'package:flutter_app/DioTestpage.dart';
import 'package:flutter_app/Models/HomeUser.dart';
import 'package:flutter_app/HomeRouter.dart';
import 'dart:convert';

class HomeController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeControllerState();
}

class HomeControllerState extends State<HomeController> {

  List _Datas =  List<HomeUser>();

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
        title: Text('HOME'),
        backgroundColor: Colors.red,
      ),
      body:
      _Datas == null?
      Center(child:
      CircularProgressIndicator()
      ):_buildList(),
    );
  }


  Widget _buildList() {

    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _Datas.length,
      itemBuilder: (context,int index){
        return _buildRow(_Datas[index]);
      },);
  }

  Widget _buildRow(HomeUser user) {
    return new ListTile(
      title: new Text(
        user.title,
      ),
      subtitle: new Text(user.body),
      onTap: _pushSaved,
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context){
              return HomeRouter();
            }
        )
    );
  }

  void _getData() {

    NetUtil2.get("https://jsonplaceholder.typicode.com/posts", (response) {
      setState(() {
        List<dynamic> users = jsonDecode(response.data.toString());
        print(users);
        for (int i = 0; i < users.length; i++) {
          HomeUser user = HomeUser.fromJson(users[i]);
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
