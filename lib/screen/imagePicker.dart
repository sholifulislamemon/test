import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobtest/controller/counterController.dart';
import 'package:jobtest/controller/picturecontoller.dart';

class Imagepicker extends StatefulWidget {
  const Imagepicker({super.key});

  @override
  State<Imagepicker> createState() => _ImagepickerState();
}

class _ImagepickerState extends State<Imagepicker> {

  PictureController controller = Get.put(PictureController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() {
            return Center(
              child: GestureDetector(
                onTap:(){
                  controller.getImage();
                } ,
                child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                        image:DecorationImage(image: controller.imagepath.value.path.isNotEmpty?
                        FileImage(File(controller.imagepath.value.path) )
                            : AssetImage("assets/images/img.png"))
                    ),

                ),
              ),
            );


          },),
          TextFormField(
            controller: controller.firstNameController,
            decoration:InputDecoration(
              hintText: "firstname"
            ),
          ),
          TextFormField(
            controller: controller.lastNameController,
            decoration:InputDecoration(
              hintText: "lastname"
            ),
          ),
          ElevatedButton(onPressed: (){
            controller.sentImage();

          }, child:Text(" picked image",style: TextStyle(fontSize:25,color: Colors.white),),style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,

          ),),

        ],
      ),



    );
  }
}
