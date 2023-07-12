
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_app/main.dart';

class controlPage extends StatefulWidget {
  final BluetoothConnection? connection;
  const controlPage({required this.connection});


  @override
  State<controlPage> createState() => _controlPageState();
}

class _controlPageState extends State<controlPage> {
  BluetoothConnection? get connection => widget.connection;
  int value = 0;
   bool forward=false;
  bool reverse=false;


  // Initializing the Bluetooth connection state to be unknown


  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // Avoid memory leak and disconnect


    super.dispose();
  }


  JoystickMode _joystickMode = JoystickMode.all;


  @override
  Widget build(BuildContext context) {
    //
    //  // JoystickDirectionCallback? onDirectionChanged(double degrees, double distance) {
    //   String data = "Degree : ${degrees.toStringAsFixed(2)}, distance : ${distance.toStringAsFixed(2)}";
    //   print(data);
    //   return null;
    //
    // }
    final _height = MediaQuery
        .of(context)
        .size
        .height;
    final _width = MediaQuery
        .of(context)
        .size
        .width;
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
                top: _height * 0.07,
                left: _width * 0.05,

                child: ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Icon(Icons.arrow_back),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.white.withOpacity(0.3),
                    elevation: 10.0,
                    shape: CircleBorder(),
                    fixedSize: Size(_width * 0.07, _width * 0.07),
                    backgroundColor: Color(0xFF1A193B),
                    side: BorderSide(color: Colors.white, width: 2.0),


                  ),
                ),
              ),
              //direction arrows--------------------------------->
              Positioned(
                top: _height * 0.4,
                left: _width * 0.07,

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
                      int y = (details.x*10).toInt() ;
                      if(y<0){
                        _sendOnMessageToBluetooth('3');
                      }else if (y>0){
                        _sendOnMessageToBluetooth('4');
                      }
                      else if(y==0){
                        _sendOnMessageToBluetooth('0');
                      }


                      //print(details.y);

                    });
                  },
                    mode: _joystickMode,

                  ),

                ),
              ),
              Stack(
                children: [


                  //paddle------------------------------------------------------------------>
                  Positioned(
                    top: _height * 0.470,
                    left: _width * 0.69,

                    child: GestureDetector(
                      //onTap:  _sendOnMessageToBluetooth,

                      onLongPress: (){
                        forward ? _sendOnMessageToBluetooth('1') : _sendOnMessageToBluetooth('2');

                       },
                      onLongPressUp: (){_sendOnMessageToBluetooth('0');},


                     // onDoubleTap: _sendOffMessageToBluetooth,



                      child: Container(

                        height: _height * 0.45,
                        width: _width * 0.27,
                        decoration: BoxDecoration(
                          // border: Border.all(width: 2,color: Colors.white70),
                          image: DecorationImage(image: AssetImage(
                            'assets/images/padle.png',)),
                        ),
                      ),
                    ),
                  ),


                  Positioned(
                    top: _height * 0.45,
                    left: _width * 0.42,
                    child: Stack(
                      children: [
                        //Gear box ------------------------------------------------------------------------------->
                        Container(
                          height: _height * 0.23,
                          width: _width * 0.29,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                image: AssetImage('assets/images/matt.jpg',),
                                fit: BoxFit.cover),
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
                                color: Colors.white,
                                width: 8.0,
                              ),
                            ),

                          ),
                          child: Row(
                            children: [
                              SizedBox.fromSize(
                                  size: Size(_width * 0.02, 15.0)),

                              ElevatedButton(onPressed: (){

                                setState(() {
                                  reverse=true;
                                  forward=false;
                                });
                                },

                                child: Text(
                                  'R', style: TextStyle(fontSize: 30.0),),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:reverse? Colors.green:Color(0xFF1A193B),
                                  side: BorderSide(
                                      width: 2.0, color: Colors.white),

                                ),
                              ),
                              SizedBox.fromSize(
                                  size: Size(_width * 0.02, 15.0)),
                              ElevatedButton(onPressed: (){

                                setState(() {
                                  reverse=false;
                                  forward=true;
                                });
                              },

                                child: Text(
                                  'F', style: TextStyle(fontSize: 30.0),),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: forward? Colors.green:Color(0xFF1A193B),
                                  side: BorderSide(
                                      width: 2.0, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),),


                  //text -------------------------------------->
                  Positioned(
                    top: _height * 0.06,
                    left: _width * 0.15,
                    child: Text(
                      'WIIINGS', style: TextStyle(fontSize: 55.0,
                        color: Colors.white,
                        fontFamily: 'JacquesFrancois'),
                    ),),
                  Positioned(
                    top: _height * 0.2,
                    left: _width * 0.15,
                    child: Text(
                      "Let's Fly", style: TextStyle(fontSize: 35.0,
                        color: Colors.white,
                        fontFamily: 'JacquesFrancois'),
                    ),),
                  //headrest adjusting---------------------------------------------------------------->
                  Positioned(
                    top: _height * 0.15,
                    left: _width * 0.56,
                    child: Row(
                      children: [

                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF1A193B),
                            border: Border.all(width: 2.0,color: Colors.white),
                          ),
                            child: Icon(Icons.airline_seat_recline_extra,color: Colors.white,size: 60.0,)),

                      ],
                    ),),
                  //headrest adjusting---------------------------------------------------------------->
                  Positioned(
                    top: _height * 0.1,
                    left: _width * 0.65,
                    child: Column(
                    children: [
                      GestureDetector(
                        onLongPress:(){_sendOnMessageToBluetooth('5');},
                        onLongPressUp: (){_sendOnMessageToBluetooth('0');},
                        child: ElevatedButton( onPressed: () {

                        },
                        child: Icon(Icons.arrow_upward),),
                      ),
                      GestureDetector(
                        onLongPress:(){_sendOnMessageToBluetooth('6');},
                        onLongPressUp: (){_sendOnMessageToBluetooth('0');},
                        child: ElevatedButton( onPressed: () {

                        },
                          child: Icon(Icons.arrow_downward),),
                      ),
                    ],
                  ),),
                  //foot rest adjusting---------------------------------------------------------------->

                  Positioned(
                    top: _height * 0.15,
                    left: _width * 0.78,
                    child: Row(
                      children: [

                        Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF1A193B),
                              border: Border.all(width: 2.0,color: Colors.white),
                            ),
                            child: Icon(Icons.airline_seat_legroom_extra,color: Colors.white,size: 60.0,)),

                      ],
                    ),),
                  Positioned(
                    top: _height * 0.1,
                    left: _width * 0.87,
                    child: Column(
                      children: [
                        GestureDetector(
                          onLongPress:(){_sendOnMessageToBluetooth('7');},
                          onLongPressUp: (){_sendOnMessageToBluetooth('0');},
                          child: ElevatedButton( onPressed: () {

                          },
                            child: Icon(Icons.arrow_upward),),
                        ),
                        GestureDetector(
                          onLongPress:(){_sendOnMessageToBluetooth('8');},
                          onLongPressUp: (){_sendOnMessageToBluetooth('0');},
                          child: ElevatedButton( onPressed: () {

                          },
                            child: Icon(Icons.arrow_downward),),
                        ),
                      ],
                    ),),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  // Method to send message,
  // for turning the Bluetooth device on
  void _sendOnMessageToBluetooth(String value) async {
    String Value = value.toString() ;
    print('hi->'+Value);
    Uint8List data = utf8.encode(Value + "\r\n") as Uint8List;
    widget.connection?.output.add(data);
    await widget.connection?.output.allSent;
    //_showSnackBar('LED Turned On');
  }

  void _sendOffMessageToBluetooth() async {
    Uint8List data = utf8.encode("0" "\r\n") as Uint8List;
    widget.connection?.output.add(data);
    await widget.connection?.output.allSent;
    _showSnackBar('LED Turned Off');
  }
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
      ),
    );
  }


}