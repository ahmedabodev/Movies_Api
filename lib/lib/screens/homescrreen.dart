import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_api/lib/screens/search.dart';

import '../widget/card.dart';
import '../widget/cardtoprated.dart';
import '../widget/cardupcomming.dart';
import '../widget/carousel_slider.dart';

class homescreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff181920),
        leading: IconButton(icon: Icon(Icons.search),onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
         return   searchh();
          }));
        },),
      ),

      backgroundColor: Color(0xff181920),
      body: SafeArea(
        child: ListView(
          children: [
            Column(

              children: [

                carousel_slider(),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 8,top: 30),
                  child: Text('Popular',style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    fontWeight: FontWeight.w900
                  ),),
                ),
                card(),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 8,top: 10),
                  child: Text('Coming Soon',style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w900
                  ),),
                ),
                cardupcomming(),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 8,top: 10),
                  child: Text('Top Rated',style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w900
                  ),),
                ),
                cardtoprated(),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
