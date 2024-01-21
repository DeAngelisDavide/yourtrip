
import 'dart:io';
import 'package:animated_overflow/animated_overflow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourtrip/Control/SingletonCurrecny.dart';
import 'package:yourtrip/Control/TripService.dart';
import 'package:yourtrip/Extension/DeviceInfo.dart';
import 'package:yourtrip/Extension/Style.dart';
import 'package:yourtrip/Widgets/AdsWidget.dart';
import '../routes.dart';

class ScrollTrip extends StatelessWidget{
  const ScrollTrip();
  Widget build(BuildContext context){
    final provider = Provider.of<TripService>(context);
    return Scaffold(
      body:  ListView.separated(
        //If we have to add the ad
        itemCount: provider.lenght,
        itemBuilder: (context, index) {

          var element = provider.getElement((provider.lenght-1)-index)!;

          return Padding(
          padding: EdgeInsets.only(left: 1.ph(context), right: 1.ph(context), top: 2.pv(context)),
              child: GestureDetector(
            onTap: () {
              provider.setIndex((provider.lenght-1)-index);
              Navigator.of(context).pushNamed(RouteGenerator.create);
              },
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              border: Border.all(color: Colors.black)
            ),
            child:  LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraint)
          {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Container(
                decoration:  const BoxDecoration(
                    color: Colors.transparent,
                    border:  Border(
                      right: BorderSide(color: Colors.black),),
                ),
                width: DeviceType.mobile.lenghtEquals(context)?constraint.maxWidth*0.4:constraint.maxWidth*0.26,
                height: DeviceType.mobile.lenghtEquals(context)?constraint.maxWidth*0.4:constraint.maxWidth*0.21,
                child: element.pathImage==null? Center(
                  child: Icon(Icons.no_photography, color: Theme.of(context).colorScheme.primary,),
                )
                    :Image.file(
                  File(element.pathImage!),
                  fit: BoxFit.fill,
                ),
              ),
             Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                children: [ AnimatedOverflow(
              animatedOverflowDirection: AnimatedOverflowDirection.HORIZONTAL,
              maxWidth: DeviceType.mobile.lenghtEquals(context)?constraint.maxWidth*0.48: 60.ph(context),
              child: Text(element.title, style: Theme.of(context).textTheme.header2(context: context, constraint: constraint, color: Theme.of(context).colorScheme.primary),
                overflow: TextOverflow.visible,),
            ),
                  Padding(padding: EdgeInsets.only(top: 0.5.pv(context))),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(90)),
                    child: Text( " ${(element.transportCost + element.hotelCost + element.otherCost).toStringAsFixed(2)}  ${SingletonCurrency.getInstance().actualCurrency} ",
                        style: Theme.of(context).textTheme.header2(context: context, constraint: constraint, color: Theme.of(context).colorScheme.primary)),
                  )
                ]),

            Padding(padding: EdgeInsets.only(left: 2.pv(context)),
           child: Icon(Icons.arrow_forward_ios,
            size: DeviceType.mobile.lenghtEquals(context)?(constraint.maxWidth*25)/100*0.2:(constraint.maxWidth*27)/100*0.1,
            color: Theme.of(context).colorScheme.primary,))
              ],
            );
          }
          )
          )
              )
          );
    }, separatorBuilder: (BuildContext context, int index) {
         return  index==2
              ? AdsWidget(height: 9.pv(context),)
              :Container();
      },
    )
      );
  }
}