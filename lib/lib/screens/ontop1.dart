import 'dart:ui';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ontop1 extends ConsumerWidget {
  String img;
  String title;
  String overview;
  String release_date;
  String vote_average;
  String imagback;

  ontop1(
      {required this.img,
      required this.title,
      required this.overview,
      required this.release_date,
      required this.vote_average,
      required this.imagback
      });

  _launchURL(String Url) async {


    await launch(Url);

  }
  @override
  Widget build(BuildContext context, watch) {

    return Scaffold(

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,

        onPressed: (){
         _launchURL('https://azm.to/movie/${title.replaceAll(' ','-')}');
        },
        elevation: 10,
        backgroundColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ), label: Text('Watch now',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w900,
          color: Colors.blueGrey,
        ),
      ),


      ),
      backgroundColor: Color(0xff181920),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    fit: StackFit.expand,
                    children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: FlipCard(
                      fill: Fill.fillFront, // Fill the back side of the card to make in the same size as the front.
                      direction: FlipDirection.HORIZONTAL, // default
                      front:     Image.network(
                        img,fit: BoxFit.fill,
                      ),
                      back:     Image.network(
                        imagback,fit: BoxFit.fill,
                      ),
                  ),
                    ),

                      Container(
                        alignment: Alignment.topLeft,
                        child: IconButton(onPressed:(){
                          Navigator.pop(context);
                        },
                          icon: Icon(Icons.arrow_back,color: Colors.white,
                          size: 30,
                          ),
                        ),
                      )
                    ],
                  )

              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 70,
                      child: Text(
                        title + ' (${release_date})',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 25,
                        child: Container(
                            alignment: Alignment.topRight,
                            child: Row(
                              children: [
                                Text(
                                  vote_average + "/10",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Icon(Icons.star,color: Color(0xfff7c411),)
                              ],
                            ),
                    )
              ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  overview,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.blueGrey,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
