
import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'HomeUser.g.dart';

@JsonSerializable()

class HomeUser{

  HomeUser(
      this.userId,
      this.title,
      this.id,
      this.body
      );

  int userId;
  String title;
  int id;
  String body;

  //不同的类使用不同的mixin即可
  factory HomeUser.fromJson(Map<String, dynamic> json) => _$HomeUserFromJson(json);
  Map<String, dynamic> toJson() => _$HomeUserToJson(this);

}