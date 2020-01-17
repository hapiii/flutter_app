
class People {
  String avatar;
  String city;
  bool isEnableMeet;
  bool isOpenCompanyTopic;
  bool isOpenSubscript;
  bool isStared;
  bool isSupportOffline;
  bool isSupportQuestion;
  bool isSupportVoice;
  String location;
  MeetPrice meetPrice;
  int meetsCount;
  int mentorPrestige;
  String name;
  String occupation;
  double orderScore;
  int rankScore;
  String subscriptContent;
  List<Tags> tags;
  String tier;
  String title;
  List<Topics> topics;
  String type;
  String uid;

  People(
      {this.avatar,
        this.city,
        this.isEnableMeet,
        this.isOpenCompanyTopic,
        this.isOpenSubscript,
        this.isStared,
        this.isSupportOffline,
        this.isSupportQuestion,
        this.isSupportVoice,
        this.location,
        this.meetPrice,
        this.meetsCount,
        this.mentorPrestige,
        this.name,
        this.occupation,
        this.orderScore,
        this.rankScore,
        this.subscriptContent,
        this.tags,
        this.tier,
        this.title,
        this.topics,
        this.type,
        this.uid});

  People.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    city = json['city'];
    isEnableMeet = json['is_enable_meet'];
    isOpenCompanyTopic = json['is_open_company_topic'];
    isOpenSubscript = json['is_open_subscript'];
    isStared = json['is_stared'];
    isSupportOffline = json['is_support_offline'];
    isSupportQuestion = json['is_support_question'];
    isSupportVoice = json['is_support_voice'];
    location = json['location'];
    meetPrice = json['meet_price'] != null
        ? new MeetPrice.fromJson(json['meet_price'])
        : null;
    meetsCount = json['meets_count'];
    mentorPrestige = json['mentor_prestige'];
    name = json['name'];
    occupation = json['occupation'];
    orderScore = json['order_score'];
    rankScore = json['rank_score'];
    subscriptContent = json['subscript_content'];
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    tier = json['tier'];
    title = json['title'];
    if (json['topics'] != null) {
      topics = new List<Topics>();
      json['topics'].forEach((v) {
        topics.add(new Topics.fromJson(v));
      });
    }
    type = json['type'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['city'] = this.city;
    data['is_enable_meet'] = this.isEnableMeet;
    data['is_open_company_topic'] = this.isOpenCompanyTopic;
    data['is_open_subscript'] = this.isOpenSubscript;
    data['is_stared'] = this.isStared;
    data['is_support_offline'] = this.isSupportOffline;
    data['is_support_question'] = this.isSupportQuestion;
    data['is_support_voice'] = this.isSupportVoice;
    data['location'] = this.location;
    if (this.meetPrice != null) {
      data['meet_price'] = this.meetPrice.toJson();
    }
    data['meets_count'] = this.meetsCount;
    data['mentor_prestige'] = this.mentorPrestige;
    data['name'] = this.name;
    data['occupation'] = this.occupation;
    data['order_score'] = this.orderScore;
    data['rank_score'] = this.rankScore;
    data['subscript_content'] = this.subscriptContent;
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    data['tier'] = this.tier;
    data['title'] = this.title;
    if (this.topics != null) {
      data['topics'] = this.topics.map((v) => v.toJson()).toList();
    }
    data['type'] = this.type;
    data['uid'] = this.uid;
    return data;
  }
}

class MeetPrice {
  String payType;
  int price;

  MeetPrice({this.payType, this.price});

  MeetPrice.fromJson(Map<String, dynamic> json) {
    payType = json['pay_type'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pay_type'] = this.payType;
    data['price'] = this.price;
    return data;
  }
}

class Tags {
  int id;
  String name;

  Tags({this.id, this.name});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Topics {
  String title;
  String type;

  Topics({this.title, this.type});

  Topics.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['type'] = this.type;
    return data;
  }
}
