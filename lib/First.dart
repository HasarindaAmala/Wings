import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class First extends StatefulWidget {

  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {

  int _current = 0;

  final List<String> images = [
    "assets/images/controller.jpg",
    "assets/images/Mcheck.jpg",
    "assets/images/mechanic.jpg",
    "assets/images/ContactUs.jpg",

  ];

List<Widget> generateImagesTiles(){
  return images.map((element)=>ClipRRect(
    child: Image.asset(element,
    fit: BoxFit.cover ,
  ),

  borderRadius: BorderRadius.circular(15.0),
  )).toList();
}



  @override
  Widget build(BuildContext context) {

    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(


          body: Center(
            child: Container(
              height: _height,
              width: _width,
              color: Color(0xFF1A193B),
              child: Stack(
                children: [
                  Positioned(
                    bottom: _height*0.84,
                    left: _width*0.07,
                    child: ElevatedButton(
                      onPressed: (){
                        print('fucked');
                      },
                      child:

                      Icon(Icons.menu),
                      style: ElevatedButton.styleFrom(

                        fixedSize: Size(_width*0.1, _height*0.1),
                        shadowColor: Colors.white,
                        elevation: 10.0,
                        backgroundColor: Color(0xFF1A193B),
                        side: BorderSide(color: Colors.white,width: 2),
                        shape: CircleBorder(

                          // borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(

                    left: _width*0.65,


                    child: Container(
                      width: _width*0.35,
                      height: _height*0.8 ,

                      decoration: BoxDecoration(

                        color: Color(0xFF3E98EC),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),),
                      ),

                    ),
                  ),
                  Positioned(
                    bottom: _height*0.84,
                    left: _width*0.75,

                    child: ElevatedButton(
                      onPressed: (){

                      },
                      child: Icon(Icons.shopping_cart_outlined),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(_width*0.1, _height*0.1),
                        shadowColor: Colors.white,
                        elevation: 10.0,
                        backgroundColor: Color(0xFF1A193B),
                        side: BorderSide(color: Colors.white,width: 2),
                        shape: CircleBorder(

                          // borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: _height*0.75,
                    left: _width*0.07,
                    child: Text(
                    "WIIINGS",
                      style: TextStyle(fontSize: 38.0,color: Colors.white,letterSpacing: 1.3,fontFamily:'JacquesFrancois'),

                  ),),
                  Positioned(
                    bottom: _height*0.72,
                    left: _width*0.07,
                    child: Text(
                      "Follow The Dreams",
                      style: TextStyle(fontSize: 18.0,color: Colors.white,letterSpacing: 1.3,fontFamily:'Julee'),

                    ),),
                  //controller button
                  Positioned(
                    bottom: _height*0.6,
                    left: _width*0.07,
                    child: Row(
                      children: [

                        if (_current==0)...[
                          ElevatedButton(onPressed: (){
                            setState(() {
                              _current=0;
                            });
                          }, child: Icon(Icons.videogame_asset_outlined,size: 35.0,),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(_width*0.1, _height*0.09),
                              shadowColor: Colors.white,
                              elevation: 10.0,


                              backgroundColor: Colors.blue,

                              side: BorderSide(color: Colors.white,width: 2),
                            ),),

                        ] else...[
                          ElevatedButton(onPressed: (){
                            setState(() {
                              _current=0;
                            });
                          }, child: Icon(Icons.videogame_asset_outlined,size: 35.0,),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(_width*0.1, _height*0.09),
                              shadowColor: Colors.white,
                              elevation: 10.0,


                              backgroundColor: Color(0xFF1A193B),

                              side: BorderSide(color: Colors.white,width: 2),
                            ),),

                        ],




                        Container(
                          width: _width*0.07,
                        ),

                        if (_current==1)...[
                          ElevatedButton(onPressed: (){}, child: Icon(Icons.thermostat_outlined,size: 35.0,),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(_width*0.1, _height*0.09),
                              shadowColor: Colors.white,
                              elevation: 10.0,
                              backgroundColor: Colors.blue,
                              side: BorderSide(color: Colors.white,width: 2),
                            ),
                          ),

                        ] else...[
                          ElevatedButton(onPressed: (){}, child: Icon(Icons.thermostat_outlined,size: 35.0,),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(_width*0.1, _height*0.09),
                              shadowColor: Colors.white,
                              elevation: 10.0,
                              backgroundColor: Color(0xFF1A193B),
                              side: BorderSide(color: Colors.white,width: 2),
                            ),
                          ),

                        ],


                        Container(
                          width: _width*0.07,
                        ),
                        if (_current==2)...[
                          ElevatedButton(onPressed: (){}, child: Icon(Icons.report_outlined,size: 35.0,),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(_width*0.1, _height*0.09),
                              shadowColor: Colors.white,
                              elevation: 10.0,
                              backgroundColor: Colors.blue,
                              side: BorderSide(color: Colors.white,width: 2),
                            ),
                          ),

                        ] else...[
                          ElevatedButton(onPressed: (){}, child: Icon(Icons.report_outlined,size: 35.0,),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(_width*0.1, _height*0.09),
                              shadowColor: Colors.white,
                              elevation: 10.0,
                              backgroundColor: Color(0xFF1A193B),
                              side: BorderSide(color: Colors.white,width: 2),
                            ),
                          ),

                        ],






                        Container(
                          width: _width*0.07,
                        ),

                        if (_current==3)...[
                          ElevatedButton(onPressed: (){

                          }, child: Icon(Icons.health_and_safety_outlined,size: 35.0,),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(_width*0.1, _height*0.09),
                              shadowColor: Colors.white,
                              elevation: 10.0,
                              backgroundColor: Colors.blue,
                              side: BorderSide(color: Colors.white,width: 2),
                            ),
                          ),

                        ] else...[
                          ElevatedButton(onPressed: (){

                          }, child: Icon(Icons.health_and_safety_outlined,size: 35.0,),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(_width*0.1, _height*0.09),
                              shadowColor: Colors.white,
                              elevation: 10.0,
                              backgroundColor: Color(0xFF1A193B),
                              side: BorderSide(color: Colors.white,width: 2),
                            ),
                          ),

                        ],


                      ],
                    ),),
              Positioned(
                bottom: 0.04*_height,
                left: _width*0.05,

                child: Container(

                  width: _width*0.9,
                  height: _height*0.08,

                  decoration: BoxDecoration(
                    color: Color(0xFF42417A).withOpacity(1),
                    borderRadius: BorderRadius.all( Radius.circular(12.0),),
                    border: Border.all(color: Colors.white.withOpacity(0.6),width: 2 ,),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Colors.white.withOpacity(0.3),
                        offset: Offset(-3.0, 3.0),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: _width*0.02,
                      ),
                      ElevatedButton(onPressed: (){}, child: Row(
                        children: [
                          Icon(Icons.home,size: 20.0,),
                          SizedBox(width: _width*0.01,),
                          Text('Home'),
                        ],
                      ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(_width*0.25, _width*0.06),
                          //shadowColor: Colors.white,
                          elevation: 10.0,
                          backgroundColor: Colors.blue,
                          side: BorderSide(color: Colors.white,width: 2),
                        ),
                      ),
                      SizedBox(
                        width: _width*0.03,
                      ),

                      ElevatedButton(onPressed: (){}, child: Icon(Icons.verified_user_outlined,size: 25.0,),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(_width*0.1, _width*0.06),
                          //shadowColor: Colors.white,
                          elevation: 10.0,
                          backgroundColor: Colors.white12,
                          side: BorderSide(color: Colors.white,width: 2),
                        ),
                      ),
                      SizedBox(
                        width: _width*0.03,
                      ),

                      ElevatedButton(onPressed: (){}, child: Icon(Icons.settings,size: 25.0,),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(_width*0.1, _width*0.06),
                          //shadowColor: Colors.white,
                          elevation: 10.0,
                          backgroundColor: Colors.white12,
                          side: BorderSide(color: Colors.white,width: 2),
                        ),
                      ),
                      SizedBox(
                        width: _width*0.03,
                      ),

                      ElevatedButton(onPressed: (){


                      }, child: Icon(Icons.report_outlined,size: 30.0,),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(_width*0.05, _width*0.06),
                          //shadowColor: Colors.white,
                          elevation: 10.0,
                          backgroundColor: Colors.white12,
                          side: BorderSide(color:Colors.white,width: 1),
                        ),
                      ),
                      SizedBox(
                        width: _width*0.03,
                      ),


                    ],
                  ),


                ),
              ),
                  Positioned(
                    height: _height*0.45,
                    width: _width,
                    top: _height*0.42,
                    left: _width*0.0,
                    child: GestureDetector(
                      onTap: (){
                        if(_current == 0){
                          Navigator.of(context).pushNamed('/Control');
                        }else if(_current==1){
                          Navigator.of(context).pushNamed('/Medical');
                        }else if(_current==2){
                          Navigator.of(context).pushNamed('/Safety');
                        }else if(_current==3){
                          Navigator.of(context).pushNamed('/ConnectUs');
                        }


                      },
                      child: CarouselSlider(items: generateImagesTiles(),
                          options: CarouselOptions(
                            enlargeFactor: 0.25,
                            enlargeCenterPage: true,
                            viewportFraction: 0.8,
                            enableInfiniteScroll: false,
                            onPageChanged: (index,other){
                              setState(() {
                                 _current = index;
                              });
                            }

                          )
                      ),
                    ),
                  ),
                ],

              ),
            ),
          ),



    );

  }




}
