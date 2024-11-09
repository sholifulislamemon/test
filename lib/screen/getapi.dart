import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/PostModel.dart';


class Getapi extends StatefulWidget {
  const Getapi({super.key});

  @override
  State<Getapi> createState() => _GetapiState();
}

class _GetapiState extends State<Getapi> {




  List<PostModel> postlist=[];
  Future<List<PostModel>> getapi()async{
    final response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if( response.statusCode == 200){
      for ( Map i in data){
        postlist.add(PostModel.fromJson(i));
      }
      return postlist;

    }else{
      return postlist;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Get api"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getapi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData){
                  return CircularProgressIndicator();
                }else{
                  return ListView.builder(
                    itemCount: postlist.length,
                    itemBuilder: (context, index) {
                      final data = postlist[index];
                      return ListTile(
                        title: Text(data.address!.geo!.lat.toString()),
                      );
                    },);
            
                }
              },),
          )
        ],
      ) ,
    );
  }
}


