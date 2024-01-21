import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:yourtrip/Extension/DeviceInfo.dart';
import 'package:yourtrip/Extension/Style.dart';

import '../Model/StatsData.dart';
import 'CustomContainer.dart';

class ChartContainer extends StatelessWidget {
  final Color color;
  final String title;

  const ChartContainer({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        widht: 80.ph(context),
        borderRadius: BorderRadius.circular(5),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                  children: [
                    Text(title,
                        style: Theme.of(context).textTheme.header1(context: context, color: Theme.of(context).colorScheme.primary)
                    ),
                    Padding(padding: EdgeInsets.only(top: 1.pv(context))),
                    SizedBox(
                        width: constraints.maxWidth*0.9,
                        height: 40.pv(context),
                        child: PieChart(
                          colorList: const [Colors.redAccent, Colors.blueAccent, Colors.lightGreen],
                          dataMap: StatsData().dataMap,
                          animationDuration: Duration(milliseconds: 800),
                          chartLegendSpacing: 16,
                          legendOptions: LegendOptions(
                            showLegendsInRow: false,
                            legendPosition: LegendPosition.bottom,
                            showLegends: true,
                            legendShape: BoxShape.circle,
                            legendTextStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValueBackground: true,
                            showChartValues: true,
                            showChartValuesInPercentage: true,
                            showChartValuesOutside: false,
                            decimalPlaces: 2,
                          ),
                        )
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 2.ph(context))),
                  ]
              );
            })
    );
  }
}