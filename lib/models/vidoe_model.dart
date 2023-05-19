class Vidoes_Model {
  int? id;
  String? videoName;
  String? videoPath;
  int? category;

  Vidoes_Model({this.id, this.videoName, this.videoPath, this.category});

  Vidoes_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoName = json['video_name'];
    videoPath = json['video_path'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video_name'] = this.videoName;
    data['video_path'] = this.videoPath;
    data['category'] = this.category;
    return data;
  }
}
