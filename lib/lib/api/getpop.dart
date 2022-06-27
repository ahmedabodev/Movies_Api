import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../model/model.dart';
final getpop1=ChangeNotifierProvider<Getpopapi>((ref)=>Getpopapi());
class Getpopapi extends ChangeNotifier{
  List<model>listdatamodel=[];

  Getpopapi(){
    getData();
  }

  Future getData()async {
    listdatamodel=[];

    try{
      String apikey='def289d51815dab867fbd1e64867140c';
      var url=  Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apikey&language=en-US');
      var response = await http.get(url);
      var responsebody=jsonDecode(response.body)['results'];
      print(responsebody);
      for(int i=0;i<responsebody.length;i++)
      {
        listdatamodel.add(model.fromJson(responsebody[i]));
      }

    }catch(e){
      print(e);
    }
    notifyListeners();
  }



}