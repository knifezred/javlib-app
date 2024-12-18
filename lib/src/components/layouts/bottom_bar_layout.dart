import 'package:flutter/material.dart';
import 'package:jav_lib_app/src/views/actress/index.dart';

import '../../store/app_state.dart';
import '../../views/favorites/index.dart';
import '../../views/home/index.dart';
import '../../views/login/index.dart';

class BottomBarLayout extends StatefulWidget {
  final int currentTab;
  const BottomBarLayout({super.key, required this.currentTab});

  @override
  State<BottomBarLayout> createState() => _BottomBarLayoutState();
}

class _BottomBarLayoutState extends State<BottomBarLayout> {
  int selectedIndex = -1;
  static const List<Widget> widgetOptions = [
    HomePage(),
    ActressPage(),
    FavoritesPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!MyAppState.isLogin) {
      return const Scaffold(
        body: LoginPage(),
      );
    }
    if (selectedIndex == -1) {
      selectedIndex = widget.currentTab;
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Logo, 可以是 Image.asset, Image.network 等
              const FlutterLogo(),
              SizedBox(width: 12), // Logo 和文字之间的间距
              // 文字，可以是 Text 组件
              Text('JavLib'),
            ],
          ),
          leading: const SizedBox.shrink(),
        ),
        body: widgetOptions.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: '影片',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              label: '演员',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '收藏',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
        ),
      );
    });
  }
}
