import 'package:covi_tracker/api/api_methods.dart';
import 'package:covi_tracker/constants.dart';
import 'package:covi_tracker/pages/districts/district_tracker.dart';
import 'package:flutter/material.dart';

class DistrictSelect extends StatefulWidget {
  DistrictSelect({ Key? key ,required this.sort}) : super(key: key);
  final String sort;

  @override
  _DistrictSelectState createState() => _DistrictSelectState();
}

class _DistrictSelectState extends State<DistrictSelect> {
  @override
  Widget build(BuildContext context) {

    String districtName = "";
    
    List dist = districtNameChecker(widget.sort);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Select Districts',style: appbarText,),backgroundColor: Colors.white,elevation: 0,
      ),
      body: ListView.builder(
          itemCount: dist.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(dist[index].toString(),style: listText),
              onTap: () {
                districtName = dist[index];
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                           DistrictTracker(dist: districtName, state: widget.sort)));
              },
            );
          }),
    );
  }
}