import 'package:flutter/material.dart';
import 'package:orientations/menu_info.dart';
import 'package:provider/provider.dart';
import 'package:orientations/enum.dart';
import 'package:orientations/homepage.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<MenuInfo>(
        create: (context) => MenuInfo(MenuType.Clock, imagesource: '', title: ''),
          child: custompainter()),
      debugShowCheckedModeBanner: false,
    );
  }
}