class SongsResponse {
  List<Songs> songsList = [];

  SongsResponse({required this.songsList});

  factory SongsResponse.fromJson(List<dynamic> json) {
    return SongsResponse(
        songsList: json.map((i) => Songs.fromJson(i)).toList());
  }
}

class Songs {
  late Id? iId;
  String url = "";
  String title = "";
  String description = "";
  String thumbnailUrl = "";
  late SharedOn? sharedOn;

  String clientMsgId = "";

  Songs(this.iId, this.url, this.title, this.description, this.thumbnailUrl,
      this.sharedOn, this.clientMsgId);

  Songs.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    url = json['url'];
    title = json['title'];
    description = json['description'];
    thumbnailUrl = json['thumbnail_url'];
    sharedOn =
        json['shared_on'] != null ? SharedOn.fromJson(json['shared_on']) : null;
    clientMsgId = json['client_msg_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.iId != null) {
      data['_id'] = this.iId!.toJson();
    }
    data['url'] = this.url;
    data['title'] = this.title;
    data['description'] = this.description;
    data['thumbnail_url'] = this.thumbnailUrl;
    if (this.sharedOn != null) {
      data['shared_on'] = this.sharedOn!.toJson();
    }
    data['client_msg_id'] = this.clientMsgId;
    return data;
  }
}

class Id {
  String oid = "";

  Id(this.oid);

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid']!=null?json['$oid']:"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['$oid'] = this.oid;
    return data;
  }
}

class SharedOn {
  Date date = Date("");

  SharedOn(this.date);

  SharedOn.fromJson(Map<String, dynamic> json) {
    date = (json['$date'] != null ? Date.fromJson(json['$date']) : Date(""))!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.date != null) {
      data['$date'] = this.date!.toJson();
    }
    return data;
  }
}

class Date {
  String numberLong = "";

  Date(this.numberLong);

  Date.fromJson(Map<String, dynamic> json) {
    numberLong = json['$numberLong']!=null?json['$numberLong']:"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['$numberLong'] = this.numberLong;
    return data;
  }
}
