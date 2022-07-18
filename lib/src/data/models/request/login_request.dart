import 'dart:convert';

class LoginRequest {
  LoginRequest({
    required this.phoneNumber,
    required this.phoneUdid,
    required this.login,
    required this.password,
    required this.terminal,
    required this.culture,
  });

  String phoneNumber;
  String phoneUdid;
  String login;
  String password;
  String terminal;
  String culture;

  factory LoginRequest.fromJson(String str) =>
      LoginRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginRequest.fromMap(Map<String, dynamic> json) =>
      LoginRequest(
        phoneNumber: json["phoneNumber"],
        phoneUdid: json["phoneUdid"],
        login: json["login"],
        password: json["password"],
        terminal: json["terminal"],
        culture: json["culture"],
      );

  Map<String, dynamic> toMap() => {
        "phoneNumber": phoneNumber,
        "phoneUdid": phoneUdid,
        "login": login,
        "password": password,
        "terminal": terminal,
        "culture": culture,
      };
}
