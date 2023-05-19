class Subsection_Model {
  String? subsectionName;
  List<Categories>? categories;

  Subsection_Model({this.subsectionName, this.categories});

  Subsection_Model.fromJson(Map<String, dynamic> json) {
    subsectionName = json['Subsection_name'];
    if (json['Categories'] != null) {
      categories = <Categories>[];
      json['Categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Subsection_name'] = this.subsectionName;
    if (this.categories != null) {
      data['Categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? categoryName;
  int? subsection;

  Categories({this.id, this.categoryName, this.subsection});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    subsection = json['subsection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['subsection'] = this.subsection;
    return data;
  }
}
