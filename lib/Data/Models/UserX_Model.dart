// To parse this JSON data, do
// final userX = userXFromJson(jsonString);

import 'dart:convert';

UserX userXFromJson(String str) => UserX.fromJson(json.decode(str));

String userXToJson(UserX data) => json.encode(data.toJson());

class UserX {
  UserX({
    this.uid,
    this.name,
    this.email,
    this.userName,
    this.profilePhoto,
    this.dob,
    this.age,
  });

  String? uid;
  String? name;
  String? email;
  String? userName;
  String? profilePhoto;
  String? dob;
  int? age;

  factory UserX.fromJson(Map<String, dynamic> json) => UserX(
        uid: json["UID"],
        name: json["NAME"],
        email: json["EMAIL"],
        userName: json["USER_NAME"],
        profilePhoto: json["PROFILE_PHOTO"],
        dob: json["DOB"],
        age: json["AGE"],
      );

  Map<String, dynamic> toJson() => {
        "UID": uid,
        "NAME": name,
        "EMAIL": email,
        "USER_NAME": userName,
        "PROFILE_PHOTO": profilePhoto,
        "DOB":dob,
        "AGE":age
      };

  // Map toMap(UserX user) {
  //   var data = Map<String, dynamic>();
  //   data['UID'] = user.uid;
  //   data['NAME'] = user.name;
  //   data['EMAIL'] = user.email;
  //   data['USER_NAME'] = user.userName;
  //   data["PROFILE_PHOTO"] = user.profilePhoto;
  //   return data;
  // }
}
