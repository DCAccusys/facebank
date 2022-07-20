import 'dart:convert';

class ValidateImagenAliasRequest {
    ValidateImagenAliasRequest({
        required this.phoneNumber,
        required this.phoneUdid,
        required this.userName,
        required this.culture,
        required this.alias,
        required this.imgData,
    });

    final String phoneNumber;
    final String phoneUdid;
    final String userName;
    final String culture;
    final String alias;
    final String imgData;

    factory ValidateImagenAliasRequest.fromJson(String str) => ValidateImagenAliasRequest.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ValidateImagenAliasRequest.fromMap(Map<String, dynamic> json) => ValidateImagenAliasRequest(
        phoneNumber: json["phoneNumber"],
        phoneUdid: json["phoneUdid"],
        userName: json["userName"],
        culture: json["culture"],
        alias: json["alias"],
        imgData: json["imgData"],
    );

    Map<String, dynamic> toMap() => {
        "phoneNumber": phoneNumber,
        "phoneUdid": phoneUdid,
        "userName": userName,
        "culture": culture,
        "alias": alias,
        "imgData": imgData,
    };
}
