import 'dart:convert';

import '../objects/configuration_array.dart';

class InitialConfifurationResponse {
  InitialConfifurationResponse({
    required this.success,
    required this.message,
    required this.configurationArray,
  });

  final bool success;
  final dynamic message;
  final List<ConfigurationArray> configurationArray;

  factory InitialConfifurationResponse.fromJson(String str) =>
      InitialConfifurationResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InitialConfifurationResponse.fromMap(Map<String, dynamic> json) =>
      InitialConfifurationResponse(
        success: json["success"],
        message: json["message"],
        configurationArray: List<ConfigurationArray>.from(
            json["configurationArray"]
                .map((x) => ConfigurationArray.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "configurationArray":
            List<dynamic>.from(configurationArray.map((x) => x.toMap())),
      };
}
