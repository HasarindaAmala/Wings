import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class medicalReportPage extends StatefulWidget {
  const medicalReportPage({Key? key}) : super(key: key);

  @override
  State<medicalReportPage> createState() => _medicalReportPageState();
}

class _medicalReportPageState extends State<medicalReportPage> {
  @override
  Widget build(BuildContext context) {

    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          width: _width,
          height: _height,
          color: Color(0xFF1A193B),
          child: Stack(
            children: [
              //back button--------------------------------------------------->
              Positioned(
                top: _height*0.06,
                left: _width*0.05,

                child: ElevatedButton(onPressed: () {
                  Navigator.of(context).pushNamed('/Home');
                }, child: Icon(Icons.arrow_back),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.white.withOpacity(0.4),
                    elevation: 10.0,
                    shape: CircleBorder(),
                    fixedSize: Size(_width*0.15, _width*0.15),
                    backgroundColor: Color(0xFF1A193B),
                    side: BorderSide(color: Colors.white,width: 2.0),


                  ),
                ),
              ),
              //blue flag-------------------------------------------------------------------------------->

              Positioned(
                top: 0,
                right: 0.0,
                height: _height*0.8,
                child:
                Container(
                  width: _width*0.4,
                  height: _height*0.3 ,
                  decoration: BoxDecoration(
                    color: Color(0xFF3E98EC),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),),
                  ),
                  child: Container(

                    margin: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 0.0),
                    height: 5.0,
                    width: 20.0,
                    //color: Colors.black,

                    child: Stack(
                      children: [
                        Positioned(
                            top: _height*0.04,
                            left: _width*0.09,

                            child: Text('MEDICAL',style: TextStyle(fontSize: 20.0,fontFamily: 'JacquesFrancois',color: Colors.white,),)
                        ),
                        Positioned(
                            top: _height*0.07,
                            left: _width*0.12,

                            child: Text('REPORT!',style: TextStyle(fontSize: 20.0,fontFamily: 'JacquesFrancois',color: Colors.white,),)
                        ),
                        Positioned(
                          top: _height*0.03,
                          left: _width*0.0,

                          child:Icon(Icons.accessible_forward,size: 35.0,color: Colors.white,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //Buttons set ----------------------------------------------------------------------------------->
              Positioned(
                top: _height*0.3,
                left: _width*0.05,
                child: Row(
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: (){},
                          child: Column(
                            children: [
                              SizedBox(height: _height*0.02,),

                              Container(
                                width: _width*0.25,
                                height: _height*0.08,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage('assets/images/BloodSuger.png'))
                                ),
                              ),
                              SizedBox(height: _height*0.01,),

                              Text('Blood Suger :',style: TextStyle(fontSize: 16.0),),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(_width*0.35, _height*0.17),
                            backgroundColor: Color(0xFF1A193B),
                            elevation: 5.0,
                            shadowColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.circular(15.0),
                            ),
                            side: BorderSide(width: 2,color: Colors.white),
                          ),
                        ),
                        SizedBox(height: _height*0.05,),

                        //battery indicator button--------------------------------------------------------------------->
                        ElevatedButton(
                          onPressed: (){},
                          child: Column(
                            children: [
                              SizedBox(height: _height*0.02,),

                              Container(
                                width: _width*0.25,
                                height: _height*0.08,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage('assets/images/pulse.png'))
                                ),
                              ),
                              SizedBox(height: _height*0.01,),

                              Text('Pulse Rate :',style: TextStyle(fontSize: 16.0),),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(_width*0.35, _height*0.17),
                            backgroundColor: Color(0xFF1A193B),
                            elevation: 5.0,
                            shadowColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.circular(15.0),
                            ),
                            side: BorderSide(width: 2,color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: _width*0.1,),
                    Column(
                      children: [
                        //Adjustable seat---------------------------------------------------------------->
                        ElevatedButton(
                          onPressed: (){},
                          child: Column(
                            children: [
                              SizedBox(height: _height*0.02,),

                              Container(
                                width: _width*0.25,
                                height: _height*0.08,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage('assets/images/heart.png'))
                                ),
                              ),
                              SizedBox(height: _height*0.01,),

                              Text('Heart Beat :',style: TextStyle(fontSize: 16.0),),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(_width*0.35, _height*0.17),
                            backgroundColor: Color(0xFF1A193B),
                            elevation: 5.0,
                            shadowColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.circular(15.0),
                            ),
                            side: BorderSide(width: 2,color: Colors.white),
                          ),
                        ),
                        SizedBox(height: _height*0.05,),

                        //AddMore button--------------------------------------------------------------------->
                        ElevatedButton(
                          onPressed: (){},
                          child: Column(
                            children: [
                              SizedBox(height: _height*0.02,),

                              Container(
                                width: _width*0.25,
                                height: _height*0.08,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage('assets/images/Spo2.png')),

                                ),

                              ),
                              SizedBox(height: _height*0.01,),

                              Text('Spo2 Level :',style: TextStyle(fontSize: 16.0),),



                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(_width*0.35, _height*0.17),
                            backgroundColor: Color(0xFF1A193B),
                            elevation: 5.0,
                            shadowColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.circular(15.0),
                            ),
                            side: BorderSide(width: 2,color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Checkup button----------------------------------------------------------------->

              Positioned(
                top: _height*0.85,
                left: _width*0.14,
                child: Row(
                  children: [
                    ElevatedButton(onPressed: (){}, child: Padding(

                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(Icons.accessible,),
                          ),
                          Text('Checkup'),
                        ],
                      ),
                    ),
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1A193B),
                        side: BorderSide(width: 2.0,color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(8.0),
                        ),
                        shadowColor: Colors.white,
                        elevation: 5.0,
                      ),),

                    SizedBox(width: _width*0.06,),
                    //Reports button -------------------------------------------------------------------------------->


                    ElevatedButton(onPressed: (){}, child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(Icons.receipt_long_rounded,),
                          ),
                          Text('Reports'),
                        ],
                      ),
                    ),
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1A193B),
                        side: BorderSide(width: 2.0,color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(8.0),
                        ),
                        shadowColor: Colors.white,
                        elevation: 5.0,
                      ),)
                  ],
                ),)

            ],
          ),
        ),
      ),

    );
  }
}
