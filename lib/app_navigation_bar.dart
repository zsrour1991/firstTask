import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_list_app/common/app_style.dart';

class AppNavigationBar extends StatelessWidget {
  final Function(int) callBack;
  const AppNavigationBar({Key? key,required this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppStyle.darkBlue,
      child: ListView.separated(
       // padding: const EdgeInsets.symmetric(vertical: 64),
        itemCount: navigationBarItems.length,
        itemBuilder: (context, index) => _NavigationBarListItem(
          item: navigationBarItems[index],callBack: callBack,index: index,
        ),
        separatorBuilder: (context, index) => Divider(
          color: AppStyle.mediumBlue,
          height: 1,
          endIndent: 16,
          indent: 16,
        ),
      ),
    );
  }
}

class _NavigationBarListItem extends StatefulWidget {
  final NavigationBarItem item;
  final int index;
  final Function(int) callBack;
  const _NavigationBarListItem({Key? key,required this.item,required this.callBack,required this.index}) : super(key: key);

  @override
  _NavigationBarListItemState createState() => _NavigationBarListItemState();
}
class _NavigationBarListItemState extends State<_NavigationBarListItem> {
  int selected=-1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       widget.callBack(widget.item.index);
       setState(() {
         selected=widget.index;
       });

       print("selected: "+selected.toString());
       print("index: "+widget.index.toString());

      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)  ,
          color: selected==widget.index?Colors.amber:Colors.transparent
        ),

        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
         tr( widget.item.name),
          style: TextStyle(
            color: AppStyle.lightTextColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

final navigationBarItems = [
  // TODO: labels should be in app localization file
  NavigationBarItem(name: tr('Tasks'), url: 'tasks',index: 0),
  NavigationBarItem(name: tr('Projects'), url: 'projects',index: 1),
  NavigationBarItem(name: tr('Teams'), url: 'teams',index: 2),
];

class NavigationBarItem {
  final String name;
  final String url;
  final int index;

  NavigationBarItem({required this.name, required this.url,required this.index});
}
