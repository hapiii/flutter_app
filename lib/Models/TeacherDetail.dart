class TeacherDetail {
  String acceptRateZh;
  int attitude;
  String avatar;
  String cardImage;
  String city;

  List<String> images;
  String introduction;

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
  List<Null> achievementImages;
  String industry;
  String industryTime;
  String links;

  MentorEx(
      {this.achievement,
        this.achievementImages,
        this.industry,
        this.industryTime,
        this.links});

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

class PriceSettings {
  int companyPrice;
  bool isOpenOfflineDiscount;
  bool isOpenVoiceDiscount;
  bool isSupportOffline;
  bool isSupportVoice;
  int leftOfflineDiscountCount;
  int leftVoiceDiscountCount;
  int offlineDiscountCount;
  String offlineDurationChoice;
  int offlineOriginalPrice;
  String offlinePayType;
  int offlinePrice;
  int voiceDiscountCount;
  String voiceDurationChoice;
  int voiceOriginalPrice;
  String voicePayType;
  int voicePrice;

  PriceSettings(
      {this.companyPrice,
        this.isOpenOfflineDiscount,
        this.isOpenVoiceDiscount,
        this.isSupportOffline,
        this.isSupportVoice,
        this.leftOfflineDiscountCount,
        this.leftVoiceDiscountCount,
        this.offlineDiscountCount,
        this.offlineDurationChoice,
        this.offlineOriginalPrice,
        this.offlinePayType,
        this.offlinePrice,
        this.voiceDiscountCount,
        this.voiceDurationChoice,
        this.voiceOriginalPrice,
        this.voicePayType,
        this.voicePrice});

  PriceSettings.fromJson(Map<String, dynamic> json) {
    companyPrice = json['company_price'];
    isOpenOfflineDiscount = json['is_open_offline_discount'];
    isOpenVoiceDiscount = json['is_open_voice_discount'];
    isSupportOffline = json['is_support_offline'];
    isSupportVoice = json['is_support_voice'];
    leftOfflineDiscountCount = json['left_offline_discount_count'];
    leftVoiceDiscountCount = json['left_voice_discount_count'];
    offlineDiscountCount = json['offline_discount_count'];
    offlineDurationChoice = json['offline_duration_choice'];
    offlineOriginalPrice = json['offline_original_price'];
    offlinePayType = json['offline_pay_type'];
    offlinePrice = json['offline_price'];
    voiceDiscountCount = json['voice_discount_count'];
    voiceDurationChoice = json['voice_duration_choice'];
    voiceOriginalPrice = json['voice_original_price'];
    voicePayType = json['voice_pay_type'];
    voicePrice = json['voice_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_price'] = this.companyPrice;
    data['is_open_offline_discount'] = this.isOpenOfflineDiscount;
    data['is_open_voice_discount'] = this.isOpenVoiceDiscount;
    data['is_support_offline'] = this.isSupportOffline;
    data['is_support_voice'] = this.isSupportVoice;
    data['left_offline_discount_count'] = this.leftOfflineDiscountCount;
    data['left_voice_discount_count'] = this.leftVoiceDiscountCount;
    data['offline_discount_count'] = this.offlineDiscountCount;
    data['offline_duration_choice'] = this.offlineDurationChoice;
    data['offline_original_price'] = this.offlineOriginalPrice;
    data['offline_pay_type'] = this.offlinePayType;
    data['offline_price'] = this.offlinePrice;
    data['voice_discount_count'] = this.voiceDiscountCount;
    data['voice_duration_choice'] = this.voiceDurationChoice;
    data['voice_original_price'] = this.voiceOriginalPrice;
    data['voice_pay_type'] = this.voicePayType;
    data['voice_price'] = this.voicePrice;
    return data;
  }
}
