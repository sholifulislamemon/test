import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController{
  TextEditingController fnameController= TextEditingController();
  TextEditingController lnameController= TextEditingController();
  TextEditingController pnameController= TextEditingController();
  TextEditingController renameController= TextEditingController();

  create() async{
    var body={
      "description":fnameController.text,
      "image":lnameController.text,
      "id":pnameController.text,
      "price":renameController.text,
          };
    var header={
      "Content-Type":"application/x-www-form-urlencoded"
    };
    
    var responce = await http.post(Uri.parse("https://fakestoreapi.com/products"),
      body: jsonEncode(body),
      headers: header

    );
    if ( responce.statusCode ==200){
      Get.snackbar(" hello dear", " your are sucsess");
    }else{
      Get.snackbar(" hello dear", " your are faild");
    }
    
  }


}