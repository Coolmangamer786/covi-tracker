import 'package:covi_tracker/constants.dart';
import 'package:covi_tracker/widget/home_textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text("Do's and Dont's", style: appbarText),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   'Dos and Don’ts for Everyone',
                      //   textAlign: TextAlign.left,
                      //   style: appbarText,
                      // ),
             

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "Do's - ",style:bigHeadText.copyWith(color: Colors.green),
                          
                        ),
                      ),

                     
                     HomeText(  
                       head: '1. Hand Wash',
                     

                      
                        body: 'Regular hand wash for 30 seconds will help you avoid germs or any kind of infection. Use soap or hand sanitizer for better results and do this every time you travel or touch anything. ',
                     ),
                     HomeText(  
                       head: '2. Cover Your Mouth & Nose',
                     

                      
                        body:'Covering your mouth and nose while sneezing or when anyone next to coughs or sneezes can do you a lot better. Coronavirus usually spreads through cough and covering your nose and mouth will save you from this epidemic. ',
                     
  ),
                     HomeText(  
                       head:  '3. Consult A Doctor If Sick',
                     

                      
                        body: 'If you are suffering from a common cold, cough, nausea, vomiting, shortness of breath and fatigue make it a point to consult a doctor at the earliest. Any of these symptoms could be a sign that you are suffering from the virus. ',
                     
),
                  
                     HomeText(  
                       head:     '4. Stay Indoors',
                     

                      
                        body:  'Avoid being in crowded places. An infected person can spread the virus instantly and crowded places is a good way to accomplish this. Make sure you wear full sleeves shirts with anti-pollution masks when you travel. Staying indoors is a rather safe option. ',
                      ),
                   
                      Text(
                        "Dont's - ",style: bigHeadText.copyWith(color: Colors.red),
                      ),
  HomeText(  
                       head:   '5. Avoid Close Contact With Anyone',
                     

                      
                        body:  
                        'Do not get close to anyone, especially touching or laughing closely. Also, use anti-pollution masks when out with friends or family. Avoid touching anyone and do not use the same utensils used by another. These simple non-touchy ways can do good until the outbreak comes to an end. ',
                       ),
                        HomeText(  
                       head:     
                        '6. Do Not Spit',
                     
                     

                      
                        body:   'Spitting can increase the spread of the virus. Avoid spiting at in public and home. Also, avoid getting close to a sick person suffering from cold and cough. ',
                     ),
                        HomeText(  
                       head:      '7. Avoid Using Public Transport',

                      
                        body:  
                        'Travelling by cab, flight, bus, train and tramp can get you infected. Use anti-pollution masks and carry a hand sanitizer with you everywhere. Consider travelling by your own vehicle and avoid public transport. In case you are feeling sick, it is advised that you avoid travelling and consult a doctor at the earliest. ',
                     
),
                        HomeText(  
                       head:     '8. Do Not Use Over The Counter Medicines',
                     
                     

                      
                        body:    'If you are suffering from dry cough, back pain, nausea and shortness of breath it is recommended that you consult a doctor rather than opt for self-medication that can leave you battling with a deadly illness. Say no to antibiotics as it would later lead to antibiotic resistance. ',
                     
),
                        HomeText(  
                       head:      '9. Don’t Panic, Take It Easy',

                      
                        body:    'Most often a state of fear can lead to taking wrong decisions and use of self-medication. All you need to keep in mind is hygiene i.e. regular hand wash, use of anti-pollution masks and consult a doctor if you are sick.  ',
                     
    ),
                        HomeText(  
                       head:        '10. Don’t Touch Your Face',
                     

                        body:   'Do not touch your face, nose and mouth often. This avoids the risks of developing the virus. Wash your hands with soap or hand sanitizer and this will do you good.'
                      ),
                     
                    ],
                ),
              ),
                  )),
            ],
          ),
        ));
  }
}
