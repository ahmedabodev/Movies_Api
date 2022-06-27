import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../api/search.dart';
import '../const.dart';
import 'ontop1.dart';


class searchh extends ConsumerWidget {
  @override

  Widget build(BuildContext context,watch) {
    final viewmodelpop=watch(getsearch);
    return  Scaffold(
      backgroundColor:Color(0xff181920) ,
      appBar:AppBar(
        backgroundColor: Color(0xff181920),
        elevation: 0,
        title: TextFormField(
          style: TextStyle(color: Colors.white),
          // onEditingComplete: () {
          //   setState(() {
          //     getposts();
          //   });
          // },
          onChanged: (value) {
            viewmodelpop.getData();
          },

          decoration: InputDecoration(

            hintStyle: TextStyle(color: Colors.white),
            hintText: 'Search',
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          controller:search
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: viewmodelpop.listdatamodel.isEmpty?Center(child: CircularProgressIndicator()):
        new StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          itemCount: viewmodelpop.listdatamodel.length,
          itemBuilder: (BuildContext context, int index) =>   Padding(
            padding: const EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
            child: Card(

              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
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
                child: Column(
                  children: [
                    Container(child: Image.network(imgsor+viewmodelpop.listdatamodel[index].poster_path)),
                    Text(
                      viewmodelpop.listdatamodel[index].title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.blueGrey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0, staggeredTileBuilder: (int index)=> new StaggeredTile.fit(1),
        )

      ),
    );
  }
}
