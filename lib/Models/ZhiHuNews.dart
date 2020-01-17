
class ZhiHuNews {
  String date;
  List<Stories> stories;

  ZhiHuNews({this.date, this.stories});

  ZhiHuNews.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['stories'] != null) {
      stories = new List<Stories>();
      json['stories'].forEach((v) {
        stories.add(new Stories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.stories != null) {
      data['stories'] = this.stories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stories {
  String imageHue;
  String title;
  String url;
  String hint;
  String gaPrefix;
  List<String> images;
  int type;
  int id;

  Stories(
      {this.imageHue,
        this.title,
        this.url,
        this.hint,
        this.gaPrefix,
        this.images,
        this.type,
        this.id});

  Stories.fromJson(Map<String, dynamic> json) {
    imageHue = json['image_hue'];
    title = json['title'];
    url = json['url'];
    hint = json['hint'];
    gaPrefix = json['ga_prefix'];
    images = json['images'].cast<String>();
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_hue'] = this.imageHue;
    data['title'] = this.title;
    data['url'] = this.url;
    data['hint'] = this.hint;
    data['ga_prefix'] = this.gaPrefix;
    data['images'] = this.images;
    data['type'] = this.type;
    data['id'] = this.id;
    return data;
  }
}
