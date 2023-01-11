import 'package:beamer/beamer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_list_app/home_page.dart';
import 'package:task_list_app/mangers/user_credentials_manger.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<String> languages = ['English', 'العربية',];
  String x="";
  Future<String> _fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();

    String? languageCode = prefs.getString('language');
if(languageCode==null)return languages[0];else
    return languageCode;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._fetchLocale().then((x) {
      print(x.toString());
      setState(() {
        this.x = x;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              children: [
                Text(tr("Language: ")),
    DropdownButton<String>(
      value: x==""?languages[0]:x,
    items: languages.map((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    }).toList(),
    onChanged: (v) async {
      if(v==languages[0]){
        context.setLocale(Locale('en', 'US'));}
        else context.setLocale(Locale('ar', 'MA'));
      UserCredentialsManger.saveLanguage(v!);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(indexPage: 3,)));},

    )
        ],
      ),
          ),])
    );
  }
}

