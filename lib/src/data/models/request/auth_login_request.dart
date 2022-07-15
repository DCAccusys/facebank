import 'dart:convert';

class AuthLoginRequest {
  AuthLoginRequest({
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

  factory AuthLoginRequest.fromJson(String str) =>
      AuthLoginRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthLoginRequest.fromMap(Map<String, dynamic> json) =>
      AuthLoginRequest(
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
