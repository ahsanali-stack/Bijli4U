import 'dart:convert';
import 'dart:developer';
import 'dart:io' as Io;

import 'package:image_picker/image_picker.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';

class ImageProcessor{

  late List<String> images;

  decodeImageList(List<XFile> images,ProgressDialogCodeListener listener) async{
    listener.onShow();
    this.images = [];
    for(int i = 0;i<images.length;i++)
      {
        final bytes = await Io.File(images[i].path).readAsBytes();
        this.images.add(base64.encode(bytes));
        print("File is = ${this.images[i]}");
      }
     listener.onHide(ConstantManager.IMAGE_LIST_SUCCESS, "Success", this.images);

  }

  decodeImage(XFile image,ProgressDialogCodeListener listener) async{
    listener.onShow();
    String mImage = "";

      final bytes = await Io.File(image.path).readAsBytes();
      mImage = base64.encode(bytes);
      print("File is = ${mImage}");

    listener.onHide(ConstantManager.IMAGE_LIST_SUCCESS, "Success", mImage);

  }
}