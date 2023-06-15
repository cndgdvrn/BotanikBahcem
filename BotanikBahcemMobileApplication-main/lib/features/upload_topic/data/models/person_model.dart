import 'package:cloud_firestore/cloud_firestore.dart';

class Person {

  String? sellerName;
  String? sellerEmail;
  String? sellerUID;
  String? sellerAvatarUrl;
  String? status;

  Person({
    this.sellerName,
    this.sellerUID,
    this.sellerEmail,
    this.sellerAvatarUrl,
    this.status,
  });


  Person.fromJson(Map<String, dynamic> json)
  {
    sellerName = json["sellerName"];
    sellerUID = json['sellerUID'];
    sellerEmail = json['sellerEmail'];
    sellerAvatarUrl = json['sellerAvatarUrl'];
    status = json['status'];
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["sellerName"] = sellerName;
    data['sellerUID'] = sellerUID;
    data['sellerEmail'] = sellerEmail;
    data['sellerAvatarUrl'] = sellerAvatarUrl;
    data['status'] = status;

    return data;
  }




}