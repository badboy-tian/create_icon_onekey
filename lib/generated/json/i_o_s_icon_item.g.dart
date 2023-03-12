import 'package:create_icon/generated/json/base/json_convert_content.dart';
import 'package:create_icon/i_o_s_icon_item.dart';

IOSIconItem $IOSIconItemFromJson(Map<String, dynamic> json) {
	final IOSIconItem iOSIconItem = IOSIconItem();
	final List<IOSIconItemImages>? images = jsonConvert.convertListNotNull<IOSIconItemImages>(json['images']);
	if (images != null) {
		iOSIconItem.images = images;
	}
	final IOSIconItemInfo? info = jsonConvert.convert<IOSIconItemInfo>(json['info']);
	if (info != null) {
		iOSIconItem.info = info;
	}
	return iOSIconItem;
}

Map<String, dynamic> $IOSIconItemToJson(IOSIconItem entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['images'] =  entity.images.map((v) => v.toJson()).toList();
	data['info'] = entity.info.toJson();
	return data;
}

IOSIconItemImages $IOSIconItemImagesFromJson(Map<String, dynamic> json) {
	final IOSIconItemImages iOSIconItemImages = IOSIconItemImages();
	final String? size = jsonConvert.convert<String>(json['size']);
	if (size != null) {
		iOSIconItemImages.size = size;
	}
	final String? idiom = jsonConvert.convert<String>(json['idiom']);
	if (idiom != null) {
		iOSIconItemImages.idiom = idiom;
	}
	final String? filename = jsonConvert.convert<String>(json['filename']);
	if (filename != null) {
		iOSIconItemImages.filename = filename;
	}
	final String? scale = jsonConvert.convert<String>(json['scale']);
	if (scale != null) {
		iOSIconItemImages.scale = scale;
	}
	return iOSIconItemImages;
}

Map<String, dynamic> $IOSIconItemImagesToJson(IOSIconItemImages entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['size'] = entity.size;
	data['idiom'] = entity.idiom;
	data['filename'] = entity.filename;
	data['scale'] = entity.scale;
	return data;
}

IOSIconItemInfo $IOSIconItemInfoFromJson(Map<String, dynamic> json) {
	final IOSIconItemInfo iOSIconItemInfo = IOSIconItemInfo();
	final int? version = jsonConvert.convert<int>(json['version']);
	if (version != null) {
		iOSIconItemInfo.version = version;
	}
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		iOSIconItemInfo.author = author;
	}
	return iOSIconItemInfo;
}

Map<String, dynamic> $IOSIconItemInfoToJson(IOSIconItemInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['version'] = entity.version;
	data['author'] = entity.author;
	return data;
}