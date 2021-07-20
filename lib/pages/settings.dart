import 'package:covi_tracker/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  const Settings({
    Key? key,
    required this.rateMyApp,
  }) : super(key: key);
  final RateMyApp rateMyApp;
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: h * .80,
          width: double.infinity,
          // color: Colors.brown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                size: h * .3,
                color: Colors.red,
              ),
              Text(
                'Thanks for using this app.',
                style: appbarText,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                title: Text(
                                  'Donate as your wish',
                                  style: appbarText,
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Close'))
                                ],
                                content: GestureDetector(
                                  child: Image(
                                    image: AssetImage('images/paytm.jpg'),
                                    height: 150,
                                    width:150,
                                  ),
                                  onTap: () {
                                    _launchURL('https://paytm.me/Gr-wl0e');
                                  },
                                )));
                      },
                      child: Text('Donate')),
                  TextButton(
                      onPressed: () {
                        Share.share(
                            'I am using Covi Tracker app for keeping a track of  latest Covid Stats State and District wise🔥.\n\n🎯Download Covi Tracker Now. https://bit.ly/3hqlbtV');
                      },
                      child: Text('Share')),
                  TextButton(
                      onPressed: () {
                        widget.rateMyApp.showStarRateDialog(context,
                            title: 'Rate This App',
                            message:
                                'Do you like this app? Please leave a rating',
                            starRatingOptions:
                                StarRatingOptions(initialRating: 4),
                            actionsBuilder: actionsBuilder);
                      },
                      child: Text('Rate App')),
                  TextButton(
                      onPressed: () {
                        _launchURL('https://bit.ly/3wtc8wB');
                      },
                      child: Text('Privacy Policy')),
                  TextButton(
                      onPressed: () {
                        showAboutDialog(
                          applicationIcon: Image(
                            image: AssetImage("images/icon.png"),
                            height: h<400? h*.1:100,
                            width: h<400? h*.1:100,
                          ),
                          context: context,
                          applicationName: 'Covi Tracker',
                          applicationVersion: '1.0.0',
                          applicationLegalese:
                              'This app is designed by Coolman Gamer.',
                        );
                      },
                      child: Text('About')),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  List<Widget> actionsBuilder(BuildContext context, double? stars) =>
      stars == null
          ? [buildCancelButton()]
          : [buildOkButton(stars), buildCancelButton()];

  Widget buildOkButton(double stars) => TextButton(
        child: Text('OK'),
        onPressed: () async {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Thanks for your feedback!')),
          );

          final launchAppStore = stars >= 4;

          final event = RateMyAppEventType.rateButtonPressed;

          await widget.rateMyApp.callEvent(event);

          if (launchAppStore) {
            widget.rateMyApp.launchStore();
          }

          Navigator.of(context).pop();
        },
      );

  Widget buildCancelButton() => RateMyAppNoButton(
        widget.rateMyApp,
        text: 'CANCEL',
      );

  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
