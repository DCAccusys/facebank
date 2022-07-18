import 'dart:convert';

class CommonMessage {
    CommonMessage({
        required this.code,
        required this.message,
        required this.description,
    });

    final String code;
    final String message;
    final String description;

    factory CommonMessage.fromJson(String str) => CommonMessage.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CommonMessage.fromMap(Map<String, dynamic> json) => CommonMessage(
        code: json["code"],
        message: json["message"],
        description: json["description"],
    );

    Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "description": description,
    };
}
