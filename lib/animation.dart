// import 'package:flutter/material.dart';
// import 'dart:async';

// void main() => runApp(new MyApp());

// class MyApp extends StatefulWidget{
//   MyAppState createState ()=> MyAppState();
// }

// class MyAppState extends State<MyApp>{
//   final initialColor = Colors.green;
//   final finalColor = Colors.blue;
//   Color _color;
//   Timer _timer;

//   @override
//   void initState(){
//     _color = initialColor;
//     _timer = Timer.periodic(Duration(seconds: 2), (Timer _){
//       setState(() {
//               _color = (_color == initialColor) ? finalColor : initialColor;
//             });
//     });
//     super.initState();
//   }

//   @override
//   void dispose(){
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context){
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 500)
//       );
//   }
// }