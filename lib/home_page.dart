import 'package:beamer/beamer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/app_navigation_bar.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/mangers/user_credentials_manger.dart';
import 'package:task_list_app/pages/settings/_view/settings_page.dart';
import 'package:task_list_app/pages/tasks/data/model/task_model.dart';
import 'package:task_list_app/pages/tasks/presentation/_view/tasks_page.dart';
import 'package:task_list_app/pages/teams/_view/teams_page.dart';

import 'pages/projects/_view/projects_page.dart';

// This class does not have to be used. It should be replaced with class
// handling navigation using Beamer package
final selectorTaskProvider=StateProvider<TaskModel?>((ref)=>null);
class HomePage extends StatefulWidget {
  final int indexPage;
  const HomePage({Key? key,this.indexPage=0}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int IndexPage = 0;
  List<Widget> pages = [
    TasksPage(),
    ProjectsPage(),
    TeamsPage(),
    SettingPage()
  ];
  void _onItemTapped(int index) {
    setState(() {
      IndexPage = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    IndexPage=widget.indexPage;
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppStyle.darkBlue,
              ),
              child: Text('Zaynab Srour'),
            ),
            ListTile(
              leading: Icon(
                Icons.task,
              ),
              title:  Text(tr('Tasks')),
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                  IndexPage=0;
                });
              },
            ),
            ListTile(
              leading: Icon(
                Icons.business,
              ),
              title:  Text(tr('Projects')),
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                  IndexPage=1;
                });
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle_rounded,
              ),
              title:  Text(tr('Teams')),
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                  IndexPage=2;
                });
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title:  Text(tr('Settings')),
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                  IndexPage=3;
                });
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: tr('Tasks'),
            backgroundColor: AppStyle.darkBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: tr('Projects'),
            backgroundColor: AppStyle.darkBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: tr('Teams'),
            backgroundColor: AppStyle.darkBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: tr('Settings'),
            backgroundColor: AppStyle.darkBlue,
          ),

        ],
        currentIndex: IndexPage,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      body: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width*0.1,
                maxWidth:  MediaQuery.of(context).size.width*0.32),
            child: AppNavigationBar(
              callBack: (pageIndex){
                setState(() {
                  IndexPage=pageIndex;
                });
                print("IndexPage: "+IndexPage.toString());
              },
            ),
          ),
          Expanded(child: pages[IndexPage]),
        ],
      ),
    );
  }
}


