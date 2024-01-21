import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourtrip/Control/SingletonTrip.dart';
import 'package:yourtrip/Extension/DeviceInfo.dart';

import '../Control/TripService.dart';


class ScrollGrid extends StatelessWidget {
  const ScrollGrid();

  Widget build(BuildContext context) {
    final _provider = SingletonTrip.getInstance();
    return Scaffold(
      body: Padding(padding: EdgeInsets.only(left: 3.ph(context), right: 3.ph(context), top: 2.pv(context), bottom: 2.pv(context)),
            child:GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: DeviceType.mobile.lenghtEquals(context) ? 1 : 2,
                crossAxisSpacing: 3.ph(context),
                mainAxisSpacing: 3.pv(context),
                childAspectRatio: 2,
                mainAxisExtent: 300,
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: _provider.lenght,
              itemBuilder: (context, index) {
                var _element = _provider.getElement(index)!;
                return Container(
                      width: DeviceType.mobile.lenghtEquals(context)
                          ? 95.ph(context)
                          : 25.ph(context),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          border: Border.all(color: Colors.black)),
                      child: LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraint) {
                        return Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: constraint.maxHeight*0.03),
                            child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                ),
                                width: constraint.maxWidth*0.94,
                                height: 240,
                                child:  _element.pathImage!=null
                            ?FittedBox(
                                  fit: BoxFit.fill,
                                  child: Image.file(File(_element.pathImage!))
                                  )
                            :Center(
                                  child: Icon(Icons.no_photography, color: Theme.of(context).colorScheme.primary,)
                                ))),
                            Padding(padding: EdgeInsets.only(top: constraint.maxHeight*0.05)),
                            Text(_element.title),
                          ],
                        );
                      }
                      )
                  );
                },
            )),
    );
  }
}
