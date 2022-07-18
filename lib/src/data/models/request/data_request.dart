import 'dart:convert';

class DataRequest {
  DataRequest({
    required this.data,
  });

  final String data;

  factory DataRequest.fromJson(String str) =>
      DataRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataRequest.fromMap(Map<String, dynamic> json) => DataRequest(
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "data": data,
      };
}
