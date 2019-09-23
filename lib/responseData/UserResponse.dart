class UserResponse {
  List<Klasses> klasses;
  User user;

  UserResponse({this.klasses, this.user});

  UserResponse.fromJson(Map<String, dynamic> json) {
    if (json['klasses'] != null) {
      klasses = new List<Klasses>();
      json['klasses'].forEach((v) {
        klasses.add(new Klasses.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.klasses != null) {
      data['klasses'] = this.klasses.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class Klasses {
  int id;
  String name;
  String iconUrl;
  String bannerUrl;
  String colorCode;

  Klasses({this.id, this.name, this.iconUrl, this.bannerUrl, this.colorCode});

  Klasses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iconUrl = json['icon_url'];
    bannerUrl = json['banner_url'];
    colorCode = json['color_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon_url'] = this.iconUrl;
    data['banner_url'] = this.bannerUrl;
    data['color_code'] = this.colorCode;
    return data;
  }
}

class User {
  String uniqueName;
  String subType;
  String avatar;

  User({this.uniqueName, this.subType, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    uniqueName = json['unique_name'];
    subType = json['sub_type'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unique_name'] = this.uniqueName;
    data['sub_type'] = this.subType;
    data['avatar'] = this.avatar;
    return data;
  }
}