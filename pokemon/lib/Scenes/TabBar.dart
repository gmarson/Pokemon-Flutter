import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {

  TabBarDemo({@required this.searchScreen, @required this.savedScreen});

  final Widget searchScreen;
  final Widget savedScreen;

  @override
  Widget build(BuildContext context) {
    return buildTabBar();
  }

  Widget buildTabBar() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
            ],
          ),
        body: TabBarView(
          children: [
            searchScreen,
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}
