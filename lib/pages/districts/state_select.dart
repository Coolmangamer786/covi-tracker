
import 'package:covi_tracker/pages/districts/district_select.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class StateSelect extends StatefulWidget {
  const StateSelect({ Key? key }) : super(key: key);

  @override
  _StateSelectState createState() => _StateSelectState();
}

class _StateSelectState extends State<StateSelect> {
   String sortName = '';
  List<String> stateNameLarge = [
    'Andaman and Nicobar',
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chandigarh',
    'Chhattisgarh',
    'Daman and Diu',
    'Delhi',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu and Kashmir',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Ladakh',
    'Lakshadweep',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Puducherry',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select State',style: appbarText,),backgroundColor: Colors.white,elevation: 0,),
body: allstateNames(context),
    );
  }
  Widget allstateNames(BuildContext context){
    return ListView.builder(itemCount: stateNameLarge.length,itemBuilder: (context,i){
      return ListTile(
        title: Text(stateNameLarge[i].toString(),style: listText,),
        onTap: () {
                // sortName = stateNameChecker(stateNameLarge[index]);
                this.sortName=stateNameLarge[i];
                print(stateNameLarge[i]);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DistrictSelect(sort: sortName)));
              },
      );
    });
  }


}