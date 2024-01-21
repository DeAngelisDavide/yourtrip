import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yourtrip/Extension/DeviceInfo.dart';

class InputField extends StatelessWidget{
  const InputField(  {this.hintTest = "", this.obscureText = false, required this.controller, this.maxLines = 1, this.maxCharacter = 50000, this.isDigit = false, this.suffixText});
  final String hintTest;
  final obscureText;
  final controller;
  final maxLines;
  final maxCharacter;
  final isDigit;
  final suffixText;
  Widget build(BuildContext context){

    return Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Padding(
            padding: EdgeInsets.only(left: DeviceType.mobile.equalsToCurrent(context)?5.ph(context):3.ph(context), right: DeviceType.mobile.equalsToCurrent(context)?5.ph(context):3.ph(context)),
            child:TextFormField(
              controller: controller,
              obscureText: obscureText,
              keyboardType:  !isDigit?TextInputType.multiline:const TextInputType.numberWithOptions(signed: false, decimal: true),
              maxLines:maxLines,
              inputFormatters: [
                LengthLimitingTextInputFormatter(maxCharacter),
                if(isDigit==true)
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
              ],
              decoration:   InputDecoration(
                suffixText: suffixText,
                  suffixStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:  BorderSide(color:Theme.of(context).colorScheme.primary,),
                  ),
                  focusColor: Theme.of(context).colorScheme.primary,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: hintTest,
                  hintStyle:   TextStyle(
                      color: Theme.of(context).colorScheme.primary,)
              ),
              style:  TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            )
        )
    );
  }
}