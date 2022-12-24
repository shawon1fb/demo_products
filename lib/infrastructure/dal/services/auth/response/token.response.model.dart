class TokenResponse {
  String? token;
  String? message;

  TokenResponse({this.token, this.message});

  TokenResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    data['message'] = message;
    return data;
  }
}
