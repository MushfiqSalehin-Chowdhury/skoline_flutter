class LogInResponse {
  String token;
  int status;
  String error;
  String message;

  LogInResponse({this.token, this.status, this.error, this.message});

  LogInResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    status = json['status'];
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['status'] = this.status;
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}