import 'package:covi_tracker/api/api_methods.dart';
import 'package:covi_tracker/constants.dart';
import 'package:covi_tracker/pages/state_changer.dart';
import 'package:covi_tracker/widget/ex_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

class StateTracker extends StatefulWidget {
  const StateTracker({Key? key}) : super(key: key);

  @override
  _StateTrackerState createState() => _StateTrackerState();
}

class _StateTrackerState extends State<StateTracker> {
  String selState = '';
  List<String> stateName = [
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
  void initState() {
    super.initState();
    selState = StateNotifier.getStateName() ?? 'West Bengal';
  }

  late int vacc = 0, recc = 0, test = 0, con = 0, dec = 0, d1 = 0, d2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButton(
          isExpanded: true,
          style: appbarText,
          dropdownColor: Colors.white,
          underline: SizedBox(),
          icon: FaIcon(
            FontAwesomeIcons.caretDown,
            color: Colors.black,
          ),
          value: selState,
          onChanged: (newValue) {
            setState(() {
              this.selState = newValue.toString();
              StateNotifier.setStateName(selState);
            });
          },
          items: stateName.map((valueItem) {
            return DropdownMenuItem(child: Text(valueItem), value: valueItem);
          }).toList(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: FutureBuilder(
          future: getData(selState),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Column(
                      children: [
                        ExContainer(
                          ex: true,
                          stordis: selState,
                          title: 'Confirmed',
                          cases: snapshot.data[i].confirmed.toString(),
                          color: Colors.red,
                          descp:
                              'Please be Stay Safe 🔒 and get Vaccinated 💉 as soon as possible.',
                        ),
                        ExContainer(
                          ex: true,
                          stordis: selState,
                          title: 'Recovered',
                          cases: snapshot.data[i].recovered.toString(),
                          color: Colors.orange,
                          descp:
                              'Never loose hope we can always get Recovered 💝 Stay Strong 💪 we will fight together against the Virus 👿.',
                        ),
                        ExContainer(
                          ex: false,
                          stordis: selState,
                          title: 'Tested',
                          cases: snapshot.data[i].tested.toString(),
                          color: Colors.blue,
                          descp: 'If you fill uncomfortable please do a test.',
                        ),
                        ExContainer(
                          ex: false,
                          stordis: selState,
                          title: 'Vaccinated',
                          cases: snapshot.data[i].vaccinated.toString(),
                          color: Colors.green,
                          descp: 'Take your vaccine as soon as possible.',
                        ),
                        ExContainer(
                          ex: false,
                          stordis: selState,
                          title: 'Decreased',
                          cases: snapshot.data[i].deceased.toString(),
                          color: Colors.black,
                          descp:
                              'We have lost lot of peoples in our surrounding,Please be Safe 🔒 and Take Safety precautions',
                        ),
                        shareData(
                            snapshot.data[i].confirmed,
                            snapshot.data[i].recovered,
                            snapshot.data[i].tested,
                            snapshot.data[i].vaccinated,
                            snapshot.data[i].dose1,
                            snapshot.data[i].dose2,
                            snapshot.data[i].deceased),
                      ],
                    );
                  });
            }
          },
        )),
      ),
      floatingActionButton:  FloatingActionButton(
          onPressed: () {
            String conDes = con == 0 ? '' : '\n😷 Confirmed Cases  : $con';
            String recDes = recc == 0 ? '' : '\n💝 Recovered Cases : $recc';

            String testDec = test == 0 ? '' : '\n🔥 Testings Done : $test ';
            String vacDec = vacc == 0 ? '' : '\n💉 Vaccinated : $vacc ';
            String decDes = dec == 0 ? '' : '\n👼 Deaths : $dec ';

            Share.share(
                '📌 In $selState \n$conDes $recDes $testDec $vacDec $decDes \n\n🙏 Stay Safe and take safety precautions. \n🎯 For more download the app today. https://bit.ly/3hqlbtV',
                subject: 'Latest Covid Data of $selState');
            print(
                'Conf : ${con.toString()}, \n Rec: ${recc.toString()},${test.toString()},${vacc.toString()},${d1.toString()},${d2.toString()},${dec.toString()}');
          },
           child: FaIcon(FontAwesomeIcons.shareSquare),
      ),
    );
  }

  shareData(int confirmed, int recovered, int tests, int vaccinated, int dose1,
      int dose2, int decrease) {
    con = confirmed;
    recc = recovered;
    test = tests;
    vacc = vaccinated;
    d1 = dose1;
    d2 = dose2;
    dec = decrease;
    return SizedBox();
  }
}
