import 'dart:convert';
import 'dart:io';

import 'package:create_icon/android_icon_item.dart';
import 'package:create_icon/commont.dart';
import 'package:create_icon/i_o_s_icon_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var controller = TextEditingController();
  var cbAndroid = true;
  var cbIos = true;
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                //左边创建一个输入框，输入文件路径，右边一个按钮，选择文件
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'file_path'.tr(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _onClickSelectFile();
                  },
                  child: Text('btn_choose'.tr()),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              children: [
                //一个text， 然后2个checkbox
                Text('text_choose'.tr()),
                const SizedBox(width: 10),
                Checkbox(
                  value: cbAndroid,
                  onChanged: (value) {
                    setState(() {
                      cbAndroid = value!;
                    });
                  },
                ),
                const Text('Android'),
                const SizedBox(width: 20),
                Checkbox(
                  value: cbIos,
                  onChanged: (value) {
                    setState(() {
                      cbIos = value!;
                    });
                  },
                ),
                const Text('IOS'),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            //显示一个结果显示区域，背景灰色，可以滑动
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade100,
                ),
                child: SingleChildScrollView(
                  child: Text(
                    result,
                    style: const TextStyle(fontSize: 15, color: Colors.black87),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 16)),
            //右下角一个按钮，点击后，开始创建图标
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _onClickCreate();
                  },
                  child: Text('btn_start'.tr()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onClickSelectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false, type: FileType.custom, allowedExtensions: ['png']);
    if (result == null) {
      showToast(context, "choose_file_tip".tr());
      return;
    }

    File file = File(result.files.first.path!);
    /*if (result.files.first.bytes == null) {
      file = File(result.files.first.path!);
    } else {
      var bytes = result.files.first.bytes;
      var temp = await getTemporaryDirectory();
      file = File("${temp.path}/${result.files.first.name}");
      file.writeAsBytesSync(bytes!);
    }*/

    controller.text = file.path;
  }

  void _onClickCreate() {
    if (controller.text.isEmpty) {
      showToast(context, "choose_file_tip".tr());
      return;
    }

    if (!cbAndroid && !cbIos) {
      showToast(context, "choose_platform_tip".tr());
      return;
    }

    setState(() {
      result = "";
    });

    if (cbAndroid) {
      _createAndroid();
    }

    if (cbIos) {
      _createIos();
    }
  }

  Future<void> _createAndroid() async {
    setState(() {
      result += "${'create_android_icon_tip'.tr()}\n";
    });

    var file = File(controller.text);
    var image = img.decodeImage(file.readAsBytesSync())!;
    var dir = checkOrCreateDir(file.parent.path + "/android");

    var contents = await rootBundle.loadString("assets/android.json");
    var images = AndroidIconItem.fromJson(jsonDecode(contents));
    //遍历images, 根据size生成图片
    for (var item in images.images) {
      var size = item.size;
      var width = double.parse(size.split("x")[0]);
      var height = double.parse(size.split("x")[1]);

      var resized = img.copyResize(image, width: width.toInt(), height: height.toInt());
      var resDir = checkOrCreateDir("${dir.path}/${item.dir}");
      var path = "${resDir.path}/${item.filename}";
      setState(() {
        result += "${'create_file_tip'.tr()}: $path\n";
      });
      var file = checkOrCreateFile(path);
      file.writeAsBytesSync(img.encodePng(resized));
    }

    setState(() {
      result += "Android${'create_success_tip'.tr()}\n";
    });

    final String filePath = dir.absolute.path;
    final Uri uri = Uri.file(filePath);
    await launchUrl(uri);
  }

  Future<void> _createIos() async {
    setState(() {
      result += "\n${'create_ios_icon_tip'.tr()}\n";
    });

    var file = File(controller.text);
    var image = img.decodeImage(file.readAsBytesSync())!;
    var dir = checkOrCreateDir(file.parent.path + "/ios");

    //生成一个AppIcon.appiconset文件夹
    var appIconDir = checkOrCreateDir(dir.path + "/AppIcon.appiconset");
    //生成一个Contents.json文件, 从assets/ios.json中读取
    var contentsFile = checkOrCreateFile(appIconDir.path + "/Contents.json");

    var contents = await rootBundle.loadString("assets/ios.json");
    contentsFile.writeAsStringSync(contents);

    //读取contents，用json
    var json = IOSIconItem.fromJson(jsonDecode(contents));
    var images = json.images;
    //遍历images，根据size生成图片
    for (var imageItem in images) {
      var size = imageItem.size;
      var width = double.parse(size.split("x")[0]);
      var height = double.parse(size.split("x")[1]);

      var scale = int.parse(imageItem.scale.replaceAll("x", ""));
      var resWidth = width * scale;
      var resHeight = height * scale;
      var resized = img.copyResize(image, width: resWidth.toInt(), height: resHeight.toInt());
      var path = "${appIconDir.path}/${imageItem.filename}";
      setState(() {
        result += "${'create_file_tip'.tr()}: $path\n";
      });
      var file = checkOrCreateFile(path);
      file.writeAsBytesSync(img.encodePng(resized));
    }

    setState(() {
      result += "IOS${'create_success_tip'.tr()}\n";
    });

    final String filePath = dir.absolute.path;
    final Uri uri = Uri.file(filePath);
    await launchUrl(uri);
  }
}
