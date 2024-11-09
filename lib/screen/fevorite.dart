import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobtest/controller/counterController.dart';

class Fevorite extends StatefulWidget {
   Fevorite({super.key});




  @override
  State<Fevorite> createState() => _FevoriteState();
}
CounterController controller = Get.put(CounterController());




class _FevoriteState extends State<Fevorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: controller.product_list.length,
        itemBuilder: (context, index) {
        return Obx(() {
          return ListTile(
            onTap: (){

              if ( controller.fevoriteList.contains(controller.product_list[index].toString())
              ){
                controller.fevoriteList.remove(controller.product_list[index].toString());
              }
              else{
                controller.fevoriteList.add(controller.product_list[index].toString());
              }
            },
            title: Text(controller.product_list[index].toString(),style: TextStyle(
                fontSize: 25
            ),),
            trailing: IconButton(onPressed: (){

              if ( controller.fevoriteList.contains(controller.product_list[index].toString())
              ){
                controller.fevoriteList.remove(controller.product_list[index].toString());
              }
              else{
                controller.fevoriteList.add(controller.product_list[index].toString());
              }
            }, icon:Icon(Icons.favorite,
              color: controller.fevoriteList.contains(controller.product_list[index].toString())? Colors.red: Colors.black,)),
            leading: ElevatedButton(onPressed: () {
              controller.deleteProduct(controller.product_list[index]);
            }, child: Icon(Icons.delete)),
          );
        },);
      },),
    );
  }
}
