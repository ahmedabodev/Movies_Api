import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../api/now_playing.dart';
import '../const.dart';
import '../screens/ontop1.dart';



class carousel_slider extends ConsumerWidget {



  @override
  Widget build(BuildContext context,watch) {
    final viewmodel=watch(getnowplaying);
    return  Padding(
      padding: const EdgeInsets.only(top: 10),
      child: CarouselSlider.builder(
        itemCount:viewmodel.listdatamodel.length ,
        options:CarouselOptions(
          height: MediaQuery.of(context).size.height/3,
          aspectRatio:1.0,
          viewportFraction:0.83,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ), itemBuilder: (BuildContext context, int index, int realIndex) {
        return viewmodel.listdatamodel.isEmpty?Center(child: CircularProgressIndicator()): GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return ontop1(
                  imagback:imgsor+viewmodel.listdatamodel[index].poster_path,
                  img: imgsor+viewmodel.listdatamodel[index].backdrop_path,
                  title: viewmodel.listdatamodel[index].title,
                  overview: viewmodel.listdatamodel[index].overview,
                  release_date: viewmodel.listdatamodel[index].release_date,
                  vote_average: viewmodel.listdatamodel[index].vote_average.toString());
            }));
          },
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(image:NetworkImage(imgsor+viewmodel.listdatamodel[index].poster_path),
                fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width/1.1,

                ),
              ),
              Row(
                children: [
                  Expanded(
                      flex: 60,
                      child:
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        alignment: Alignment.bottomLeft,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            onPressed: () {  },
                            color: Color(0xff252a36),
                            child:Text(viewmodel.listdatamodel[index].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),

                        ),
                      )
                  ),
                  Expanded(
                    flex: 35,
                    child:  Container(
                      margin: EdgeInsets.only(right: 10),
                      alignment: Alignment.bottomRight,
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        onPressed: () {  },
                        color: Color(0xff252a36),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(viewmodel.listdatamodel[index].vote_average.toString()+'/10 ',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,

                              ),
                              textAlign: TextAlign.center,
                            ),
                          Icon(Icons.star,color: Color(0xfff7c411),size: 17,)
                          ],
                        )
                      ),
                    )

          ),
          //           child: Container(
          //             height: 20,
          //             alignment: Alignment.bottomRight,
          // decoration: BoxDecoration(
          //   color: Color(0xff252a36),
          // borderRadius: BorderRadius.circular(20)
          // ),
          //             child: Text(viewmodel.listdatamodel[index].vote_average.toString()+'/10 ',
          //               style: TextStyle(
          //                 color: Colors.white,
          //               ),
          //               textAlign: TextAlign.center,
          //             ),
          //
          // ),


                ],
              )
            ],
          ),
        );
      },

      ),
    );
  }

}
