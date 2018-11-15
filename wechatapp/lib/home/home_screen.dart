import 'package:flutter/material.dart';
import '../constants.dart' show Constants , AppColors;
class NavigationIconView {
    final String _title;
    final IconData _icon;
    final IconData _activeIcon;
    final BottomNavigationBarItem item;

    NavigationIconView({Key key, String title, IconData icon, IconData activeIcon}) :
    _title = title,
    _icon = icon,
    _activeIcon = activeIcon,
    item = new BottomNavigationBarItem(
        icon: Icon(icon, color: Color(AppColors.TabIconNormal)),
        title: Text(title ,style: TextStyle(
            fontSize: 14,
            color: Color(AppColors.TabIconNormal)
        ),),
        activeIcon: Icon(activeIcon,color: Color(AppColors.TabIconActive)),
        backgroundColor: Colors.white
    );
}

class HomeScreem extends StatefulWidget {
   
    _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreem> {

     List<NavigationIconView> _navigationIconView;
    
    void initState(){
        super.initState();
        _navigationIconView = [
            NavigationIconView(
                title: '我心',
                icon: IconData(
                    0xe606,
                    fontFamily: Constants.IconFontFamiy
                ),
                activeIcon:IconData(
                    0xe6b5,
                    fontFamily: Constants.IconFontFamiy
                )
                // icon: Icon(Icons.ac_unit),
                // activeIcon: Icon(Icons.access_alarm)
            ),
            NavigationIconView(
                title: '通讯录',
                icon: IconData(
                    0xe655,
                    fontFamily: Constants.IconFontFamiy
                ),
                activeIcon: IconData(
                    0xe656,
                    fontFamily: Constants.IconFontFamiy
                )
            ),
            NavigationIconView(
                title: '发现',
                icon:IconData(
                    0xe643,
                    fontFamily: Constants.IconFontFamiy,
                ),
                activeIcon: IconData(
                    0xe60c,
                    fontFamily: Constants.IconFontFamiy
                )
            ),
            NavigationIconView(
                title: '我',
                icon: IconData(
                    0xe710,
                    fontFamily: Constants.IconFontFamiy
                ),
                activeIcon: IconData(
                    0xe635,
                    fontFamily: Constants.IconFontFamiy
                )
            ),
        ];
        // for (NavigationIconView view in _navigationIconView){

        // }
    }

    @override
    Widget build(BuildContext context){
        final BottomNavigationBar botNavBar = BottomNavigationBar(
            items: _navigationIconView
            .map((NavigationIconView view) {
                return view.item;
            }).toList(),
            currentIndex: 0,
            type: BottomNavigationBarType.fixed,
            onTap: (int index){
                print('点击的是$index');
            },
        );
        return  Scaffold(
            appBar: AppBar(
                title: Text('微信'),
                actions: [
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                            print('点击了搜索');
                        },
                    ),
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                            print('点击的添加');
                        },
                    )
                ],
            ),
            body: Container(
                color: Colors.blue,
            ),
            bottomNavigationBar: botNavBar,
        );
    }
}