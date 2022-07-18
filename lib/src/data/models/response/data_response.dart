import 'dart:convert';

import 'package:facebank/src/data/models/objects/common_message.dart';

class DataResponse {
  DataResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final CommonMessage? message;
  final String data;

  factory DataResponse.fromJson(String str) =>
      DataResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataResponse.fromMap(Map<String, dynamic> json) => DataResponse(
        success: json["success"],
        message: json["message"] != null
            ? CommonMessage.fromJson(json['message'])
            : null,
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data,
      };
}
