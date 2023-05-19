class HomeModel {
  int? id;
  String? sectionName;
  String? sectionDescription;
  String? sectionImage;
  String? childAge;
  int? adminID;

  HomeModel(
      {
      this.id,
        this.sectionName,
        this.sectionDescription,
        this.sectionImage,
        this.childAge,
        this.adminID
        });

  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionName = json['section_name'];
    sectionDescription = json['section_description'];
    sectionImage = json['section_image'];
    childAge = json['child_age'];
    adminID = json['admin_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['section_name'] = this.sectionName;
    data['section_description'] = this.sectionDescription;
    data['section_image'] = this.sectionImage;
    data['child_age'] = this.childAge;
    data['admin_ID'] = this.adminID;
    return data;
  }
}


// class HomeModel{
//
//   late HomeDataModel data;
//
//   HomeModel.fromJson(Map<String,dynamic>json){
//
//     data= HomeDataModel.fromJson(json['data']);
//   }
// }
// class HomeDataModel{
//
//   late List<BannerModel>banners= [];
//   late List<SectionsModel>sections= [];
//
//   HomeDataModel.fromJson(Map<String,dynamic>json){
//
//     json['banners'].forEach((element){
//       banners.add(BannerModel.fromJson(element));
//     });
//     json['sections'].forEach((element){
//       sections.add(SectionsModel.fromJson(element));
//     });
//
//   }
// }
// class BannerModel{
//
//   late int  id;
//   late String image;
//
//   BannerModel.fromJson(Map<String,dynamic>json){
//     id=json['id'];
//     image=json['image'];
//   }
// }
// class SectionsModel{
//
//   int? id;
//   String? sectionName;
//   String? sectionDescription;
//   String? sectionImage;
//   String? childAge;
//   int? adminID;
//
//   SectionsModel(
//       {
//       this.id,
//         this.sectionName,
//         this.sectionDescription,
//         this.sectionImage,
//         this.childAge,
//         this.adminID
//         });
//
//   SectionsModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     sectionName = json['section_name'];
//     sectionDescription = json['section_description'];
//     sectionImage = json['section_image'];
//     childAge = json['child_age'];
//     adminID = json['admin_ID'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['section_name'] = this.sectionName;
//     data['section_description'] = this.sectionDescription;
//     data['section_image'] = this.sectionImage;
//     data['child_age'] = this.childAge;
//     data['admin_ID'] = this.adminID;
//     return data;
//   }
// }



