![效果图](https://github.com/hapiii/flutter_app/blob/master/demo/flutter_demo.gif)

年底业务不是那么繁忙,正好公司来年可能要有fluttet写新插件的需求,就花了一周的时间学习并写了一个demo.主要功能如下:
1. 在行首页列表
2. 题库 html展示

学习曲线:
- 网络请求Dio 
- 刷新 pull_to_refresh
- 加载动画 flutter_spinkit
- html 解析 flutter_html
- 模型解析 [JsonToDart](https://javiercbk.github.io/json_to_dart/) json转模型,或者用json_serializable通过脚本生成代码
- UI解耦合,因为在flutter中,万物皆Widget.所以独立出来也比较容易,这里开始我以为是用StatefulWidget, 后来看到gsy_github_app_flutter 里的另一种写法,试了试StatelessWidget也是可以的 
 flutter里外部传参是通过这种方式传到对象里,_方法为私有方法

```
class IssueDetailPage extends StatefulWidget {
  final String userName;

  final String reposName;

  final String issueNum;

  final bool needHomeIcon;

  IssueDetailPage(this.userName, this.reposName, this.issueNum,
      {this.needHomeIcon = false});
```
- 写UI,flutter 的UI可能是更贴近于CSS的盒子布局和android的LinearLayout,因为布局类型太过于丰富,习惯于用frame和masonary的我组合起来不太灵活.
- Widget 生命周期
```
createState->initState->didChangeDependencies->build->addPostFrameCallback->didUpdateWidget->deactivate->dispose
```

一周主要是实现flutter的语法和生命周期,UI布局,剩下的就是了解一下常用的三方框架
