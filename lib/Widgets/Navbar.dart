import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yourtrip/routes.dart';

import '../generated/l10n.dart';

class Navbar extends StatelessWidget {
  const Navbar(this._indexNav);

  final _indexNav;

  Widget build(BuildContext context) {
    void _changePage(int index) {
      switch (index) {
        case 0:
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(RouteGenerator.homePage);
          break;
        case 1:
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(RouteGenerator.stats);
          break;
        case 2:
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(RouteGenerator.memories);
          break;
        case 3:
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(RouteGenerator.mySettings);
          break;
      }
    }

    return BottomNavigationBar(
      currentIndex: _indexNav,
      selectedItemColor:  Colors.black,
      onTap: (int index) => _changePage(index),
      items:  [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.query_stats), label: S.current.statsNavbar),
        BottomNavigationBarItem(icon: Icon(Icons.photo_album), label: S.current.memoriesNavbar),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: S.current.settingsAppBar)
      ],
    );
  }
}
