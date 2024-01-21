import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourtrip/Extension/DeviceInfo.dart';
import 'package:yourtrip/Extension/Style.dart';
import 'package:yourtrip/Widgets/CustomAppBar.dart';
import 'package:yourtrip/Widgets/Navbar.dart';
import 'package:yourtrip/Widgets/ScrollGrid.dart';

import '../Control/SingletonTrip.dart';
import '../Widgets/CustomContainer.dart';
import '../generated/l10n.dart';

class Memories extends StatelessWidget{

  Widget build(BuildContext context){
    final _instance = SingletonTrip.getInstance();
    return Scaffold(
      appBar: CustomAppBar(text: S.current.memoriesAppBar,),
      body: Column(
        children: [_instance.lenght==0
            ?Align(
                alignment: Alignment.topCenter,
                child:CustomContainer(
                    widht: 80.ph(context),
                    borderRadius: BorderRadius.circular(5),
                    child: Center( child: Text(S.current.addMemories,
                      style: Theme.of(context).textTheme.header2(
                          context: context,
                          color: Theme.of(context).colorScheme.primary),
                      textAlign: TextAlign.center,)
                    )))
        :const Expanded( child:  ScrollGrid(),
        )
        ],
      ),
      bottomNavigationBar: const Navbar(2),
    );
  }
}