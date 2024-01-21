import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yourtrip/Extension/DeviceInfo.dart';

import '../routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({required this.text}): preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;
  final text;

  Widget build(BuildContext context){
    return AppBar(title: Text(text, style: const TextStyle(color: Color.fromRGBO(26, 26, 36, 100)),),
        backgroundColor: Colors.white,
        centerTitle: true,
      );
  }
}