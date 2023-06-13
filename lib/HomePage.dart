import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
         return Scaffold(
           backgroundColor: Color(0xFF1A193B),
           body: SingleChildScrollView(

               child:Center(
                 child: Column(
                   children: [
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child:
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [

                                 Container(

                                   margin: EdgeInsets.fromLTRB(_width*0.12,_height*0.12,_width*0.12,_height*0.07),
                                   child: CircleAvatar(
                                    // backgroundColor: Colors.cyanAccent,
                                     child: Align(
                                       alignment: Alignment.center,
                                       child:  Container(
                                         /*alignment: Alignment.topCenter,
                                         margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 40.0),
                                         padding: EdgeInsets.fromLTRB(38.0,30.0,70.0,20.0),*/


                                         child: Lottie.network('https://assets4.lottiefiles.com/packages/lf20_u4yagukz.json',width: 160,height: 160,),


                                       ),
                                     ),
                                     radius: 60.0,
                                     backgroundColor: Colors.blue.withOpacity(0.3),

                                     //backgroundImage: AssetImage('assets/121.jpg'),
                                   ),

                                 ),
                                 SizedBox(

                                   width: 100.0,
                                   height: 0.0,

                                 ),

                                 SizedBox(

                                   width: _width*0.3,
                                   height: 60.0,
                                   child: ElevatedButton(

                                     child: Text('Press me!'),
                                     onPressed: () {
                                       print('Hello');
                                     },
                                   ),
                                 ),

                               ],
                             ),

                              Center(
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child:Container(

                                    //color: Colors.yellow,


                                    // padding: EdgeInsets.only(left : 30.0),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(20.0, 60.0, 0.0, 0.0),
                                      child: Text('Lets Fly !',style: TextStyle(
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white54,
                                      ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3E98EC),
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),),
                                    ),
                                    width: _width*0.2,
                                    height: _height*0.8,
                                    // height: double.infinity,
                                    //padding: const EdgeInsets.fromLTRB(150.0, 400.0, 20.0, 120.0),

                                  ),
                                ),
                              )




                             /*Container(
                               alignment: Alignment.topRight,
                               //color: Colors.yellow,


                               padding: EdgeInsets.only(left : 30.0),
                               child: Container(
                                    padding: EdgeInsets.fromLTRB(20.0, 60.0, 0.0, 0.0),
                                    child: Text('Lets Fly !',style: TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white54,
                               ),
                                ),
                               ),
                               decoration: BoxDecoration(
                                 color: Color(0xFF3E98EC),
                                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),),
                               ),
                                width: _width*0.4,
                             height: _height*0.8,
                             // height: double.infinity,
                              //padding: const EdgeInsets.fromLTRB(150.0, 400.0, 20.0, 120.0),

                             ),*/




                           ],
                         ),




    ),
  ],
                 ),
               ),

           ),
         );


  }
}
