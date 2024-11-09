import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobtest/Model/NewsModel.dart';

import '../Model/PostModel.dart';
class Api_services{
  final appApilink= "https://newsapi.org/v2/everything?q=bitcoin&apiKey=b6255c3c49fe4f94919cfc185417945e";
  //================================ complex json  api intrigation  function=========================

Future<NewsModel> getNews()async{
  final response = await http.get(Uri.parse(appApilink));
  var data = jsonDecode(response.body.toString());
  if( response.statusCode == 200){
    return NewsModel.fromJson(data);
  }else{
    return NewsModel.fromJson(data);
  }
}

// with out list name in normal json

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

  //test
  Future<NewsModel> Getapithree()async{
    final response = await http.get(Uri.parse(appApilink));
    var data = jsonDecode(response.body.toString());
    if( response.statusCode == 200){
      return NewsModel.fromJson(data);
    }else{
      return NewsModel.fromJson(data);
    }
  }


  List <PostModel> postmodel= [];
  Future<List<PostModel>> getpost ()async{

    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if ( response.statusCode == 200){
      for( Map i in data){
        postlist.add(PostModel.fromJson(i));
      }
      return postmodel;
    }else {
      return postmodel;
    }


  }

























}