// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app/config.dart';
// //import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';
//
// class ConnectPage extends StatelessWidget {
//   final String conferenceID;
//
//   const ConnectPage({
//     Key? key,
//     required this.conferenceID,
//   }) : super(key: key);
//
//   get localUserID => null;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: ZegoUIKitPrebuiltVideoConference(
//         appID: config.appID,
//         appSign: config
//             .appSign,
//         userID: config.userName,
//         userName: "User_$localUserID",
//         conferenceID: conferenceID,
//         config: ZegoUIKitPrebuiltVideoConferenceConfig(),
//       ),
//     );
//   }
// }