import 'package:flutter/material.dart';
import '../constants.dart' show Constants , AppColors;

enum ActiconItems {
    GROUP_CHAT, ADD_FRIEND, QR_SACN, PAYMENT, HELP
}
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
        icon: Icon(icon),
        title: Text(title ,style: TextStyle(
            fontSize: 14
        ),),
        activeIcon: Icon(activeIcon),
        backgroundColor: Colors.white
    );
}

class HomeScreem extends StatefulWidget {
   
    _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreem> {
    int _currentIndex = 0;
     PageController _pageController;
    List<NavigationIconView> _navigationIconView;
    List<Widget> _pages;
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
        _pageController = PageController(initialPage: _currentIndex);
        _pages = [
            Container(color: Colors.black),
            Container(color: Colors.blue),
            Container(color: Colors.black),
            Container(color: Colors.red),
            Container(color: Colors.black)
        ];
    }

    _buildPopupMunuItem(int icon, String title) {
        return Row(
            children: <Widget>[
                Icon(IconData(icon,fontFamily: Constants.IconFontFamiy),color: const Color( AppColors.AppBarPopupMenuTextColor)),
                Container(width: 16.0),
                Text(title, style: TextStyle(color: const Color( AppColors.AppBarPopupMenuTextColor))),
            ],
        );
    }

    @override
    Widget build(BuildContext context){
        final BottomNavigationBar botNavBar = BottomNavigationBar(
            fixedColor: const Color(AppColors.TabIconActive),
            items: _navigationIconView
            .map((NavigationIconView view) {
                return view.item;
            }).toList(),
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (int index){
                setState(() {
                    _currentIndex = index;
                });
            },
        );
        return  Scaffold(
            appBar: AppBar(
                title: Text('微信'),
                elevation: 0.0,
                actions: [
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                            print('点击了搜索');
                        },
                    ),
                    PopupMenuButton(
                        itemBuilder: (BuildContext context){
                            return <PopupMenuItem<ActiconItems>>[
                                PopupMenuItem(
                                    child: _buildPopupMunuItem(0xe607, '发起群聊'),
                                    value: ActiconItems.GROUP_CHAT,
                                ),
                                PopupMenuItem(
                                    child: _buildPopupMunuItem(0xe61d, '添加朋友'),
                                    value: ActiconItems.ADD_FRIEND,
                                ),
                                PopupMenuItem(
                                    child: _buildPopupMunuItem(0xe603, '扫一扫'),
                                    value: ActiconItems.QR_SACN,
                                ),
                                PopupMenuItem(
                                    child: _buildPopupMunuItem(0xe626, '收付款'),
                                    value: ActiconItems.PAYMENT,
                                ),
                                PopupMenuItem(
                                    child: _buildPopupMunuItem(0xe63d, '帮助与反馈'),
                                    value: ActiconItems.HELP,
                                )
                            ];
                        },
                        icon: Icon(Icons.add),
                        onSelected: (ActiconItems selected){
                            print('点击的是$selected');
                        },
                    )
                ],
            ),
            body: PageView.builder(
                itemBuilder: (BuildContext context,int index){
                    return _pages[index];
                },
            ),
            bottomNavigationBar: botNavBar,
        );
    }
}