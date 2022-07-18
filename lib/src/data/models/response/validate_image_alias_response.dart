import 'dart:convert';

class ValidateExistingAliasResponse {
  ValidateExistingAliasResponse({
    required this.success,
  });

  final bool success;

  factory ValidateExistingAliasResponse.fromJson(String str) =>
      ValidateExistingAliasResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ValidateExistingAliasResponse.fromMap(Map<String, dynamic> json) =>
      ValidateExistingAliasResponse(
        success: json["success"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
      };
}
