class UserModel{
    String? name;
   String? email;
    String? phone;
    String? uId;
    bool? isEmailVerified;

  UserModel({
     this.name,
     this.email,
     this.phone,
      this.uId,
     this.isEmailVerified,
  });

  //for store data that is user enter
  UserModel.fromJson(Map<String,dynamic>json){
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    uId=json['uId'];
    isEmailVerified=json['isEmailVerified'];


  }
//return data
  Map<String,dynamic>toMap(){
    return{
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
      'isEmailVerified':isEmailVerified,
    };
}
}