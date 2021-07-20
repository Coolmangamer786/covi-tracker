

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:connectivity/connectivity.dart';

import 'package:covi_tracker/pages/districts/state_select.dart';
import 'package:covi_tracker/pages/home.dart';
import 'package:covi_tracker/pages/settings.dart';
import 'package:covi_tracker/pages/state_tracker.dart';
import 'package:covi_tracker/widget/rate_app_init.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigatorMain extends StatefulWidget {
  const NavigatorMain({Key? key}) : super(key: key);

  @override
  _NavigatorMainState createState() => _NavigatorMainState();
}

class _NavigatorMainState extends State<NavigatorMain> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (BuildContext context,
              AsyncSnapshot<ConnectivityResult> snapshot) {
            if (snapshot.data != null &&
                snapshot.hasData &&
                snapshot.data != ConnectivityResult.none) {
              return bodyBuilder(context);
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.wifi_off,
                        size: 80,
                      ),
                    ),
                    Text(
                      'No Internet',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              );
            }
          }),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.grey.shade100,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: FaIcon(FontAwesomeIcons.chartLine),
            title: Text('State Data'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: FaIcon(FontAwesomeIcons.landmark),
            title: Text(
              'District Data',
            ),
            activeColor: Colors.orange,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.favorite_sharp),
            title: Text('More'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget bodyBuilder(context) {
    switch (_currentIndex) {
      case 0:
        return Homepage();
      case 1:
        return StateTracker();
      case 2:
        return StateSelect();
      default:
        return RateAppInitWidget(builder: (rateMyApp) =>  Settings(rateMyApp: rateMyApp));
    }
  }
}
