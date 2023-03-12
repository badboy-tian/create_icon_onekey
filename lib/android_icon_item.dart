import 'package:create_icon/generated/json/base/json_field.dart';
import 'package:create_icon/generated/json/android_icon_item.g.dart';
import 'dart:convert';

@JsonSerializable()
class AndroidIconItem {

	late List<AndroidIconItemImages> images;
	late AndroidIconItemInfo info;
  
  AndroidIconItem();

  factory AndroidIconItem.fromJson(Map<String, dynamic> json) => $AndroidIconItemFromJson(json);

  Map<String, dynamic> toJson() => $AndroidIconItemToJson(this);

  AndroidIconItem copyWith({List<AndroidIconItemImages>? images, AndroidIconItemInfo? info}) {
      return AndroidIconItem()..images= images ?? this.images
			..info= info ?? this.info;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AndroidIconItemImages {

	late String size;
	late String dir;
	late String filename;
  
  AndroidIconItemImages();

  factory AndroidIconItemImages.fromJson(Map<String, dynamic> json) => $AndroidIconItemImagesFromJson(json);

  Map<String, dynamic> toJson() => $AndroidIconItemImagesToJson(this);

  AndroidIconItemImages copyWith({String? size, String? dir, String? filename}) {
      return AndroidIconItemImages()..size= size ?? this.size
			..dir= dir ?? this.dir
			..filename= filename ?? this.filename;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AndroidIconItemInfo {

	late int version;
	late String author;
  
  AndroidIconItemInfo();

  factory AndroidIconItemInfo.fromJson(Map<String, dynamic> json) => $AndroidIconItemInfoFromJson(json);

  Map<String, dynamic> toJson() => $AndroidIconItemInfoToJson(this);

  AndroidIconItemInfo copyWith({int? version, String? author}) {
      return AndroidIconItemInfo()..version= version ?? this.version
			..author= author ?? this.author;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}