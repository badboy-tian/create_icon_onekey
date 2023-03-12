import 'dart:io';

import 'package:flutter/material.dart';

void showToast(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}

Directory checkOrCreateDir(String path) {
  print(path);
  var appIconDir = Directory(path);
  if (!appIconDir.existsSync()) {
    appIconDir.createSync();
  }

  return appIconDir;
}

File checkOrCreateFile(String path) {
  var file = File(path);
  if (!file.existsSync()) {
    file.createSync(recursive: true);
  }

  return file;
}
