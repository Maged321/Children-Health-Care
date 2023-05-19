class Articles_Model {
  String? categoryName;
  List<Articles>? articles;

  Articles_Model({this.categoryName, this.articles});

  Articles_Model.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_name'] = this.categoryName;
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  int? id;
  String? title;
  String? articleDetails;
  String? imagePath;
  int? category;

  Articles(
      {this.id,
        this.title,
        this.articleDetails,
        this.imagePath,
        this.category});

  Articles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    articleDetails = json['article_details'];
    imagePath = json['image_path'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['article_details'] = this.articleDetails;
    data['image_path'] = this.imagePath;
    data['category'] = this.category;
    return data;
  }
}

