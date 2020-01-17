import 'package:flutter/material.dart';
import 'PaperCell.dart';

class HomeRouter extends StatelessWidget {

  var _Datas = ["<span class='desClass'> 人是生活在一定的社会场域之中的。从传播的角度看，一举手一投足，都是一种表达。观其行再晓其人，公众就是通过外在举止了解行为人的。举止代表什么意义，解释权往往不在自己，对于公众人物尤其如此。就拿前阵子某市领导打伞观看学生淋雨做操的事件来说，可能领导平时也是爱孩子的，到学校也不过是正常的工作，可对比画面凝固下来，传递出的形象就由不得他了。<br/>这段文字意在强调： </span>",
  "<span class='desClass'> 文段重点在于“举止代表什么意义，解释权往往不在自己，对于公众人物尤其如此”。可见作者意在说明公众人物更应该注重自身形象，防止将自己暴露在舆论之下。结合选项可知，D项与作者意图一致。<br/>A项中的“舆论对公众人物的重要作用”为无中生有，故排除；<br/>B、C 两项均不是文段重点论述的内容，故排除。 <br/>故正确答案为D。</span>",
    "<span class='desClass'> 文段重点在于“举止代表什么意义，解释权往往不在自己，对于公众人物尤其如此”。可见作者意在说明公众人物更应该注重自身形象，防止将自己暴露在舆论之下。结合选项可知，D项与作者意图一致。<br/>A项中的“舆论对公众人物的重要作用”为无中生有，故排除；<br/>B、C 两项均不是文段重点论述的内容，故排除。 <br/>故正确答案为D。</span>", "<span class='desClass'>A. 舆论对公众人物具有极其重要的作用 </span>",
    "<span class='desClass'> 文段重点在于“举止代表什么意义，解释权往往不在自己，对于公众人物尤其如此”。可见作者意在说明公众人物更应该注重自身形象，防止将自己暴露在舆论之下。结合选项可知，D项与作者意图一致。<br/>A项中的“舆论对公众人物的重要作用”为无中生有，故排除；<br/>B、C 两项均不是文段重点论述的内容，故排除。 <br/>故正确答案为D。</span>",
    "<span class='desClass'> 文段重点在于“举止代表什么意义，解释权往往不在自己，对于公众人物尤其如此”。可见作者意在说明公众人物更应该注重自身形象，防止将自己暴露在舆论之下。结合选项可知，D项与作者意图一致。<br/>A项中的“舆论对公众人物的重要作用”为无中生有，故排除；<br/>B、C 两项均不是文段重点论述的内容，故排除。 <br/>故正确答案为D。</span>",
    "<span class='desClass'>B. 公众人物更容易暴露在舆论危墙之下 </span>",
  "<span class='desClass'>C. 舆论主导的公众形象未必与公众人物自身相一致 </span>",
  "<span class='desClass'>D. 公众人物更应注重自身形象 </span>"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情"),

      ),
       body:  _buildList(),
    );
  }

  _buildList(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _Datas.length,
      itemBuilder: (context,int index){
        return PaperCell().cellWithString(_Datas[index]);
      },);
  }

}


