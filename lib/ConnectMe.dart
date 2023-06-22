import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/config.dart';
//import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';
//import 'package:flutter_app/Connect.dart';

class ConnectMePage extends StatelessWidget {
  const ConnectMePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            height: height,
            width: width,
            color: const Color(0xFF1A193B),
            child: Stack(
              children: [
                //blue falg
                Positioned(
                  top: 0,
                  right: 0.0,
                  height: height * 0.8,
                  child:
                  Container(
                    width: width * 0.35,
                    height: height * 0.3,
                    decoration: const BoxDecoration(
                      color: Color(0xFF3E98EC),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),),
                    ),
                    child: Container(

                      margin: const EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 0.0),
                      height: 5.0,
                      width: 20.0,
                      //color: Colors.black,

                      child:  Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          children: [
                            Expanded(child: Icon(
                              Icons.accessible_forward, color: Colors.white,
                              size: 40.0,)),
                            Text('Connect Me !', style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //back button-->
                Positioned(
                  bottom: height * 0.86,
                  left: width * 0.07,
                  child:
                  ElevatedButton(

                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    style: ElevatedButton.styleFrom(

                      fixedSize: Size(width * 0.1, height * 0.1),
                      shadowColor: Colors.white,
                      elevation: 10.0,
                      backgroundColor: const Color(0xFF1A193B),
                      side: const BorderSide(color: Colors.white, width: 2),
                      shape: const CircleBorder(

                        // borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child:

                    const Icon(Icons.clear),
                  ),
                ),
                //profile pic
                Positioned(
                    bottom: height * 0.52,
                    right: width * 0.48,
                    child:
                    Material(
                      borderRadius: BorderRadius.circular(width * 0.3),
                      shadowColor: Colors.white,
                      elevation: 10.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: width * 0.3,
                        child: CircleAvatar(

                          //foregroundColor: Colors.cyanAccent,
                          backgroundImage: const AssetImage('assets/images/user.jpg'),
                          radius: width * 0.29,
                        ),
                      ),
                    )
                ),
                Positioned(
                  bottom: height * 0.4,
                  right: width * 0.01,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child:
                    Text('WIIINGS', style: TextStyle(fontSize: 70.0,
                        color: Colors.white.withOpacity(0.5),
                        fontFamily: 'JacquesFrancois')),

                  ),

                ),
                Positioned(
                  bottom: height * 0.539,
                  right: width * 0.2,
                  child: RotatedBox(
                      quarterTurns: -1,
                      child: Icon(Icons.accessible_forward,
                        color: Colors.white.withOpacity(0.5),)),

                ),

                //Connect Me button
                Positioned(

                    bottom: height * 0.17,
                    left: width * 0.07,
                    height: height * 0.06,
                    width: width * 0.24,
                    child: ElevatedButton(
                      onPressed: () {
                        print('pressed health reports');
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const ConnectPage(conferenceID: 'user1',)
                        //   ),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3E98EC).withOpacity(0.7),
                        side: const BorderSide(color: Colors.white, width: 2),
                        elevation: 10.0,
                        shadowColor: Colors.white.withOpacity(0.3),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(16.0))
                        ),
                      ),
                      child: const Text(
                        'Connect Me', style: TextStyle(fontSize: 15.0),),
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
}