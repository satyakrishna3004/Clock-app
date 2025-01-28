import 'package:flutter/material.dart';
import 'package:orientations/enum.dart';

class MenuInfo extends ChangeNotifier{
  MenuType menuType;
  String title;
  String imagesource;

  MenuInfo(this.menuType, {required this.title,required this.imagesource});

  UpdateMenu(MenuInfo menuInfo){
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.imagesource = menuInfo.imagesource;

    notifyListeners();
  }
}