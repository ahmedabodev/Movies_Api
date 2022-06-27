import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../const.dart';
import '../model/model.dart';
final getsearch=ChangeNotifierProvider<getapisearch>((ref)=>getapisearch());
class getapisearch extends ChangeNotifier{
  List<model>listdatamodel=[];

  getapisearch(){
    getData();
  }

  Future getData()async {
    listdatamodel=[];

    try{
      String apikey='5dee1b5aed64498d6077231f7b57111f';
      var url=  Uri.parse('https://api.themoviedb.org/3/search/movie?api_key=$apikey&query=${search.text}&language=en-US&page=1&include_adult=false');
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