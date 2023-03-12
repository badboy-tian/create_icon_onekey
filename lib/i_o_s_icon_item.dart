import 'package:create_icon/generated/json/base/json_field.dart';
import 'package:create_icon/generated/json/i_o_s_icon_item.g.dart';
import 'dart:convert';

@JsonSerializable()
class IOSIconItem {

	late List<IOSIconItemImages> images;
	late IOSIconItemInfo info;
  
  IOSIconItem();

  factory IOSIconItem.fromJson(Map<String, dynamic> json) => $IOSIconItemFromJson(json);

  Map<String, dynamic> toJson() => $IOSIconItemToJson(this);

  IOSIconItem copyWith({List<IOSIconItemImages>? images, IOSIconItemInfo? info}) {
      return IOSIconItem()..images= images ?? this.images
			..info= info ?? this.info;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IOSIconItemImages {

	late String size;
	late String idiom;
	late String filename;
	late String scale;
  
  IOSIconItemImages();

  factory IOSIconItemImages.fromJson(Map<String, dynamic> json) => $IOSIconItemImagesFromJson(json);

  Map<String, dynamic> toJson() => $IOSIconItemImagesToJson(this);

  IOSIconItemImages copyWith({String? size, String? idiom, String? filename, String? scale}) {
      return IOSIconItemImages()..size= size ?? this.size
			..idiom= idiom ?? this.idiom
			..filename= filename ?? this.filename
			..scale= scale ?? this.scale;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IOSIconItemInfo {

	late int version;
	late String author;
  
  IOSIconItemInfo();

  factory IOSIconItemInfo.fromJson(Map<String, dynamic> json) => $IOSIconItemInfoFromJson(json);

  Map<String, dynamic> toJson() => $IOSIconItemInfoToJson(this);

  IOSIconItemInfo copyWith({int? version, String? author}) {
      return IOSIconItemInfo()..version= version ?? this.version
			..author= author ?? this.author;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}