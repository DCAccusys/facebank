import 'dart:convert';

class ImageAliasItem {
    ImageAliasItem({
        required this.imgData,
        required this.imgId,
    });

    final String imgData;
    final int imgId;

    factory ImageAliasItem.fromJson(String str) => ImageAliasItem.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ImageAliasItem.fromMap(Map<String, dynamic> json) => ImageAliasItem(
        imgData: json["imgData"],
        imgId: json["imgId"],
    );

    Map<String, dynamic> toMap() => {
        "imgData": imgData,
        "imgId": imgId,
    };
}
