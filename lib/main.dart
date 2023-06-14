
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_app/aboutUs.dart';
import 'package:flutter_app/connectMe.dart';
import 'package:flutter_app/controlPage.dart';
import 'package:flutter_app/medicalReport.dart';
import 'package:flutter_app/safetyReport.dart';
import 'package:flutter_app/signIn.dart';
import 'package:flutter_app/First.dart';
import 'package:lottie/lottie.dart';

void main(){

  runApp(
      App(),
    /*DevicePreview(
      enabled: true,

      builder: (context) =>  App(),
    ),*/
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // WidgetsFlutterBinding.ensureInitialized();

    return MaterialApp(

      routes: <String,WidgetBuilder>{
        '/Home':(context)=>First(),
        '/Medical':(context)=>medicalReportPage(),
        '/Safety':(context)=>SafetyReportPage(),
        '/AboutUs':(context)=>AboutUsPage(),
        '/ConnectUs':(context)=>ConnectMePage(),
        '/Control':(context)=>controlPage(),



      },

      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      home: signIn(),
    );
  }
}


