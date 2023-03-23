# create_icon

* 一键创建APP桌面图标，输入1024x1024的圆角图，输出android图片和ios图标。<br>
Create APP desktop icons with one click, input 1024x1024 rounded images, output android images and ios icons.<br><br>
* 支持的平台：Windows、macOS  <br>
Supported platforms: Windows, macOS

# 自定义（Custom）

* 1、Android图标修改`assets/android.json`文件<br>
  Android icon modification `assets/android.json` file<br>
```
{
      "size": "36x36",
      "dir": "mipmap-ldpi",
      "filename": "ic_launcher.png"
    }
```

* 2、IOS图标修改`assets/ios.json`文件<br>
  IOS icon modification `assets/ios.json` file<br>
```
{
      "size": "20x20",
      "idiom": "iphone",
      "filename": "icon-20@2x.png",
      "scale": "2x"
    }
```

* 3、MACOS图标修改`assets/mac.json`文件<br>
  MACOS icon modification `assets/mac.json` file<br>
```
 {
      "size" : "16x16",
      "idiom" : "mac",
      "filename" : "app_icon_16.png",
      "scale" : "1x"
    }
```

## 示例图

![img.png](img.png)

![img_1.png](img_1.png)

![img_2.png](img_2.png)