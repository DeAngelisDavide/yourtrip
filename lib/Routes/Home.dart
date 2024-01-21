import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourtrip/Extension/DeviceInfo.dart';
import 'package:yourtrip/Widgets/CustomAppBar.dart';
import 'package:yourtrip/Widgets/ScrollTrip.dart';

import '../Control/SingletonTrip.dart';
import '../Widgets/Navbar.dart';
import '../generated/l10n.dart';
import '../routes.dart';

class Home extends StatelessWidget{
  const Home();

  Widget build(BuildContext context){
    final instance = SingletonTrip.getInstance();
    return Scaffold(
      appBar: CustomAppBar(text: S.current.homeAppBar,),
      body: Column(
    children: [Expanded(child: ChangeNotifierProvider.value(
        value: instance,
        child: const ScrollTrip(),
      )),
      Padding(padding: EdgeInsets.only(top: 1.pv(context))),
     SizedBox(
       height: 6.pv(context),
         child: ElevatedButton(
    style: TextButton.styleFrom(
    backgroundColor: Theme.of(context).colorScheme.primary,
    shape: const CircleBorder(),
    ),
    child: Icon(Icons.add, color: Theme.of(context).colorScheme.secondary, size: DeviceType.mobile.lenghtEquals(context)?(99.ph(context)*25)/100*0.2:(99.ph(context)*27)/100*0.1,),
    onPressed: () {
      instance.setIndex(-1);
      Navigator.of(context).pushNamed(RouteGenerator.create);
    },
    )),
      Padding(padding: EdgeInsets.only(top: 1.pv(context)))
    ]
      ),
      bottomNavigationBar: const Navbar(0),
    );
  }
}