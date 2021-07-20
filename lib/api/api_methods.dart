import 'package:http/http.dart' as http;
import 'dart:convert';


class DataCollection {
  int deceased, vaccinated, recovered, confirmed, tested, dose1, dose2;
  DataCollection(
      {required this.confirmed,
      required this.recovered,
      required this.deceased,
      required this.tested,
      required this.vaccinated,
      required this.dose1,
      required this.dose2});
}

List<String> smallForm = [
  'AN',
  'AP',
  'AR',
  'AS',
  'BR',
  'CH',
  'CT',
  'DN',
  'DL',
  'GA',
  'GJ',
  'HP',
  'HR',
  'JH',
  'JK',
  'KA',
  'KL',
  'LA',
  'LD',
  'MH',
  'ML',
  'MN',
  'MP',
  'MZ',
  'NL',
  'OR',
  'PB',
  'PY',
  'RJ',
  'SK',
  'TG',
  'TN',
  'TR',
  'TT',
  'UP',
  'UT',
  'WB'
];

stateNameChecker(String stateBig) {
  if (stateBig == 'Andaman and Nicobar')
    return 'AN';
  else if (stateBig == 'Andhra Pradesh')
    return 'AP';
  else if (stateBig == 'Arunachal Pradesh')
    return 'AR';
  else if (stateBig == 'Assam')
    return 'AS';
  else if (stateBig == 'Bihar')
    return 'BR';
  else if (stateBig == 'Chandigarh')
    return 'CH';
  else if (stateBig == 'Chhattisgarh')
    return 'CT';
  else if (stateBig == 'Daman and Diu')
    return 'DN';
  else if (stateBig == 'Delhi')
    return 'DL';
  else if (stateBig == 'Goa')
    return 'GA';
  else if (stateBig == 'Gujarat')
    return 'GJ';
  else if (stateBig == 'Haryana')
    return 'HR';
  else if (stateBig == 'Himachal Pradesh')
    return 'HP';
  else if (stateBig == 'Jammu and Kashmir')
    return 'JK';
  else if (stateBig == 'Jharkhand')
    return 'JH';
  else if (stateBig == 'Karnataka')
    return 'KA';
  else if (stateBig == 'Kerala')
    return 'KL';
  else if (stateBig == 'Ladakh')
    return 'LA';
  else if (stateBig == 'Lakshadweep')
    return 'LD';
  else if (stateBig == 'Madhya Pradesh')
    return 'MP';
  else if (stateBig == 'Maharashtra')
    return 'MH';
  else if (stateBig == 'Manipur')
    return 'MN';
  else if (stateBig == 'Meghalaya')
    return 'ML';
  else if (stateBig == 'Mizoram')
    return 'MZ';
  else if (stateBig == 'Nagaland')
    return 'NL';
  else if (stateBig == 'Odisha')
    return 'OR';
  else if (stateBig == 'Puducherry')
    return 'PY';
  else if (stateBig == 'Punjab')
    return 'PB';
  else if (stateBig == 'Rajasthan')
    return 'RJ';
  else if (stateBig == 'Sikkim')
    return 'SK';
  else if (stateBig == 'Tamil Nadu')
    return 'TN';
  else if (stateBig == 'Telangana')
    return 'TG';
  else if (stateBig == 'Tripura')
    return 'TR';
  else if (stateBig == 'Uttar Pradesh')
    return 'UP';
  else if (stateBig == 'Uttarakhand')
    return 'UT';
  else if (stateBig == 'West Bengal') return 'WB';
}

List districtNameChecker(String stateBig) {
  if (stateBig == 'Andaman and Nicobar')
    return an;
  else if (stateBig == 'Andhra Pradesh')
    return ap;
  else if (stateBig == 'Arunachal Pradesh')
    return ar;
  else if (stateBig == 'Assam')
    return ass;
  else if (stateBig == 'Bihar')
    return br;
  else if (stateBig == 'Chandigarh')
    return ch;
  else if (stateBig == 'Chhattisgarh')
    return ct;
  else if (stateBig == 'Daman and Diu')
    return dn;
  else if (stateBig == 'Delhi')
    return dl;
  else if (stateBig == 'Goa')
    return ga;
  else if (stateBig == 'Gujarat')
    return gj;
  else if (stateBig == 'Haryana')
    return hr;
  else if (stateBig == 'Himachal Pradesh')
    return hp;
  else if (stateBig == 'Jammu and Kashmir')
    return jk;
  else if (stateBig == 'Jharkhand')
    return jh;
  else if (stateBig == 'Karnataka')
    return ka;
  else if (stateBig == 'Kerala')
    return kl;
  else if (stateBig == 'Ladakh')
    return la;
  else if (stateBig == 'Lakshadweep')
    return ld;
  else if (stateBig == 'Madhya Pradesh')
    return mp;
  else if (stateBig == 'Maharashtra')
    return mh;
  else if (stateBig == 'Manipur')
    return mn;
  else if (stateBig == 'Meghalaya')
    return ml;
  else if (stateBig == 'Mizoram')
    return mz;
  else if (stateBig == 'Nagaland')
    return nl;
  else if (stateBig == 'Odisha')
    return or;
  else if (stateBig == 'Puducherry')
    return py;
  else if (stateBig == 'Punjab')
    return pb;
  else if (stateBig == 'Rajasthan')
    return rj;
  else if (stateBig == 'Sikkim')
    return sk;
  else if (stateBig == 'Tamil Nadu')
    return tn;
  else if (stateBig == 'Telangana')
    return tg;
  else if (stateBig == 'Tripura')
    return tr;
  else if (stateBig == 'Uttar Pradesh')
    return up;
  else if (stateBig == 'Uttarakhand')
    return ut;
  else if (stateBig == 'West Bengal')
    return wb;
  else
    return tt;
}

Future<List<DataCollection>> getData(String stateBig) async {
  String small = "";
  List<DataCollection> finalData = [];
  small = stateNameChecker(stateBig);
 
  var url = "API_KEY";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);

    DataCollection dc = DataCollection(
        confirmed: json[small]['total']['confirmed'] ?? 0,
        recovered: json[small]['total']['recovered'] ?? 0,
        deceased: json[small]['total']['deceased'] ?? 0,
        tested: json[small]['total']['tested'] ?? 0,
        vaccinated: (json[small]['total']['vaccinated1'] ?? 0) +
            (json[small]['total']['vaccinated2'] ?? 0),
        dose1: json[small]['total']['vaccinated1'] ?? 0,
        dose2: json[small]['total']['vaccinated2'] ?? 0);
    print('${json[small]['total']['confirmed']}');
    finalData.add(dc);
    print('Final Price $finalData');
  } else {
    print(response.statusCode);
    throw 'Problem with the get request';
  }
  return finalData;
}

Future<List<DataCollection>> getDistrictData(String state, String dist) async {
  String small = "";
  List<DataCollection> finalData = [];
  small = stateNameChecker(state);
  var url = "API_KEY";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);

    DataCollection dc = DataCollection(
        confirmed: json[small]['districts'][dist]['total']['confirmed'] ?? 0,
        recovered: json[small]['districts'][dist]['total']['recovered'] ?? 0,
        deceased: json[small]['districts'][dist]['total']['deceased'] ?? 0,
        tested: json[small]['districts'][dist]['total']['tested'] ?? 0,
        vaccinated:
            (json[small]['districts'][dist]['total']['vaccinated1'] ?? 0) +
                (json[small]['districts'][dist]['total']['vaccinated2'] ?? 0),
        dose1: json[small]['districts'][dist]['total']['vaccinated1'] ?? 0,
        dose2: json[small]['districts'][dist]['total']['vaccinated2'] ?? 0);
    print('Dis = $dist, state = $state');
    print(
        'COnfirmed : ${json[small]['districts'][dist]['total']['confirmed']}');
    print('${json[small]['total']['confirmed']}');
    finalData.add(dc);
    print('Final Price $finalData');
  } else {
    print(response.statusCode);
    throw 'Problem with the get request';
  }
  return finalData;
}

List<String> an = [
  "Nicobars",
  "North and Middle Andaman",
  "South Andaman",
  "Unknown"
];

List<String> ap = [
  "Anantapur",
  "Chittoor",
  "East Godavari",
  "Foreign Evacuees",
  "Guntur",
  "Krishna",
  "Kurnool",
  "Other State",
  "Prakasam",
  "S.P.S. Nellore",
  "Srikakulam",
  "Visakhapatnam",
  "Vizianagaram",
  "West Godavari",
  "Y.S.R. Kadapa",
];

List<String> ar = [
  "Anjaw",
  "Capital Complex",
  "Changlang",
  "East Kameng",
  "East Siang",
  "Kamle",
  "Kra Daadi",
  "Kurung Kumey",
  "Lepa Rada",
  "Lohit",
  "Longding",
  "Lower Dibang Valley",
  "Lower Siang",
  "Lower Subansiri",
  "Namsai",
  "Pakke Kessang",
  "Papum Pare",
  "Shi Yomi",
  "Siang",
  "Tawang",
  "Tirap",
  "Upper Dibang Valley",
  "Upper Siang",
  "Upper Subansiri",
  "West Kameng",
  "West Siang",
];

List<String> ass = [
  "Baksa",
  "Barpeta",
  "Biswanath",
  "Bongaigaon",
  "Cachar",
  "Charaideo",
  "Chirang",
  "Darrang",
  "Dhemaji",
  "Dhubri",
  "Dibrugarh",
  "Dima Hasao",
  "Goalpara",
  "Golaghat",
  "Hailakandi",
  "Hojai",
  "Jorhat",
  "Kamrup",
  "Kamrup Metropolitan",
  "Karbi Anglong",
  "Karimganj",
  "Kokrajhar",
  "Lakhimpur",
  "Majuli",
  "Morigaon",
  "Nagaon",
  "Nalbari",
  "Sivasagar",
  "Sonitpur",
  "South Salmara Mankachar",
  "Tinsukia",
  "Udalguri",
  "Unknown",
  "West Karbi Anglong",
];

List<String> br = [
  "Araria",
  "Arwal",
  "Aurangabad",
  "Banka",
  "Begusarai",
  "Bhagalpur",
  "Bhojpur",
  "Buxar",
  "Darbhanga",
  "East Champaran",
  "Gaya",
  "Gopalganj",
  "Jamui",
  "Jehanabad",
  "Kaimur",
  "Katihar",
  "Khagaria",
  "Kishanganj",
  "Lakhisarai",
  "Madhepura",
  "Madhubani",
  "Munger",
  "Muzaffarpur",
  "Nalanda",
  "Nawada",
  "Patna",
  "Purnia",
  "Rohtas",
  "Saharsa",
  "Samastipur",
  "Saran",
  "Sheikhpura",
  "Sheohar",
  "Sitamarhi",
  "Siwan",
  "Supaul",
  "Vaishali",
  "West Champaran",
];

List<String> ch = [
  "Chandigarh",
];

List<String> ct = [
  "Balod",
  "Baloda Bazar",
  "Balrampur",
  "Bametara",
  "Bastar",
  "Bijapur",
  "Bilaspur",
  "Dakshin Bastar Dantewada",
  "Dhamtari",
  "Durg",
  "Gariaband",
  "Gaurela Pendra Marwahi",
  "Janjgir Champa",
  "Jashpur",
  "Kabeerdham",
  "Kondagaon",
  "Korba",
  "Koriya",
  "Mahasamund",
  "Mungeli",
  "Narayanpur",
  "Other State",
  "Raigarh",
  "Raipur",
  "Rajnandgaon",
  "Sukma",
  "Surajpur",
  "Surguja",
  "Uttar Bastar Kanker",
];

List<String> dl = [
  "Delhi",
];

List<String> dn = [
  "Dadra and Nagar Haveli",
  "Daman",
  "Diu",
];

List<String> ga = [
  "North Goa",
  "South Goa",
  "Unknown",
];

List<String> gj = [
  "Ahmedabad",
  "Amreli",
  "Anand",
  "Aravalli",
  "Banaskantha",
  "Bharuch",
  "Bhavnagar",
  "Botad",
  "Chhota Udaipur",
  "Dahod",
  "Dang",
  "Devbhumi Dwarka",
  "Gandhinagar",
  "Gir Somnath",
  "Jamnagar",
  "Junagadh",
  "Kheda",
  "Kutch",
  "Mahisagar",
  "Mehsana",
  "Morbi",
  "Narmada",
  "Navsari",
  "Other State",
  "Panchmahal",
  "Patan",
  "Porbandar",
  "Rajkot",
  "Sabarkantha",
  "Surat",
  "Surendranagar",
  "Tapi",
  "Vadodara",
  "Valsad",
];

List<String> hp = [
  "Bilaspur",
  "Chamba",
  "Hamirpur",
  "Kangra",
  "Kinnaur",
  "Kullu",
  "Lahaul and Spiti",
  "Mandi",
  "Shimla",
  "Sirmaur",
  "Solan",
  "Una",
];

List<String> hr = [
  "Ambala",
  "Bhiwani",
  "Charkhi Dadri",
  "Faridabad",
  "Fatehabad",
  "Gurugram",
  "Hisar",
  "Jhajjar",
  "Jind",
  "Kaithal",
  "Karnal",
  "Kurukshetra",
  "Mahendragarh",
  "Nuh",
  "Palwal",
  "Panchkula",
  "Panipat",
  "Rewari",
  "Rohtak",
  "Sirsa",
  "Sonipat",
  "Yamunanagar",
];

List<String> jh = [
  "Bokaro",
  "Chatra",
  "Deoghar",
  "Dhanbad",
  "Dumka",
  "East Singhbhum",
  "Garhwa",
  "Giridih",
  "Godda",
  "Gumla",
  "Hazaribagh",
  "Jamtara",
  "Khunti",
  "Koderma",
  "Latehar",
  "Lohardaga",
  "Pakur",
  "Palamu",
  "Ramgarh",
  "Ranchi",
  "Sahibganj",
  "Saraikela-Kharsawan",
  "Simdega",
  "West Singhbhum",
];

List<String> jk = [
  "Anantnag",
  "Bandipora",
  "Baramulla",
  "Budgam",
  "Doda",
  "Ganderbal",
  "Jammu",
  "Kathua",
  "Kishtwar",
  "Kulgam",
  "Kupwara",
  "Pulwama",
  "Punch",
  "Rajouri",
  "Ramban",
  "Reasi",
  "Samba",
  "Shopiyan",
  "Srinagar",
  "Udhampur",
];

List<String> ka = [
  "Bagalkote",
  "Ballari",
  "Belagavi",
  "Bengaluru Rural",
  "Bengaluru Urban",
  "Bidar",
  "Chamarajanagara",
  "Chikkaballapura",
  "Chikkamagaluru",
  "Chitradurga",
  "Dakshina Kannada",
  "Davanagere",
  "Dharwad",
  "Gadag",
  "Hassan",
  "Haveri",
  "Kalaburagi",
  "Kodagu",
  "Kolar",
  "Koppal",
  "Mandya",
  "Mysuru",
  "Other State",
  "Raichur",
  "Ramanagara",
  "Shivamogga",
  "Tumakuru",
  "Udupi",
  "Uttara Kannada",
  "Vijayapura",
  "Yadgir",
];

List<String> kl = [
  "Alappuzha",
  "Ernakulam",
  "Idukki",
  "Kannur",
  "Kasaragod",
  "Kollam",
  "Kottayam",
  "Kozhikode",
  "Malappuram",
  "Palakkad",
  "Pathanamthitta",
  "Thiruvananthapuram",
  "Thrissur",
  "Wayanad",
];

List<String> la = [
  "Kargil",
  "Leh",
];

List<String> ld = [
  "Lakshadweep",
];

List<String> mh = [
  "Ahmednagar",
  "Akola",
  "Amravati",
  "Aurangabad",
  "Beed",
  "Bhandara",
  "Buldhana",
  "Chandrapur",
  "Dhule",
  "Gadchiroli",
  "Gondia",
  "Hingoli",
  "Jalgaon",
  "Jalna",
  "Kolhapur",
  "Latur",
  "Mumbai",
  "Nagpur",
  "Nanded",
  "Nandurbar",
  "Nashik",
  "Osmanabad",
  "Other State",
  "Palghar",
  "Parbhani",
  "Pune",
  "Raigad",
  "Ratnagiri",
  "Sangli",
  "Satara",
  "Sindhudurg",
  "Solapur",
  "Thane",
  "Wardha",
  "Washim",
  "Yavatmal",
];

List<String> ml = [
  "East Garo Hills",
  "East Jaintia Hills",
  "East Khasi Hills",
  "North Garo Hills",
  "Ribhoi",
  "South Garo Hills",
  "South West Garo Hills",
  "South West Khasi Hills",
  "West Garo Hills",
  "West Jaintia Hills",
  "West Khasi Hills",
];

List<String> mn = [
  "Bishnupur",
  "Chandel",
  "Churachandpur",
  "Imphal East",
  "Imphal West",
  "Jiribam",
  "Kakching",
  "Kamjong",
  "Kangpokpi",
  "Noney",
  "Pherzawl",
  "Senapati",
  "Tamenglong",
  "Tengnoupal",
  "Thoubal",
  "Ukhrul",
  "Unknown",
];

List<String> mp = [
  "Agar Malwa",
  "Alirajpur",
  "Anuppur",
  "Ashoknagar",
  "Balaghat",
  "Barwani",
  "Betul",
  "Bhind",
  "Bhopal",
  "Burhanpur",
  "Chhatarpur",
  "Chhindwara",
  "Damoh",
  "Datia",
  "Dewas",
  "Dhar",
  "Dindori",
  "Guna",
  "Gwalior",
  "Harda",
  "Hoshangabad",
  "Indore",
  "Jabalpur",
  "Jhabua",
  "Katni",
  "Khandwa",
  "Khargone",
  "Mandla",
  "Mandsaur",
  "Morena",
  "Narsinghpur",
  "Neemuch",
  "Niwari",
  "Panna",
  "Raisen",
  "Rajgarh",
  "Ratlam",
  "Rewa",
  "Sagar",
  "Satna",
  "Sehore",
  "Seoni",
  "Shahdol",
  "Shajapur",
  "Sheopur",
  "Shivpuri",
  "Sidhi",
  "Singrauli",
  "Tikamgarh",
  "Ujjain",
  "Umaria",
  "Vidisha",
];

List<String> mz = [
  "Aizawl",
  "Champhai",
  "Hnahthial",
  "Khawzawl",
  "Kolasib",
  "Lawngtlai",
  "Lunglei",
  "Mamit",
  "Saiha",
  "Saitual",
  "Serchhip",
];

List<String> nl = [
  "Dimapur",
  "Kiphire",
  "Kohima",
  "Longleng",
  "Mokokchung",
  "Mon",
  "Peren",
  "Phek",
  "Tuensang",
  "Wokha",
  "Zunheboto",
];

List<String> or = [
  "Angul",
  "Balangir",
  "Balasore",
  "Bargarh",
  "Bhadrak",
  "Boudh",
  "Cuttack",
  "Deogarh",
  "Dhenkanal",
  "Gajapati",
  "Ganjam",
  "Jagatsinghpur",
  "Jajpur",
  "Jharsuguda",
  "Kalahandi",
  "Kandhamal",
  "Kendrapara",
  "Kendujhar",
  "Khordha",
  "Koraput",
  "Malkangiri",
  "Mayurbhanj",
  "Nabarangapur",
  "Nayagarh",
  "Nuapada",
  "Puri",
  "Rayagada",
  "Sambalpur",
  "State Pool",
  "Subarnapur",
  "Sundargarh",
];

List<String> pb = [
  "Amritsar",
  "Barnala",
  "Bathinda",
  "Faridkot",
  "Fatehgarh Sahib",
  "Fazilka",
  "Ferozepur",
  "Gurdaspur",
  "Hoshiarpur",
  "Jalandhar",
  "Kapurthala",
  "Ludhiana",
  "Mansa",
  "Moga",
  "Pathankot",
  "Patiala",
  "Rupnagar",
  "S.A.S. Nagar",
  "Sangrur",
  "Shahid Bhagat Singh Nagar",
  "Sri Muktsar Sahib",
  "Tarn Taran",
];

List<String> py = [
  "Karaikal",
  "Mahe",
  "Puducherry",
  "Yanam",
];

List<String> rj = [
  "Ajmer",
  "Alwar",
  "BSF Camp",
  "Banswara",
  "Baran",
  "Barmer",
  "Bharatpur",
  "Bhilwara",
  "Bikaner",
  "Bundi",
  "Chittorgarh",
  "Churu",
  "Dausa",
  "Dholpur",
  "Dungarpur",
  "Evacuees",
  "Ganganagar",
  "Hanumangarh",
  "Italians",
  "Jaipur",
  "Jaisalmer",
  "Jalore",
  "Jhalawar",
  "Jhunjhunu",
  "Jodhpur",
  "Karauli",
  "Kota",
  "Nagaur",
  "Other State",
  "Pali",
  "Pratapgarh",
  "Rajsamand",
  "Sawai Madhopur",
  "Sikar",
  "Sirohi",
  "Tonk",
  "Udaipur",
];

List<String> sk = [
  "East Sikkim",
  "North Sikkim",
  "South Sikkim",
  "Unknown",
  "West Sikkim",
];

List<String> tg = [
  "Adilabad",
  "Bhadradri Kothagudem",
  "Hyderabad",
  "Jagtial",
  "Jangaon",
  "Jayashankar Bhupalapally",
  "Jogulamba Gadwal",
  "Kamareddy",
  "Karimnagar",
  "Khammam",
  "Komaram Bheem",
  "Mahabubabad",
  "Mahabubnagar",
  "Mancherial",
  "Medak",
  "Medchal Malkajgiri",
  "Mulugu",
  "Nagarkurnool",
  "Nalgonda",
  "Narayanpet",
  "Nirmal",
  "Nizamabad",
  "Peddapalli",
  "Rajanna Sircilla",
  "Ranga Reddy",
  "Sangareddy",
  "Siddipet",
  "Suryapet",
  "Unknown",
  "Vikarabad",
  "Wanaparthy",
  "Warangal Rural",
  "Warangal Urban",
  "Yadadri Bhuvanagiri",
];

List<String> tn = [
  "Airport Quarantine",
  "Ariyalur",
  "Chengalpattu",
  "Chennai",
  "Coimbatore",
  "Cuddalore",
  "Dharmapuri",
  "Dindigul",
  "Erode",
  "Kallakurichi",
  "Kancheepuram",
  "Kanyakumari",
  "Karur",
  "Krishnagiri",
  "Madurai",
  "Nagapattinam",
  "Namakkal",
  "Nilgiris",
  "Perambalur",
  "Pudukkottai",
  "Railway Quarantine",
  "Ramanathapuram",
  "Ranipet",
  "Salem",
  "Sivaganga",
  "Tenkasi",
  "Thanjavur",
  "Theni",
  "Thiruvallur",
  "Thiruvarur",
  "Thoothukkudi",
  "Tiruchirappalli",
  "Tirunelveli",
  "Tirupathur",
  "Tiruppur",
  "Tiruvannamalai",
  "Vellore",
  "Viluppuram",
  "Virudhunagar",
];

List<String> tr = [
  "Dhalai",
  "Gomati",
  "Khowai",
  "North Tripura",
  "Sipahijala",
  "South Tripura",
  "Unokoti",
  "West Tripura",
];

List<String> tt = [];

List<String> up = [
  "Agra",
  "Aligarh",
  "Ambedkar Nagar",
  "Amethi",
  "Amroha",
  "Auraiya",
  "Ayodhya",
  "Azamgarh",
  "Baghpat",
  "Bahraich",
  "Ballia",
  "Balrampur",
  "Banda",
  "Barabanki",
  "Bareilly",
  "Basti",
  "Bhadohi",
  "Bijnor",
  "Budaun",
  "Bulandshahr",
  "Chandauli",
  "Chitrakoot",
  "Deoria",
  "Etah",
  "Etawah",
  "Farrukhabad",
  "Fatehpur",
  "Firozabad",
  "Gautam Buddha Nagar",
  "Ghaziabad",
  "Ghazipur",
  "Gonda",
  "Gorakhpur",
  "Hamirpur",
  "Hapur",
  "Hardoi",
  "Hathras",
  "Jalaun",
  "Jaunpur",
  "Jhansi",
  "Kannauj",
  "Kanpur Dehat",
  "Kanpur Nagar",
  "Kasganj",
  "Kaushambi",
  "Kushinagar",
  "Lakhimpur Kheri",
  "Lalitpur",
  "Lucknow",
  "Maharajganj",
  "Mahoba",
  "Mainpuri",
  "Mathura",
  "Mau",
  "Meerut",
  "Mirzapur",
  "Moradabad",
  "Muzaffarnagar",
  "Pilibhit",
  "Pratapgarh",
  "Prayagraj",
  "Rae Bareli",
  "Rampur",
  "Saharanpur",
  "Sambhal",
  "Sant Kabir Nagar",
  "Shahjahanpur",
  "Shamli",
  "Shrawasti",
  "Siddharthnagar",
  "Sitapur",
  "Sonbhadra",
  "Sultanpur",
  "Unnao",
];

List<String> ut = [
  "Almora",
  "Bageshwar",
  "Chamoli",
  "Champawat",
  "Dehradun",
  "Haridwar",
  "Nainital",
  "Pauri Garhwal",
  "Pithoragarh",
  "Rudraprayag",
  "Tehri Garhwal",
  "Udham Singh Nagar",
  "Uttarkashi",
];

List<String> wb = [
  "Alipurduar",
  "Bankura",
  "Birbhum",
  "Cooch Behar",
  "Dakshin Dinajpur",
  "Darjeeling",
  "Hooghly",
  "Howrah",
  "Jalpaiguri",
  "Jhargram",
  "Kalimpong",
  "Kolkata",
  "Malda",
  "Murshidabad",
  "Nadia",
  "North 24 Parganas",
  "Other State",
  "Paschim Bardhaman",
  "Paschim Medinipur",
  "Purba Bardhaman",
  "Purba Medinipur",
  "Purulia",
  "South 24 Parganas",
  "Uttar Dinajpur",
];
