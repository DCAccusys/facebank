import 'dart:convert';

class LoginResponse {
  LoginResponse({
    required this.success,
    required this.message,
    required this.sessionId,
    required this.entityId,
    required this.customerId,
    required this.culture,
    required this.profile,
    required this.login,
    required this.lastConnection,
    required this.pushActive,
  });

  final bool success;
  final dynamic message;
  final String sessionId;
  final String entityId;
  final String customerId;
  final String culture;
  final String profile;
  final dynamic login;
  final String lastConnection;
  final String pushActive;

  factory LoginResponse.fromJson(String str) =>
      LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) =>
      LoginResponse(
        success: json["success"],
        message: json["message"],
        sessionId: json["sessionId"],
        entityId: json["entityId"],
        customerId: json["customerId"],
        culture: json["culture"],
        profile: json["profile"],
        login: json["login"],
        lastConnection: json["lastConnection"],
        pushActive: json["pushActive"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "sessionId": sessionId,
        "entityId": entityId,
        "customerId": customerId,
        "culture": culture,
        "profile": profile,
        "login": login,
        "lastConnection": lastConnection,
        "pushActive": pushActive,
      };
}
