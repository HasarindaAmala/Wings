// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class signIn extends StatefulWidget {
//   const signIn({Key? key}) : super(key: key);
//
//   @override
//   State<signIn> createState() => _signInState();
// }
//
// class _signInState extends State<signIn> {
//   @override
//   void initState() {
//     // TODO: implement initState
//
//     super.initState();
//   }
//
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   String username = "";
//   String password = "";
//   bool show = true;
//   @override
//   Widget build(BuildContext context) {
//
//     final double _height = MediaQuery.of(context).size.height;
//     final _width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       /*appBar: AppBar(
//           title: Text('Fuck you'),
//
//         ),*/
//         resizeToAvoidBottomInset: false,
//         body:Center(
//           child: Container(
//             height: _height,
//             width: _width,
//             color: Color(0xFF1A193B),
//             child: Stack(
//               children: [
//                 //blue flag
//                 Positioned(
//                   top: 0,
//                   right: 0.0,
//                   height: _height*0.8,
//                   child:
//                   Container(
//                     width: _width*0.35,
//                     height: _height*0.3 ,
//                     decoration: BoxDecoration(
//                       color: Color(0xFF3E98EC),
//                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),),
//                     ),
//                     child: Container(
//
//                       margin: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 0.0),
//                       height: 5.0,
//                       width: 20.0,
//                       //color: Colors.black,
//
//                       child: Align(
//                         alignment: Alignment.topCenter,
//                         child: Row(
//                           children: [
//                             Expanded(child: Icon(Icons.accessible_forward,color: Colors.white,size: 40.0,)),
//                             Text('Lets Fly !',style: TextStyle(
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 //back button-->
//                 Positioned(
//                   bottom: _height*0.86,
//                   left: _width*0.07,
//                   child:
//                   ElevatedButton(
//
//                     onPressed: (){
//                       SystemNavigator.pop();
//                     },
//                     child:
//
//                     Icon(Icons.clear),
//                     style: ElevatedButton.styleFrom(
//
//                       fixedSize: Size(_width*0.1, _height*0.1),
//                       shadowColor: Colors.white,
//                       elevation: 10.0,
//                       backgroundColor: Color(0xFF1A193B),
//                       side: BorderSide(color: Colors.white,width: 2),
//                       shape: CircleBorder(
//
//                         // borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//
//                   ),
//                 ),
//                 //profile pic
//                 Positioned(
//                     bottom: _height*0.52,
//                     right: _width*0.48,
//                     child:
//                     Material(
//                       borderRadius: BorderRadius.circular(_width*0.3),
//                       shadowColor: Colors.white,
//                       elevation: 10.0,
//                       child: CircleAvatar(
//                         child: CircleAvatar(
//
//                           //foregroundColor: Colors.cyanAccent,
//                           backgroundImage:AssetImage('assets/images/user.jpg') ,
//                           radius: _width*0.29,
//                         ),
//                         //foregroundColor: Colors.cyanAccent,
//                         backgroundColor: Colors.white,
//                         radius: _width*0.3,
//                       ),
//                     )
//                 ),
//                 Positioned(
//                   bottom: _height*0.4,
//                   right: _width*0.01,
//                   child:RotatedBox(
//                     quarterTurns: -1,
//                     child:
//                     Text('WIIINGS',style:TextStyle(fontSize: 70.0,color: Colors.white.withOpacity(0.5),fontFamily: 'JacquesFrancois')),
//
//                   ),
//
//                 ),
//                 Positioned(
//                   bottom: _height*0.539,
//                   right: _width*0.2,
//                   child: RotatedBox(
//                       quarterTurns: -1,
//                       child: Icon(Icons.accessible_forward,color: Colors.white.withOpacity(0.5),)),
//
//                 ),
//
//
//
//
//
//                 Positioned(
//                   top: _height*0.56,
//                   left: _width*0.03,
//                   width: _width*0.6,
//                   child:
//                   TextFormField(
//                     controller: usernameController,
//                     style: TextStyle(color: Colors.white),
//                     cursorColor: Colors.white,
//                     decoration:  InputDecoration(
//                       filled: true,
//                       fillColor: Colors.grey.withOpacity(0.5),
//                       prefixIcon: Icon(Icons.supervised_user_circle_outlined,color: Colors.white,),
//
//                       suffixIcon: Icon(
//                         Icons.pending_actions,
//                         color: Colors.white,
//                       ),
//                       hintText: 'Enter Name',
//                       hintStyle: TextStyle(color: Colors.white),
//                       labelText: 'User Name',
//                       labelStyle: TextStyle(color: Colors.white),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.white,
//                         ),
//                         borderRadius: BorderRadius.all(Radius.circular(14.0)),
//                       ),
//
//
//                     ),
//                     onSaved: (String? value) {
//                       // This optional block of code can be used to run
//                       // code when the user saves the form.
//                     },
//                     validator: (String? value) {
//                       return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
//                     },
//                   )
//                 ),
//
//                 Positioned(
//                     top: _height*0.65,
//                     left: _width*0.03,
//                     width: _width*0.6,
//                     child:
//                     TextFormField(
//                       controller: passwordController,
//                       obscureText: show,
//                       style: TextStyle(color: Colors.white),
//                       cursorColor: Colors.white,
//                       decoration:  InputDecoration(
//                         filled: true,
//                         fillColor: Colors.grey.withOpacity(0.5),
//                         prefixIcon: const Icon(Icons.password_outlined,color: Colors.white,),
//                         suffixIcon: IconButton(
//                           color: Colors.white,
//                           icon: Icon(show
//                               ? Icons.visibility
//                               : Icons.visibility_off),
//                           onPressed: () {
//                             setState(
//                                   () {
//                                 show = !show;
//                               },
//                             );
//                           },
//                         ),
//                         hintText: 'Enter password',
//                         hintStyle: TextStyle(color: Colors.white),
//                         labelText: 'password',
//                         labelStyle: TextStyle(color: Colors.white),
//                         enabledBorder:const OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.white,
//                             ),
//                             borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                         ),
//
//
//                       ),
//                       onSaved: (String? value) {
//                         // This optional block of code can be used to run
//                         // code when the user saves the form.
//                       },
//                       validator: (String? value) {
//                         return (value != null ) ? 'Cannot be empty!.' : null;
//                       },
//                     )
//                 ),
//
//                 //Sign in button
//                 Positioned(
//
//                     bottom: _height*0.17,
//                     left: _width*0.07,
//                     height: _height*0.06,
//                     width: _width*0.24,
//                     child: ElevatedButton(
//                         onPressed: (){
//                           setState(() {
//                             username = usernameController.text;
//                             password = passwordController.text;
//                           });
//                           print(username);
//                           if(username=='Senodi' && password == '123'){
//                             Navigator.of(context).pushNamed('/Home');
//                           }
//
//
//                         },
//                         child: Text('SIGN IN',style: TextStyle(fontSize: 15.0),),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF3E98EC).withOpacity(0.7),
//                           side: BorderSide(color: Colors.white,width: 2),
//                           elevation: 10.0,
//                           shadowColor: Colors.white.withOpacity(0.3),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(16.0))
//                           ),
//                         ),
//
//                         )),
//                 //Sign up button
//                 Positioned(
//
//                     bottom: _height*0.17,
//                     left: _width*0.36,
//                     height: _height*0.06,
//                     width: _width*0.24,
//                     child: ElevatedButton(
//                       onPressed: (){
//                         setState(() {
//                           username = usernameController.text;
//                           password = passwordController.text;
//                         });
//                       },
//                       child: Text('SIGN UP',style: TextStyle(fontSize: 15.0),),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue.withOpacity(0.7),
//                         side: BorderSide(color: Colors.white,width: 2),
//                         elevation: 10.0,
//                         shadowColor: Colors.white.withOpacity(0.3),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(16.0))
//                         ),
//                       ),
//
//                     )),
//
//
//
//                 // Positioned(
//                 //     bottom: _height*0.06,
//                 //     left: _width*0.07,
//                 //     height: _height*0.06,
//                 //     width: _width*0.56,
//                 //     child: Container(
//                 //       color: Colors.white,
//                 //   child: Center(
//                 //     child:Text(password,style: TextStyle(fontSize: 20.0,),),
//                 //   ),
//                 // ))
//
//               ],
//             ),
//           ),
//         )
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/First.dart';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:image_picker/image_picker.dart';

class signIn extends StatefulWidget {
  final BluetoothConnection? connection;
  const signIn({required this.connection});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  BluetoothConnection? get connection => widget.connection;

  String username = "";
  String password = "";
  bool show = true;
  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  String selectedImagePath = '';

  void accountCreated() async{
    try {

      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );
      print("account created");
     // Navigator.of(context).pushNamed('/Home');
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      else if (e.code == 'The email address is badly formatted.') {
        print('fuck you');
      }
    } catch (e) {
      print('fuck');
      //print(e);
    }
  }
  void signIn() async{
    try {
      print(username);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: username,
          password: password
      );
      print('');
      usernameController.text == username?
          passwordController.text == password?
          Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => First(connection: connection)),
      ): null :null ;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
                  child: Container(
                    width: width * 0.35,
                    height: height * 0.3,
                    decoration: const BoxDecoration(
                      color: Color(0xFF3E98EC),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 0.0),
                      height: 5.0,
                      width: 20.0,
                      //color: Colors.black,

                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          children: [
                            Expanded(
                            //     child: Icon(
                            //   Icons.accessible_forward,
                            //   color: Colors.white,
                            //   size: 40.0,
                            // )
                            child: IconButton(onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => First(connection: connection)),
                              );
                            }, icon: Icon(Icons.accessible_forward),color: Colors.white,iconSize:40.0 ,),
                            ),
                            Text(
                              'Lets Fly !',
                              style: TextStyle(
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
                  left: width * 0.05,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                    child: const Icon(Icons.arrow_back_rounded),
                  ),
                ),
                //profile pic
                Positioned(
                    bottom: height * 0.48,
                    right: width * 0.48,
                    child: Material(
                      borderRadius: BorderRadius.circular(width * 0.3),
                      shadowColor: Colors.white,
                      elevation: 10.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: width * 0.3,
                        child: CircleAvatar(
                          //foregroundColor: Colors.cyanAccent,

                          backgroundImage: selectedImagePath == ''
                              ? AssetImage('assets/images/user.jpg')
                              : AssetImage(selectedImagePath),
                          radius: width * 0.29,
                        ),
                      ),
                    )),

                Positioned(
                  top: height * 0.4,
                  left: width * 0.35,
                  child: ElevatedButton(
                    onPressed: () async {
                      print("1");
                      selectImage();
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width * 0.1, height * 0.1),
                      shadowColor: Colors.white,
                      elevation: 10.0,
                      backgroundColor: Colors.teal,
                      side: const BorderSide(color: Colors.white, width: 2),
                      shape: const CircleBorder(

                          // borderRadius: BorderRadius.circular(10),
                          ),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 38.0,
                      color: Colors.white,
                    ),
                  ),
                ),

                Positioned(
                  bottom: height * 0.4,
                  right: width * 0.01,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Text('WIIINGS',
                        style: TextStyle(
                            fontSize: 70.0,
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'JacquesFrancois')),
                  ),
                ),
                Positioned(
                  bottom: height * 0.539,
                  right: width * 0.2,
                  child: RotatedBox(
                      quarterTurns: -1,
                      child: Icon(
                        Icons.accessible_forward,
                        color: Colors.white.withOpacity(0.5),
                      )),
                ),

                Positioned(
                    top: height * 0.56,
                    left: width * 0.03,
                    width: width * 0.6,
                    child: TextFormField(
                      controller: usernameController,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.5),
                        prefixIcon: const Icon(
                          Icons.supervised_user_circle_outlined,
                          color: Colors.white,
                        ),
                        suffixIcon: const Icon(
                          Icons.pending_actions,
                          color: Colors.white,
                        ),
                        hintText: 'Enter Name',
                        hintStyle: const TextStyle(color: Colors.white),
                        labelText: 'User Name',
                        labelStyle: const TextStyle(color: Colors.white),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        ),
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    )),

                Positioned(
                    top: height * 0.65,
                    left: width * 0.03,
                    width: width * 0.6,
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: show,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.5),
                        prefixIcon: const Icon(
                          Icons.password_outlined,
                          color: Colors.white,
                        ),
                        suffixIcon: IconButton(
                          color: Colors.white,
                          icon: Icon(
                              show ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                show = !show;
                              },
                            );
                          },
                        ),
                        hintText: 'Enter password',
                        hintStyle: const TextStyle(color: Colors.white),
                        labelText: 'password',
                        labelStyle: const TextStyle(color: Colors.white),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null) ? 'Cannot be empty!.' : null;
                      },
                    )),

                //Sign in button
                Positioned(
                    bottom: height * 0.17,
                    left: width * 0.07,
                    height: height * 0.06,
                    width: width * 0.24,
                    child: ElevatedButton(
                      onPressed: () {
                        print(("signed in"));
                        setState(()  {
                          signIn();

                        }
                        );

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF3E98EC).withOpacity(0.7),
                        side: usernameController.text == username ? const BorderSide(color: Colors.white, width: 2):const BorderSide(color: Colors.red, width: 2),
                        elevation: 10.0,
                        shadowColor: Colors.white.withOpacity(0.3),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0))),
                      ),
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    )),
                //Sign up button
                Positioned(
                    bottom: height * 0.17,
                    left: width * 0.36,
                    height: height * 0.06,
                    width: width * 0.24,
                    child: ElevatedButton(
                      onPressed: () {
                        print("account created");
                        setState(()  {
                          username = usernameController.text;
                          password = passwordController.text;

                        });
                        accountCreated();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.withOpacity(0.7),
                        side: const BorderSide(color: Colors.white, width: 2),
                        elevation: 10.0,
                        shadowColor: Colors.white.withOpacity(0.3),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0))),
                      ),
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }

  Future selectImage() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              width: width * 0.6,
              height: height * 0.2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromGallery();
                            print('Image_Path:-');
                            print(selectedImagePath);
                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("No Image Selected !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.browse_gallery),
                                    Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromCamera();
                            print('Image_Path:-');
                            print(selectedImagePath);

                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("No Image Captured !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.camera_alt),
                                    Text('Camera'),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  selectImageFromGallery() async {
    print("inside");
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  //
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}
