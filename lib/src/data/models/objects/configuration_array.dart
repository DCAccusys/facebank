import 'dart:convert';

class ConfigurationArray {
  ConfigurationArray({
    required this.code,
    required this.value,
  });

  final String code;
  final String value;

  factory ConfigurationArray.fromJson(String str) =>
      ConfigurationArray.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConfigurationArray.fromMap(Map<String, dynamic> json) =>
      ConfigurationArray(
        code: json["code"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "value": value,
      };
}
