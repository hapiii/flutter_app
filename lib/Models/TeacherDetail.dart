class TeacherDetail {
  String acceptRateZh;
  int attitude;
  String avatar;
  String cardImage;
  String city;
  List<String> images;
  String introduction;
  List<String> introductionImages;
  bool isEnableMeet;
  bool isRecToCurrentUser;
  bool isStared;
  String location;
  int meetsCount;
  MentorEx mentorEx;
  int mentorPrestige;
  String name;
  String nickname;
  String occupation;
  List<PrestigeTags> prestigeTags;
  PriceSettings priceSettings;
  int rankScore;
  String reviewRemark;
  String reviewStatus;
  PriceSettings settings;
  int starsCount;
  String status;
  List<Tags> tags;
  String tier;
  String title;
  List<Topics> topics;
  String type;
  String uid;
  String upgradeImage;
  String video;

  TeacherDetail(
      {this.acceptRateZh,
        this.attitude,
        this.avatar,
        this.cardImage,
        this.city,

        this.images,
        this.introduction,
        this.introductionImages,
        this.isEnableMeet,
        this.isRecToCurrentUser,
        this.isStared,
        this.location,
        this.meetsCount,
        this.mentorEx,
        this.mentorPrestige,
        this.name,
        this.nickname,
        this.occupation,
        this.prestigeTags,
        this.priceSettings,
        this.rankScore,
        this.reviewRemark,
        this.reviewStatus,
        this.settings,
        this.starsCount,
        this.status,
        this.tags,
        this.tier,
        this.title,
        this.topics,
        this.type,
        this.uid,
        this.upgradeImage,
        this.video});

  TeacherDetail.fromJson(Map<String, dynamic> json) {
    acceptRateZh = json['accept_rate_zh'];
    attitude = json['attitude'];
    avatar = json['avatar'];
    cardImage = json['card_image'];
    city = json['city'];

    images = json['images'].cast<String>();
    introduction = json['introduction'];
    introductionImages = json['introduction_images'].cast<String>();
    isEnableMeet = json['is_enable_meet'];
    isRecToCurrentUser = json['is_rec_to_current_user'];
    isStared = json['is_stared'];

    location = json['location'];
    meetsCount = json['meets_count'];
    mentorEx = json['mentor_ex'] != null
        ? new MentorEx.fromJson(json['mentor_ex'])
        : null;
    mentorPrestige = json['mentor_prestige'];
    name = json['name'];
    nickname = json['nickname'];
    occupation = json['occupation'];
    if (json['prestige_tags'] != null) {
      prestigeTags = new List<PrestigeTags>();
      json['prestige_tags'].forEach((v) {
        prestigeTags.add(new PrestigeTags.fromJson(v));
      });
    }
    priceSettings = json['price_settings'] != null
        ? new PriceSettings.fromJson(json['price_settings'])
        : null;

    rankScore = json['rank_score'];
    reviewRemark = json['review_remark'];
    reviewStatus = json['review_status'];
    settings = json['settings'] != null
        ? new PriceSettings.fromJson(json['settings'])
        : null;
    starsCount = json['stars_count'];
    status = json['status'];
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
    upgradeImage = json['upgrade_image'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accept_rate_zh'] = this.acceptRateZh;
    data['attitude'] = this.attitude;
    data['avatar'] = this.avatar;
    data['card_image'] = this.cardImage;
    data['city'] = this.city;

    data['images'] = this.images;
    data['introduction'] = this.introduction;
    data['introduction_images'] = this.introductionImages;
    data['is_enable_meet'] = this.isEnableMeet;
    data['is_rec_to_current_user'] = this.isRecToCurrentUser;
    data['is_stared'] = this.isStared;

    data['location'] = this.location;
    data['meets_count'] = this.meetsCount;
    if (this.mentorEx != null) {
      data['mentor_ex'] = this.mentorEx.toJson();
    }
    data['mentor_prestige'] = this.mentorPrestige;
    data['name'] = this.name;
    data['nickname'] = this.nickname;
    data['occupation'] = this.occupation;
    if (this.prestigeTags != null) {
      data['prestige_tags'] = this.prestigeTags.map((v) => v.toJson()).toList();
    }
    if (this.priceSettings != null) {
      data['price_settings'] = this.priceSettings.toJson();
    }

    data['rank_score'] = this.rankScore;
    data['review_remark'] = this.reviewRemark;
    data['review_status'] = this.reviewStatus;
    if (this.settings != null) {
      data['settings'] = this.settings.toJson();
    }
    data['stars_count'] = this.starsCount;
    data['status'] = this.status;
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
    data['upgrade_image'] = this.upgradeImage;
    data['video'] = this.video;
    return data;
  }
}

class MentorEx {
  String achievement;
  String industry;
  String industryTime;
  String links;

  MentorEx({this.achievement, this.industry, this.industryTime, this.links});

  MentorEx.fromJson(Map<String, dynamic> json) {
    achievement = json['achievement'];
    industry = json['industry'];
    industryTime = json['industry_time'];
    links = json['links'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['achievement'] = this.achievement;
    data['industry'] = this.industry;
    data['industry_time'] = this.industryTime;
    data['links'] = this.links;
    return data;
  }
}

class PrestigeTags {
  String id;
  String name;
  int prestige;

  PrestigeTags({this.id, this.name, this.prestige});

  PrestigeTags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    prestige = json['prestige'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['prestige'] = this.prestige;
    return data;
  }
}

class PriceSettings {
  bool isOpenQuestionDiscount;
  bool isShowAchievement;
  bool isShowEducations;
  bool isShowJobs;
  bool isShowProjectExperiences;
  bool isSupportQuestion;
  int leftQuestionDiscountCount;
  int questionDiscountCount;
  int questionOriginalPrice;
  String questionPayType;
  int questionPrice;

  PriceSettings(
      {this.isOpenQuestionDiscount,
        this.isShowAchievement,
        this.isShowEducations,
        this.isShowJobs,
        this.isShowProjectExperiences,
        this.isSupportQuestion,
        this.leftQuestionDiscountCount,
        this.questionDiscountCount,
        this.questionOriginalPrice,
        this.questionPayType,
        this.questionPrice});

  PriceSettings.fromJson(Map<String, dynamic> json) {
    isOpenQuestionDiscount = json['is_open_question_discount'];
    isShowAchievement = json['is_show_achievement'];
    isShowEducations = json['is_show_educations'];
    isShowJobs = json['is_show_jobs'];
    isShowProjectExperiences = json['is_show_project_experiences'];
    isSupportQuestion = json['is_support_question'];
    leftQuestionDiscountCount = json['left_question_discount_count'];
    questionDiscountCount = json['question_discount_count'];
    questionOriginalPrice = json['question_original_price'];
    questionPayType = json['question_pay_type'];
    questionPrice = json['question_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_open_question_discount'] = this.isOpenQuestionDiscount;
    data['is_show_achievement'] = this.isShowAchievement;
    data['is_show_educations'] = this.isShowEducations;
    data['is_show_jobs'] = this.isShowJobs;
    data['is_show_project_experiences'] = this.isShowProjectExperiences;
    data['is_support_question'] = this.isSupportQuestion;
    data['left_question_discount_count'] = this.leftQuestionDiscountCount;
    data['question_discount_count'] = this.questionDiscountCount;
    data['question_original_price'] = this.questionOriginalPrice;
    data['question_pay_type'] = this.questionPayType;
    data['question_price'] = this.questionPrice;
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
  String abstract;
  String content;
  int id;
  List<Null> images;
  MeetPrice meetPrice;
  int meetsCount;
  PriceSettings priceSettings;
  String title;
  String type;

  Topics(
      {this.abstract,
        this.content,
        this.id,
        this.images,
        this.meetPrice,
        this.meetsCount,
        this.priceSettings,
        this.title,
        this.type});

  Topics.fromJson(Map<String, dynamic> json) {
    abstract = json['abstract'];
    content = json['content'];
    id = json['id'];

    meetPrice = json['meet_price'] != null
        ? new MeetPrice.fromJson(json['meet_price'])
        : null;
    meetsCount = json['meets_count'];
    priceSettings = json['price_settings'] != null
        ? new PriceSettings.fromJson(json['price_settings'])
        : null;
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['abstract'] = this.abstract;
    data['content'] = this.content;
    data['id'] = this.id;

    if (this.meetPrice != null) {
      data['meet_price'] = this.meetPrice.toJson();
    }
    data['meets_count'] = this.meetsCount;
    if (this.priceSettings != null) {
      data['price_settings'] = this.priceSettings.toJson();
    }
    data['title'] = this.title;
    data['type'] = this.type;
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


