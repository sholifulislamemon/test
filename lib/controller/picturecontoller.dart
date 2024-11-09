import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PictureController extends GetxController{

  TextEditingController firstNameController= TextEditingController();
  TextEditingController lastNameController= TextEditingController();


  Rx<File> imagepath =File("").obs;

  get http => null;
  Future getImage() async{
    final ImagePicker imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source:ImageSource.gallery);
    if( image == Null ){
      // imagepath.value = image!.path;
      return;
    }else{
      imagepath.value = File(image!.path);
      imagepath.refresh();
    }
  }

  sentImage() async{
    var request= http.MultipartRequest("POST", Uri.parse("https://fakestoreapi.com/products"));
    request.files.add( await http.MultipartFile.fromPath("file", imagepath.value.path ));



    var response = await request.send();

    if( response.statusCode == 200){
      Get.snackbar("hello dear", "picture send");
    }else{
      Get.snackbar("hello dear", " sending faild");
    }
  }
}