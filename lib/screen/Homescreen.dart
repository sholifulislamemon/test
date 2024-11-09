import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobtest/controller/counterController.dart';
import 'package:jobtest/screen/fevorite.dart';
import 'package:jobtest/screen/getapi.dart';
import 'package:jobtest/screen/imagePicker.dart';
import 'package:jobtest/screen/login%20screen.dart';
import 'package:jobtest/screen/news.dart';
import 'package:jobtest/screen/registration_form.dart';

import '../customWidget/slider.dart';
import 'botom tevbar.dart';
import 'checkpostAPi.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  CounterController controller= Get.put(CounterController());


  @override
  Widget build(BuildContext context) {
    final love= controller.notification.value;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              BrandSlider(),
              ElevatedButton(onPressed: () => Get.to(Fevorite()), child: Text("go to fevorite page")),
              ElevatedButton(onPressed: () => Get.to(Imagepicker()), child: Text("go to imagePicker")),
              ElevatedButton(onPressed: () => Get.to(RegistrationForm()), child: Text("go to registration form")),
              ElevatedButton(onPressed: () => Get.to(Getapi()), child: Text("go to Get api screen")),
              ElevatedButton(onPressed: () => Get.to(News()), child: Text("go to Get news screen")),
              ElevatedButton(onPressed: () => Get.to(Login()), child: Text("go to Login screen")),
              ElevatedButton(onPressed: () => Get.to(Checkpostapi()), child: Text("go to Login screen")),
              ElevatedButton(onPressed: () => Get.to(tabvar()), child: Text("go to tavbar")),


              Obx(() {
                return  Center(
                  child: Text("product price is ${controller.price}",style: TextStyle(fontSize: 25),),
                );
              },),
      
            Obx(() {
               return  Center(
                 child: Text(controller.totalPrice(controller.price.value as int ).toString(),style: TextStyle(color: Colors.black,fontSize: 25),),
               );
             },),
      
              Obx(() {
                return Center(child: Text(controller.number.toString() ,style: TextStyle(fontSize: 30),),);
              },),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: (){
                    controller.increement();
                  }, child: Icon(Icons.add)),
                  ElevatedButton(onPressed: (){
                    controller.reset();
                  }, child: Icon(Icons.delete)),
                  ElevatedButton(onPressed: (){
                    controller.decreement();
                  }, child: Icon(Icons.cancel)),
                ],
              ),
              SizedBox(height: 20),
              Obx(() => Center(
                child: Container(
                  height: 200.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                      color: Colors.red.withOpacity(controller.opecity.value)
                  ),
                ),
              ),),
              Obx(() {
                return Slider(value: controller.opecity.value, onChanged: (value) {
                  controller.slider(value);
      
                },);
              },),
              Obx(() {
                final value = controller.notification.value;
      
                return Container(
                  height: controller.opecity.value*350.h,
                  width: controller.opecity.value*350.w,
                  decoration: BoxDecoration(
                    color: value? Colors.red:Colors.cyan
                  ),
                );
              },),
      
              Obx(() {
                return Switch(value: controller.notification.value, onChanged: (value) {
                  controller.notification.value=value;
                },);
              },),


      
      
      
      
      
      
            ],
          ),
        ),
      ),
    );
  }
}
