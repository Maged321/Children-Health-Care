class Subtitles_Video_Model {
  int? id;
  String? subtitleName;
  String? subtitle;
  int? videoID;

  Subtitles_Video_Model(
      {this.id, this.subtitleName, this.subtitle, this.videoID});

  Subtitles_Video_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subtitleName = json['subtitle_name'];
    subtitle = json['subtitle'];
    videoID = json['video_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subtitle_name'] = this.subtitleName;
    data['subtitle'] = this.subtitle;
    data['video_ID'] = this.videoID;
    return data;
  }
}
