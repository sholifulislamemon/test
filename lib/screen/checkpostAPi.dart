import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobtest/controller/postCntroller.dart';

class Checkpostapi extends StatefulWidget {
  const Checkpostapi({super.key});

  @override
  State<Checkpostapi> createState() => _CheckpostapiState();
}

class _CheckpostapiState extends State<Checkpostapi> {

  PostController controller = Get.put( PostController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: controller.fnameController,
                decoration: InputDecoration(
                  hintText: "name"
                ),
              ),
              TextFormField(
                controller: controller.lnameController,
                decoration: InputDecoration(
                  hintText: "name"
                ),
              ),
              TextFormField(
                controller: controller.pnameController,
                decoration: InputDecoration(
                  hintText: "name"
                ),
              ),
              TextFormField(
                controller: controller.renameController,
                decoration: InputDecoration(
                  hintText: "name"
                ),
              ),
              ElevatedButton(onPressed: (){

                controller.create(

                );

              }, child: Text("Post"))
      
            ],
          ),
        ),
      ),
    );
  }
}
