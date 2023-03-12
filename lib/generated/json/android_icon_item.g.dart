import 'package:create_icon/generated/json/base/json_convert_content.dart';
import 'package:create_icon/android_icon_item.dart';

AndroidIconItem $AndroidIconItemFromJson(Map<String, dynamic> json) {
	final AndroidIconItem androidIconItem = AndroidIconItem();
	final List<AndroidIconItemImages>? images = jsonConvert.convertListNotNull<AndroidIconItemImages>(json['images']);
	if (images != null) {
		androidIconItem.images = images;
	}
	final AndroidIconItemInfo? info = jsonConvert.convert<AndroidIconItemInfo>(json['info']);
	if (info != null) {
		androidIconItem.info = info;
	}
	return androidIconItem;
}

Map<String, dynamic> $AndroidIconItemToJson(AndroidIconItem entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['images'] =  entity.images.map((v) => v.toJson()).toList();
	data['info'] = entity.info.toJson();
	return data;
}

AndroidIconItemImages $AndroidIconItemImagesFromJson(Map<String, dynamic> json) {
	final AndroidIconItemImages androidIconItemImages = AndroidIconItemImages();
	final String? size = jsonConvert.convert<String>(json['size']);
	if (size != null) {
		androidIconItemImages.size = size;
	}
	final String? dir = jsonConvert.convert<String>(json['dir']);
	if (dir != null) {
		androidIconItemImages.dir = dir;
	}
	final String? filename = jsonConvert.convert<String>(json['filename']);
	if (filename != null) {
		androidIconItemImages.filename = filename;
	}
	return androidIconItemImages;
}

Map<String, dynamic> $AndroidIconItemImagesToJson(AndroidIconItemImages entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['size'] = entity.size;
	data['dir'] = entity.dir;
	data['filename'] = entity.filename;
	return data;
}

AndroidIconItemInfo $AndroidIconItemInfoFromJson(Map<String, dynamic> json) {
	final AndroidIconItemInfo androidIconItemInfo = AndroidIconItemInfo();
	final int? version = jsonConvert.convert<int>(json['version']);
	if (version != null) {
		androidIconItemInfo.version = version;
	}
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		androidIconItemInfo.author = author;
	}
	return androidIconItemInfo;
}

Map<String, dynamic> $AndroidIconItemInfoToJson(AndroidIconItemInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['version'] = entity.version;
	data['author'] = entity.author;
	return data;
}