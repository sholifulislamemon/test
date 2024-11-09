import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class CounterController extends GetxController{

  RxInt number = 1.obs;
  RxInt price = 500.obs;
  RxInt discount = 120.obs;

  totalPrice( int price){
   int total= price*number.value;
   return total-discount.value;

  }
  increement (){
    if ( number<5){
      number.value++;
    }
  }
  decreement (){
   if ( number>1){
     number--;
   }
  }
  reset (){
    number.value = 1;
  }

  // slider with opecity

  RxDouble opecity = 0.99.obs;


    slider ( double value){

      opecity.value = value;


  }


  // notification slider

 RxBool notification= true.obs;
    notificationFuction( bool value ){
      notification.value=value;
    }


    //fevorite


  RxList product_list = [
    "a","b","c","d","e"
  ].obs;
  RxList fevoriteList=[].obs;


  void deleteProduct(String productName) {
    if (product_list.contains(productName)) {
      product_list.remove(productName);
      print("$productName deleted from favorites.");
    } else {
      print("$productName is not in favorites.");
    }
  }

  // image picket


  TextEditingController priceController= TextEditingController();
  TextEditingController idController= TextEditingController();


  Rx<File> imagepath =File("").obs;
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
        request.fields["price"]=priceController.text;
        request.fields["id"]=idController.text;

        var response = await request.send();

        if( response.statusCode == 200){
          Get.snackbar("hello dear", "picture send");
        }else{
          Get.snackbar("hello dear", " sending faild");
        }
  }

  // login function

void login ( String email, password) async{
    try{
     final response = await post (
        
        Uri.parse("https://reqres.in/api/register"),
        body: {
          "email":email,
          "password":password
        }
      );
     var data = jsonDecode(response.body.toString());
     print(data);
      if( response.statusCode == 200){
         Get.snackbar("Hello Dear", "Your login sucsess");
      }else{
        Get.snackbar("Hello Dear", "Your login faild");
      }
    }catch(e){
      print(e.toString());
    }
}
  }









