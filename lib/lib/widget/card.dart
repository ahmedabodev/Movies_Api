import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/getpop.dart';
import '../const.dart';
import '../screens/ontop1.dart';


class card extends ConsumerWidget {
  @override
  Widget build(BuildContext context,watch) {
    final viewmodelpop=watch(getpop1);
    return  Container(
      height: MediaQuery.of(context).size.height/2.2,
      margin: EdgeInsets.only(top: 15),
      child: viewmodelpop.listdatamodel.isEmpty?Center(child: CircularProgressIndicator()):
      ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: viewmodelpop.listdatamodel.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  elevation: 10,
                  shadowColor: Colors.indigo,
                  color:Colors.transparent,

                  child:  GestureDetector(

                  onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
          return ontop1(
            imagback:imgsor+viewmodelpop.listdatamodel[index].poster_path,
          img: imgsor+viewmodelpop.listdatamodel[index].backdrop_path,
          title: viewmodelpop.listdatamodel[index].title,
          overview: viewmodelpop.listdatamodel[index].overview,
          release_date: viewmodelpop.listdatamodel[index].release_date,
          vote_average: viewmodelpop.listdatamodel[index].vote_average.toString());
          }));
          },
                    child: Container(
                        width: MediaQuery.of(context).size.width/2.4,
                        child:  ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(imgsor+viewmodelpop.listdatamodel[index].poster_path))),
                  ),
                ),
              

              ],
            ),
          );
        },

      ),

    );
  }
}
