import 'dart:convert';

class InitialConfifurationRequest {
  InitialConfifurationRequest({
    required this.indentifier,
  });

  final String indentifier;

  factory InitialConfifurationRequest.fromJson(String str) =>
      InitialConfifurationRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InitialConfifurationRequest.fromMap(Map<String, dynamic> json) =>
      InitialConfifurationRequest(
        indentifier: json["indentifier"],
      );

  Map<String, dynamic> toMap() => {
        "indentifier": indentifier,
      };
}
