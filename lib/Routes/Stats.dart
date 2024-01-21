import 'package:animated_overflow/animated_overflow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yourtrip/Control/SingletonCurrecny.dart';
import 'package:yourtrip/Extension/DeviceInfo.dart';
import 'package:yourtrip/Extension/Style.dart';
import 'package:yourtrip/Widgets/AdsWidget.dart';
import 'package:yourtrip/Widgets/CustomContainer.dart';
import '../Model/StatsData.dart';
import '../Model/Trip.dart';
import '../Widgets/ChartContainer.dart';
import '../Widgets/CustomAppBar.dart';
import '../Widgets/Navbar.dart';
import '../generated/l10n.dart';

class Stats extends StatelessWidget {
  const Stats();

  Widget build(BuildContext context) {
    Trip? max = StatsData.max();
    Trip? min = StatsData.min();
    final totalCost = StatsData.totalCost(0);
    return Scaffold(
      appBar: CustomAppBar(
        text: S.current.statsAppBar,
      ),
      body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomContainer(
                  widht: 80.ph(context),
                    borderRadius: BorderRadius.circular(5),
                    child: Column(children: [
                      Text("${S.current.totalCost}:",
                          style: Theme.of(context).textTheme.header1(
                              context: context,
                              color: Theme.of(context).colorScheme.primary)),
                    Padding(padding: EdgeInsets.only(top: 0.5.pv(context))),
                    AnimatedOverflow(
                        animatedOverflowDirection: AnimatedOverflowDirection.HORIZONTAL,
                        maxWidth: 76.ph(context),
                        child:Text(
                          "${totalCost.toStringAsFixed(2)} ${SingletonCurrency.getInstance().actualCurrency}",
                          style: Theme.of(context).textTheme.header2(
                              context: context,
                              color: Theme.of(context).colorScheme.primary)))
                    ])),
                if(totalCost != 0)
                  ChartContainer(
                        title: "${S.current.costSpecifically}:",
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                 AdsWidget(
                      widht: 80.ph(context),
                   height: 9.pv(context),
                    ),
                if (max != null && totalCost != 0)
                  CustomContainer(
                      widht: 80.ph(context),
                      borderRadius: BorderRadius.circular(5),
                      child: Column(children: [
                        Text("${S.current.moreExpensive}:",
                            style: Theme.of(context).textTheme.header1(
                                context: context,
                                color: Theme.of(context).colorScheme.primary)),
                        Padding(padding: EdgeInsets.only(top: 0.5.pv(context))),
                        Text(max.title,
                            style: Theme.of(context).textTheme.header2(
                                context: context,
                                color: Theme.of(context).colorScheme.primary)),
                        Padding(padding: EdgeInsets.only(top: 0.5.pv(context))),
                        Text(
                            "${(max.transportCost + max.hotelCost + max.otherCost).toStringAsFixed(2)} ${SingletonCurrency.getInstance().actualCurrency}",
                            style: Theme.of(context).textTheme.header2(
                                context: context,
                                color: Theme.of(context).colorScheme.primary)),
                      ])),
                if (min != null && totalCost != 0)
                  CustomContainer(
                      widht: 80.ph(context),
                      borderRadius: BorderRadius.circular(5),
                      child: Column(children: [
                        Text("${S.current.lessExpensive}:",
                            style: Theme.of(context).textTheme.header1(
                                context: context,
                                color: Theme.of(context).colorScheme.primary)),
                        Padding(padding: EdgeInsets.only(top: 0.5.pv(context))),
                        Text(min.title,
                            style: Theme.of(context).textTheme.header2(
                                context: context,
                                color: Theme.of(context).colorScheme.primary)),
                        Padding(padding: EdgeInsets.only(top: 0.5.pv(context))),
                        Text(
                            "${(min.transportCost + min.hotelCost + min.otherCost).toStringAsFixed(2)} ${SingletonCurrency.getInstance().actualCurrency}",
                            style: Theme.of(context).textTheme.header2(
                                context: context,
                                color: Theme.of(context).colorScheme.primary)),
                      ])),
                if(totalCost == 0)
                  CustomContainer(
                      widht: 80.ph(context),
                      borderRadius: BorderRadius.circular(5),
                      child: Center( child: Text(S.current.addTrip,
                          style: Theme.of(context).textTheme.header2(
                              context: context,
                              color: Theme.of(context).colorScheme.primary),
                        textAlign: TextAlign.center,)
                      )),
                Padding(padding: EdgeInsets.only(bottom: 2.pv(context))),
              ],
            ),
          )),
      bottomNavigationBar: const Navbar(1),
    );
  }
}
