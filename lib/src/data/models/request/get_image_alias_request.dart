import 'dart:convert';

class GetImageAliasRequest {
  GetImageAliasRequest({
    required this.phoneNumber,
    required this.phoneUdid,
    required this.userName,
    required this.culture,
  });

  final String phoneNumber;
  final String phoneUdid;
  final String userName;
  final String culture;

  factory GetImageAliasRequest.fromJson(String str) =>
      GetImageAliasRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetImageAliasRequest.fromMap(Map<String, dynamic> json) =>
      GetImageAliasRequest(
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
