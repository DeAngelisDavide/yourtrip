import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yourtrip/Control/SingletonCurrecny.dart';
import 'package:yourtrip/Extension/DeviceInfo.dart';
import 'package:yourtrip/Extension/Style.dart';
import 'package:yourtrip/Model/Trip.dart';
import 'package:yourtrip/Widgets/CustomAppBar.dart';
import 'package:yourtrip/Widgets/CustomContainer.dart';
import 'package:yourtrip/Widgets/InputField.dart';

import '../Control/SingletonTrip.dart';
import '../generated/l10n.dart';

class ControllerInput {
  static final TextEditingController title = TextEditingController();
  static final TextEditingController transportCost = TextEditingController();
  static final TextEditingController hotelCost = TextEditingController();
  static final TextEditingController otherCost = TextEditingController();
}

class CreateElement extends StatelessWidget {
  CreateElement() {
    ControllerInput.title.text = _element != null ? (_element?.title)! : "";
    ControllerInput.transportCost.text =
        _element != null ? (_element?.transportCost)!.toString() : "";
    ControllerInput.hotelCost.text =
        _element != null ? (_element?.hotelCost)!.toString() : "";
    ControllerInput.otherCost.text =
        _element != null ? (_element?.otherCost)!.toString() : "";
  }

  //To see if is a modify or a create
  final Trip? _element =
      SingletonTrip.getInstance().getElement(SingletonTrip.getInstance().index);
  String? _pathImage;
  final _currency = SingletonCurrency.getInstance().actualCurrency;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          text: S.current.createAppBar,
        ),
        body: Center(
            child:SingleChildScrollView(
          child: CustomContainer(
            widht: 90.ph(context),
          borderRadius: BorderRadius.circular(5),
    child: Padding(
    padding: EdgeInsets.only(left: 2.ph(context), right: 2.ph(context)),
    child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text("${S.current.tripName}:",
                    style: Theme.of(context).textTheme.header1(context: context, color: Theme.of(context).colorScheme.primary),
              )),
              InputField(
                controller: ControllerInput.title,
                maxCharacter: 25,
              ),
              Padding(padding: EdgeInsets.only(top: 2.pv(context))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("${S.current.transportCost}:",
                      style: Theme.of(context).textTheme.header1(context: context, color: Theme.of(context).colorScheme.primary)
                  )),
              InputField(
                controller: ControllerInput.transportCost,
                maxCharacter: 7,
                isDigit: true,
                hintTest: "0",
                suffixText: "$_currency  ",
              ),
              Padding(padding: EdgeInsets.only(top: 2.pv(context))),
              Align(
                alignment: Alignment.topLeft,
                child: Text("${S.current.accommodationCost}:",
                    style: Theme.of(context).textTheme.header1(context: context, color: Theme.of(context).colorScheme.primary)),
              ),
              InputField(
                  controller: ControllerInput.hotelCost,
                  maxCharacter: 7,
                  isDigit: true,
                  hintTest: "0",
                  suffixText: "$_currency  "),
              Padding(padding: EdgeInsets.only(top: 2.pv(context))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("${S.current.otherCost}:",
                      style: Theme.of(context).textTheme.header1(context: context, color: Theme.of(context).colorScheme.primary)
                  )),
              InputField(
                controller: ControllerInput.otherCost,
                maxCharacter: 7,
                isDigit: true,
                hintTest: "0",
                suffixText: "$_currency  ",
              ),
              Padding(padding: EdgeInsets.only(top: 2.pv(context))),
              GestureDetector(
                onTap: () {
                  //Select the image
                  final ImagePicker picker = ImagePicker();
                  picker.pickImage(source: ImageSource.gallery,
                  ).then((value) {
                    if(value !=null) {
                      //Verify if the extension of the file is right
                      final regExpr = RegExp(r'.png|.jpg|.jpeg+$');
                      if(regExpr.hasMatch(value.path)){
                      //Create the new path because if is the same of the uncompressed will throw an error
                        final filePath = value.path;
                        final lastIndex = filePath.lastIndexOf(new RegExp(r'.png|.jp'));
                        final splitted = filePath.substring(0, (lastIndex));
                        final outPath = "${splitted}_out${filePath.substring(lastIndex)}";

                        //Compress the image
                        FlutterImageCompress.compressAndGetFile(
                            value.path, outPath,
                            quality: 10
                      ).then((valueCompressed) {
                        _pathImage = valueCompressed?.path;

                        //Delete the image not compressed
                        try {
                          File toDelete = File(value.path);
                          toDelete.delete();
                          print("****DELETE SUCCESSFULLY********");
                        }catch (e){
                          print("*******Image not deleted********+");
                        }

                        print("COMPRESSED PATH ${valueCompressed?.path}");
                      }
                      );
                        //if the extension is not allowed
                    }else{
                        File toDelete = File(value.path);
                        toDelete.delete();
                        final snackBar = SnackBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            content: CustomContainer(
                                child: Padding(
                                    padding: EdgeInsets.only(left: 1.ph(context), right: 1.pv(context)),
                                    child: Text(S.current.formatImage,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.header2(context: context, color: Theme.of(context).colorScheme.primary),))
                            ),
                            behavior: SnackBarBehavior.floating
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  });
                },
                child: Text(
                   S.current.uploadPhoto,
                  style: Theme.of(context).textTheme.header1(context: context, color: Colors.blue),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 2.pv(context))),
              TextButton(
                  onPressed: () {
                    if (ControllerInput.title.text.isNotEmpty) {
                      if (ControllerInput.otherCost.text.isEmpty)
                        ControllerInput.otherCost.text = "0";
                      if( ControllerInput.transportCost.text.isEmpty)
                        ControllerInput.transportCost.text = "0";
                      if(ControllerInput.hotelCost.text.isEmpty)
                        ControllerInput.hotelCost.text = "0";

                      final instance = SingletonTrip.getInstance();
                      final newElement = Trip(
                          ControllerInput.title.text,
                          double.parse(ControllerInput.hotelCost.text),
                          double.parse(ControllerInput.otherCost.text),
                          double.parse(ControllerInput.transportCost.text),
                          _pathImage);
                      if (_element == null) {
                        instance.addElement(newElement);
                      } else {
                        //if alredy exist we have to delete the old image
                        Trip elementToDelete = instance.getElement(instance.index)!;
                        if(elementToDelete.pathImage !=null){
                          File toDelete = File(elementToDelete.pathImage!);
                          toDelete.delete();
                        }
                        instance.setElement(instance.index, newElement);
                      }
                      Navigator.of(context).pop();
                    } else {
                      final snackBar = SnackBar(
                          backgroundColor: Colors.transparent,
                        elevation: 0,
                        content: CustomContainer(
                            child: Padding(
                                padding: EdgeInsets.only(left: 1.ph(context), right: 1.pv(context)),
                                child: Text(S.current.insertTitle,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.header2(context: context, color: Theme.of(context).colorScheme.primary),))
                        ),
                          behavior: SnackBarBehavior.floating
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: const Color.fromRGBO(26, 26, 36, 100),
                      shape: const StadiumBorder(),
                      side: BorderSide(
                          width: 0.5.pf(context), color: Theme.of(context).colorScheme.secondary)),
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(S.current.confirm,
                            style: Theme.of(context).textTheme.header2(context: context, color: Theme.of(context).colorScheme.secondary)),
                        Padding(
                            padding: EdgeInsets.only(
                                left: constraints.maxWidth * 0.01,
                                right: constraints.maxWidth * 0.01)),
                        Icon(Icons.mode_of_travel_outlined,
                            size: DeviceType.mobile.lenghtEquals(context)?(99.ph(context)*25)/100*0.2:(99.ph(context)*27)/100*0.1)
                      ],
                    );
                  })),
             Padding(padding: EdgeInsets.only(top: 1.pv(context))),
             if( _element != null)
                  TextButton(
                      onPressed: () {
                        final instance = SingletonTrip.getInstance();
                        //We have to delete the image from the cache
                        Trip elementToDelete = instance.getElement(instance.index)!;
                        if(elementToDelete.pathImage !=null){
                          File toDelete = File(elementToDelete.pathImage!);
                          toDelete.delete();
                        }
                        instance.removeElement(instance.index);
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor:
                              const Color.fromRGBO(26, 26, 36, 100),
                          shape: const StadiumBorder(),
                          side: BorderSide(
                              width: 0.5.pf(context), color: Theme.of(context).colorScheme.secondary)),
                      child: LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.current.delete,
                                style:Theme.of(context).textTheme.header2(context: context, color: Theme.of(context).colorScheme.secondary)
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: constraints.maxWidth * 0.01,
                                    right: constraints.maxWidth * 0.01)),
                            Icon(Icons.delete,
                                size: DeviceType.mobile.lenghtEquals(context)?(99.ph(context)*25)/100*0.2:(99.ph(context)*27)/100*0.1)
                          ],
                        );
                      }))
            ],
          ),
        ))
        ))
    );
  }
}
