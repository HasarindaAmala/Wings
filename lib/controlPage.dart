
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class controlPage extends StatefulWidget {
  const controlPage({Key? key}) : super(key: key);

  @override
  State<controlPage> createState() => _controlPageState();
}

class _controlPageState extends State<controlPage> {
  JoystickMode _joystickMode = JoystickMode.all;
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {




    //
    //  // JoystickDirectionCallback? onDirectionChanged(double degrees, double distance) {
    //   String data = "Degree : ${degrees.toStringAsFixed(2)}, distance : ${distance.toStringAsFixed(2)}";
    //   print(data);
    //   return null;
    //
    // }
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
              //Back button----------------------------------------->
              Positioned(
                  top: _height*0.07,
                  left: _width*0.05,

                  child: ElevatedButton(onPressed: () {


                    Navigator.pop(context);
                  }, child: Icon(Icons.arrow_back),
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.white.withOpacity(0.3),
                      elevation: 10.0,
                      shape: CircleBorder(),
                      fixedSize: Size(_width*0.07, _width*0.07),
                      backgroundColor: Color(0xFF1A193B),
                      side: BorderSide(color: Colors.white,width: 2.0),


                    ),
                  ),
              ),
              //direction arrows--------------------------------->
              Positioned(
                top: _height*0.4,
                left: _width*0.07,

                child: Container(
                  // height: _height*0.27,
                  // width: _height*0.27,
                  //
                  // decoration: BoxDecoration(
                  //   shape: BoxShape.circle,
                  //
                  //   //borderRadius: BorderRadius.circular(100.0),
                  //   color: Color(0xFF1A193B),
                  //   border: Border.all(width: 2.0,color: Colors.white70),
                  //   image: DecorationImage(image: AssetImage('assets/images/matt.jpg'),fit: BoxFit.cover,opacity: 0.8)
                  // ),
                  child: Joystick(listener: (details) {
                    setState(() {
                      print(details.x*10);
                      //print(details.y);

                    });
                  },
                    mode: _joystickMode,

                  ),

                ),
              ),
               Stack(
                children :[
                  // //right arrow------------------------------>
                  // Positioned(
                  //   top: _height*0.70,
                  //   left: _width*0.41,
                  //
                  //   child: ElevatedButton(
                  //     onPressed: (){
                  //
                  //     },
                  //     child: Icon(Icons.arrow_forward_ios,size: 35.0,),
                  //     style: ElevatedButton.styleFrom(
                  //       side: BorderSide(width: 2.0,color: Colors.white70),
                  //         shape: CircleBorder(),
                  //         fixedSize: Size(_width*0.15, _width*0.15),
                  //       elevation: 5,
                  //       backgroundColor: Colors.black45,
                  //     ),
                  //   ),
                  // ),
                  // //left arrow-------------------------------------------------------->
                  //
                  // Positioned(
                  //   top: _height*0.70,
                  //   left: _width*0.1,
                  //
                  //   child: ElevatedButton(
                  //     onPressed: (){
                  //
                  //     },
                  //     child: Icon(Icons.arrow_back_ios_new,size: 35.0,),
                  //     style: ElevatedButton.styleFrom(
                  //       side: BorderSide(width: 2.0,color: Colors.white70),
                  //       shape: CircleBorder(),
                  //       fixedSize: Size(_width*0.15, _width*0.15),
                  //       elevation: 5,
                  //       backgroundColor: Colors.black45,
                  //     ),
                  //   ),
                  // ),
                  //
                  // //up arrow------------------------------------------------------------------>
                  // Positioned(
                  //   top: _height*0.620,
                  //   left: _width*0.25,
                  //
                  //   child: ElevatedButton(
                  //     onPressed: (){
                  //
                  //     },
                  //     child: Icon(Icons.keyboard_arrow_up_outlined,size: 35.0,),
                  //     style: ElevatedButton.styleFrom(
                  //       side: BorderSide(width: 2.0,color: Colors.white70),
                  //       shape: CircleBorder(),
                  //       fixedSize: Size(_width*0.15, _width*0.15),
                  //       elevation: 5,
                  //       backgroundColor: Colors.black45,
                  //     ),
                  //   ),
                  // ),
                  //
                  // //down arrow------------------------------------------------------------------>
                  // Positioned(
                  //   top: _height*0.78,
                  //   left: _width*0.25,
                  //
                  //   child: ElevatedButton(
                  //     onPressed: (){
                  //
                  //     },
                  //     child: Icon(Icons.keyboard_arrow_down_outlined,size: 35.0,),
                  //     style: ElevatedButton.styleFrom(
                  //       side: BorderSide(width: 2.0,color: Colors.white70),
                  //       shape: CircleBorder(),
                  //       fixedSize: Size(_width*0.15, _width*0.15),
                  //       elevation: 5,
                  //       backgroundColor: Colors.black45,
                  //     ),
                  //   ),
                  // ),

                  //paddle------------------------------------------------------------------>
                  Positioned(
                    top: _height*0.470,
                    left: _width*0.69,

                    child: GestureDetector(
                      onTap: (){
                        print("hit");

                      },


                      child: Container(

                        height: _height*0.45,
                        width: _width*0.27,
                        decoration:  BoxDecoration(
                         // border: Border.all(width: 2,color: Colors.white70),
                          image: DecorationImage(image:AssetImage('assets/images/padle.png',)),
                        ),
                      ),
                    ),
                    ),


                  Positioned(
                    top: _height*0.45,
                    left: _width*0.42,
                    child: Stack(
                    children: [
                      //Gear box ------------------------------------------------------------------------------->
                      Container(
                        height: _height*0.23,
                        width: _width*0.27,
                        decoration: BoxDecoration(
                         // borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(image:AssetImage('assets/images/matt.jpg',),fit: BoxFit.cover),
                          border: Border(
                            left: BorderSide(
                              color: Colors.white38,
                              width: 15.0,
                            ),
                            right: BorderSide(
                              color: Colors.white38,
                              width: 15.0,
                            ),
                            top: BorderSide(
                              color: Colors.white,
                              width: 20.0,
                            ),
                            bottom: BorderSide(
                              color:Colors.white,
                              width: 8.0,
                            ),
                          ),

                        ),
                        child: Row(
                          children: [
                            SizedBox.fromSize(size:Size(_width*0.025, 15.0)),

                            ElevatedButton(onPressed: (){}, child: Text('R',style: TextStyle(fontSize: 30.0),),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1A193B),
                                side: BorderSide(width: 2.0,color: Colors.white),

                              ),
                            ),
                            SizedBox.fromSize(size:Size(_width*0.02, 15.0)),
                            ElevatedButton(onPressed: (){}, child: Text('F',style: TextStyle(fontSize: 30.0),),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1A193B),
                                side: BorderSide(width: 2.0,color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),),


                  //text -------------------------------------->
                  Positioned(
                    top: _height*0.06,
                    left: _width*0.3,
                    child: Text(
                      'WIIINGS',style: TextStyle(fontSize: 55.0,color: Colors.white,fontFamily: 'JacquesFrancois'),
                    ),),
                  Positioned(
                    top: _height*0.2,
                    left: _width*0.3,
                    child: Text(
                      "Let's Fly",style: TextStyle(fontSize: 35.0,color: Colors.white,fontFamily: 'JacquesFrancois'),
                    ),),






                ],
              ),

            ],
          ),
        ),
      ),
    );

  }
}
