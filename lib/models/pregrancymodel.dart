class PregrancyModel {
  String? sectionName;
  List<Subsection>? subsection;

  PregrancyModel({this.sectionName, this.subsection});

  PregrancyModel.fromJson(Map<String, dynamic> json) {
    sectionName = json['section_name'];
    if (json['subsection'] != null) {
      subsection = <Subsection>[];
      json['subsection'].forEach((v) {
        subsection!.add(new Subsection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section_name'] = this.sectionName;
    if (this.subsection != null) {
      data['subsection'] = this.subsection!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subsection {
  int? id;
  String? subsectionName;
  String? subsectionImage;
  String? subsectionIcon;
  int? section;

  Subsection(
      {this.id,
        this.subsectionName,
        this.subsectionImage,
        this.subsectionIcon,
        this.section});

  Subsection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subsectionName = json['subsection_name'];
    subsectionImage = json['subsection_image'];
    subsectionIcon = json['subsection_icon'];
    section = json['section'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subsection_name'] = this.subsectionName;
    data['subsection_image'] = this.subsectionImage;
    data['subsection_icon'] = this.subsectionIcon;
    data['section'] = this.section;
    return data;
  }
}
