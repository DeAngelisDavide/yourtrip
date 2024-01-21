import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yourtrip/Extension/DeviceInfo.dart';

class CustomContainer extends StatelessWidget{

  const CustomContainer({required this.child, this.borderRadius, this.height, this.widht});
  final borderRadius;
  final widht;
  final height;
  final Widget child;
  Widget build(BuildContext context){
    return Padding(padding: EdgeInsets.only(top: 2.pv(context)),
        child: Container(
    decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.secondary,
    borderRadius: borderRadius,
    ),
    width: widht,
    height: height,
    child: Padding(
    padding: EdgeInsets.only(top: 2.pv(context), bottom: 2.pv(context)),
    child: child
    )
        )
    );
  }
}