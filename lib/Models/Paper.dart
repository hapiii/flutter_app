class Paper {
  String msg;
  String code;
  Result result;

  Paper({this.msg, this.code, this.result});

  Paper.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  List<ExamDetailInfo> examDetailInfo;
  int subjectNum;

  Result({this.examDetailInfo, this.subjectNum});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['examDetailInfo'] != null) {
      examDetailInfo = new List<ExamDetailInfo>();
      json['examDetailInfo'].forEach((v) {
        examDetailInfo.add(new ExamDetailInfo.fromJson(v));
      });
    }
    subjectNum = json['subject_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.examDetailInfo != null) {
      data['examDetailInfo'] =
          this.examDetailInfo.map((v) => v.toJson()).toList();
    }
    data['subject_num'] = this.subjectNum;
    return data;
  }
}

class ExamDetailInfo {

  String subjectType;
  String myAnswer;
  String exaPoint;
  String subjectDes;
  String subjectIndex;

  String correctItem;
  String analysis;
  String correctIndex;
  String createTime;
  String paperTypeId;
  String sectionCode;
  String materialDecript;
  List<Selections> selections;
  String combinationId;
  String subjectId;
  String source;
  String subjectName;
  String materialId;
  String confoundIndex;
  List<String> correctIndexeList;
  int totalNum;

  ExamDetailInfo(
      {

        this.subjectType,
        this.myAnswer,
        this.exaPoint,
        this.subjectDes,
        this.subjectIndex,

        this.correctItem,
        this.analysis,
        this.correctIndex,
        this.createTime,
        this.paperTypeId,
        this.sectionCode,
        this.materialDecript,
        this.selections,
        this.combinationId,
        this.subjectId,
        this.source,
        this.subjectName,
        this.materialId,
        this.confoundIndex,
        this.correctIndexeList,
        this.totalNum});

  ExamDetailInfo.fromJson(Map<String, dynamic> json) {

    subjectType = json['subjectType'];
    myAnswer = json['myAnswer'];
    exaPoint = json['exaPoint'];
    subjectDes = json['subjectDes'];
    subjectIndex = json['subjectIndex'];
    correctItem = json['correctItem'];
    analysis = json['analysis'];
    correctIndex = json['correctIndex'];
    createTime = json['createTime'];
    paperTypeId = json['paperTypeId'];
    sectionCode = json['section_code'];
    materialDecript = json['materialDecript'];
    if (json['selections'] != null) {
      selections = new List<Selections>();
      json['selections'].forEach((v) {
        selections.add(new Selections.fromJson(v));
      });
    }
    combinationId = json['combination_id'];
    subjectId = json['subjectId'];
    source = json['source'];
    subjectName = json['subjectName'];
    materialId = json['materialId'];
    confoundIndex = json['confoundIndex'];
    correctIndexeList = json['correctIndexeList'].cast<String>();
    totalNum = json['totalNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subjectType'] = this.subjectType;
    data['myAnswer'] = this.myAnswer;
    data['exaPoint'] = this.exaPoint;
    data['subjectDes'] = this.subjectDes;
    data['subjectIndex'] = this.subjectIndex;

    data['correctItem'] = this.correctItem;
    data['analysis'] = this.analysis;
    data['correctIndex'] = this.correctIndex;
    data['createTime'] = this.createTime;
    data['paperTypeId'] = this.paperTypeId;
    data['section_code'] = this.sectionCode;
    data['materialDecript'] = this.materialDecript;
    if (this.selections != null) {
      data['selections'] = this.selections.map((v) => v.toJson()).toList();
    }
    data['combination_id'] = this.combinationId;
    data['subjectId'] = this.subjectId;
    data['source'] = this.source;
    data['subjectName'] = this.subjectName;
    data['materialId'] = this.materialId;
    data['confoundIndex'] = this.confoundIndex;
    data['correctIndexeList'] = this.correctIndexeList;
    data['totalNum'] = this.totalNum;
    return data;
  }
}

class Selections {
  String itemId;
  String itemDecript;
  String itemIndex;

  Selections({this.itemId, this.itemDecript, this.itemIndex});

  Selections.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    itemDecript = json['itemDecript'];
    itemIndex = json['itemIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;
    data['itemDecript'] = this.itemDecript;
    data['itemIndex'] = this.itemIndex;
    return data;
  }
}
