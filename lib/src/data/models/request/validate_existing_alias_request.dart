import 'dart:convert';

class ValidateExistingAliasRequest {
  ValidateExistingAliasRequest({
    required this.phoneNumber,
    required this.phoneUdid,
    required this.userName,
    required this.culture,
  });

  final String phoneNumber;
  final String phoneUdid;
  final String userName;
  final String culture;

  factory ValidateExistingAliasRequest.fromJson(String str) =>
      ValidateExistingAliasRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ValidateExistingAliasRequest.fromMap(Map<String, dynamic> json) =>
      ValidateExistingAliasRequest(
        phoneNumber: json["phoneNumber"],
        phoneUdid: json["phoneUdid"],
        userName: json["userName"],
        culture: json["culture"],
      );

  Map<String, dynamic> toMap() => {
        "phoneNumber": phoneNumber,
        "phoneUdid": phoneUdid,
        "userName": userName,
        "culture": culture,
      };
}
