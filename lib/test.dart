import 'package:flutter/material.dart';

class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
      return Scaffold(
          backgroundColor: Color(0xFF1A193B),
       /* appBar: AppBar(
          title: Text('Fuck you'),

        ),*/
        body:

        Row(
          children: [
        /*    GestureDetector(
              onTap: (){print(1.toString());},
              child: Align(

                alignment: Alignment.topLeft,
                child: Container(
                  child: Center(
                    child: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                  ),

                  height:_height*0.15,
                  width: _width*0.15,

                  margin: EdgeInsets.fromLTRB(_width*0.1,_height*0.0,0.0,_height*0.3 ),

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.indigo,
                    border: Border.all(width: 2,color: Colors.white,),
                  ),
                ),

              ),
            ),*/

             Column(
               children: [
                 Align(

                  alignment: Alignment.topLeft,
                  child:Padding(
                    padding:  EdgeInsets.fromLTRB(_width*0.08, _height*0.05, 0.0, 0.0),
                    child:ElevatedButton(

                    onPressed: (){
                      print('fucked');
                    },
                    child:

                    Icon(Icons.arrow_back_ios_new_outlined),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(_width*0.1, _height*0.1),
                      shadowColor: Colors.white,
                      backgroundColor: Colors.indigo,
                      side: BorderSide(color: Colors.white,width: 2),
                      shape: CircleBorder(

                        // borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                  ),),



            ),
              Container(
                height:_height*0.3,
                width: _width*0.5,
                color: Colors.white,
                child: Align(
  alignment: Alignment.center,

  child: Container(
    margin: EdgeInsets.all(15.0),
    height:_height*0.1,
    width: _width*0.2,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.indigo,
      border: Border.all(width: 2,color: Colors.white,),
    ),
  ),

),
              ),

               ],
             ),
          /*  Align(
              alignment: Alignment.topLeft,
              child:Container(
                width: _width*0.5,
                height: _height,

                //color: Colors.blue,
                *//*child:Align(
                  alignment: Alignment.center,
                  child: Container(
                    //alignment: Alignment.topCenter,
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
                    width: _width*0.4,
                    height: _height*0.8,
                    // height: double.infinity,
                    //padding: const EdgeInsets.fromLTRB(150.0, 400.0, 20.0, 120.0),

                  ),

                ),*//*

              ),
            ),*/
            SizedBox(
              height: _height*0.01,
              width: _width*0.1,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                //alignment: Alignment.topCenter,
                //color: Colors.yellow,
                width: _width*0.4,
                height: _height*0.8,

                // padding: EdgeInsets.only(left : 30.0),

                decoration: BoxDecoration(
                  color: Color(0xFF3E98EC),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),),
                ),

                // height: double.infinity,
                //padding: const EdgeInsets.fromLTRB(150.0, 400.0, 20.0, 120.0),

              ),
            ),
       /*Align(
         alignment: Alignment.topRight,
         child:Container(
           width: _width*0.5,
           height: _height,
          // color: Colors.red,
           child:Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    //alignment: Alignment.topCenter,
                    //color: Colors.yellow,
                    width: _width*0.4,
                    height: _height*0.8,

                    // padding: EdgeInsets.only(left : 30.0),

                    decoration: BoxDecoration(
                      color: Color(0xFF3E98EC),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),),
                    ),

                    // height: double.infinity,
                    //padding: const EdgeInsets.fromLTRB(150.0, 400.0, 20.0, 120.0),

                  ),

                ),

         ),
       ),*/




          ],

        )
      );

  }
}
