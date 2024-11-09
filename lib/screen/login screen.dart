import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobtest/controller/counterController.dart';
class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  CounterController controller =Get.put(CounterController());
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  String? _validatepasseword(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
  String? _validateemail(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
  void _register() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration Successful')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Form(
                key:_formKey ,
                child:Column(
              children: [
                TextFormField(
                  validator: _validateemail,
                  controller:emailcontroller ,
                  decoration: InputDecoration(
                      hintText: "email"
                  ),
                ),
                SizedBox(
                  height: 20,
                )
                ,TextFormField(
                  validator: _validatepasseword,
                  controller:passwordcontroller ,
                  decoration: InputDecoration(
                      hintText: "password"
                  ),
                ),
              ],
            )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              _register();
              controller.login(emailcontroller.text.toString(), passwordcontroller.text.toString());
            }, child: Text(" Login"))
          ],
        ),
      ),
    );
  }
}
