import 'dart:convert';

import '../objects/image_alias_item.dart';

class GetImageAliasResponse {
    GetImageAliasResponse({
        required this.imagenCollection,
        required this.success,
    });

    final List<ImageAliasItem> imagenCollection;
    final bool success;

    factory GetImageAliasResponse.fromJson(String str) => GetImageAliasResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GetImageAliasResponse.fromMap(Map<String, dynamic> json) => GetImageAliasResponse(
        imagenCollection: List<ImageAliasItem>.from(json["imagenCollection"].map((x) => ImageAliasItem.fromMap(x))),
        success: json["success"],
    );

    Map<String, dynamic> toMap() => {
        "imagenCollection": List<dynamic>.from(imagenCollection.map((x) => x.toMap())),
        "success": success,
    };
}

