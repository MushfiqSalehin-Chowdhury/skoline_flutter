class UserResponse {
  User user;
  List<Progress> progress;

  UserResponse({this.user, this.progress});

  UserResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['progress'] != null) {
      progress = new List<Progress>();
      json['progress'].forEach((v) {
        progress.add(new Progress.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.progress != null) {
      data['progress'] = this.progress.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String childName;
  String uniqueName;
  String phone;
  String birthDate;
  Null email;
  Null location;
  Null newsletter;
  String avatarUrl;

  User(
      {this.childName,
        this.uniqueName,
        this.phone,
        this.birthDate,
        this.email,
        this.location,
        this.newsletter,
        this.avatarUrl});

  User.fromJson(Map<String, dynamic> json) {
    childName = json['child_name'];
    uniqueName = json['unique_name'];
    phone = json['phone'];
    birthDate = json['birth_date'];
    email = json['email'];
    location = json['location'];
    newsletter = json['newsletter'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['child_name'] = this.childName;
    data['unique_name'] = this.uniqueName;
    data['phone'] = this.phone;
    data['birth_date'] = this.birthDate;
    data['email'] = this.email;
    data['location'] = this.location;
    data['newsletter'] = this.newsletter;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}

class Progress {
  String subjectName;
  int completedAdventures;
  int totalAdventures;
  String viewedAdventures;
  String shortCode;
  String colorCode;

  Progress(
      {this.subjectName,
        this.completedAdventures,
        this.totalAdventures,
        this.viewedAdventures,
        this.shortCode,
        this.colorCode});

  Progress.fromJson(Map<String, dynamic> json) {
    subjectName = json['subject_name'];
    completedAdventures = json['completed_adventures'];
    totalAdventures = json['total_adventures'];
    viewedAdventures = json['viewed_adventures'];
    shortCode = json['short_code'];
    colorCode = json['color_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject_name'] = this.subjectName;
    data['completed_adventures'] = this.completedAdventures;
    data['total_adventures'] = this.totalAdventures;
    data['viewed_adventures'] = this.viewedAdventures;
    data['short_code'] = this.shortCode;
    data['color_code'] = this.colorCode;
    return data;
  }
}