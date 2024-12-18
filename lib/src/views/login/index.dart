import 'package:flutter/material.dart';

import '../../components/layouts/bottom_bar_layout.dart';
import '../../store/app_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/t0.webp'), // 本地图片
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "JavLib媒体库",
                  style: TextStyle(color: Colors.white, fontSize: 42),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => {
                        MyAppState.isLogin = true,
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomBarLayout(
                              currentTab: 0,
                            ),
                          ),
                        ),
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: Colors.amber, fontSize: 36),
                      ),
                    ),
                    const Text(
                      'or',
                      style: TextStyle(color: Colors.amber, fontSize: 36),
                    ),
                    TextButton(
                      child: const Text(
                        'No',
                        style: TextStyle(color: Colors.amber, fontSize: 36),
                      ),
                      onPressed: () => {
                        MyAppState.isLogin = true,
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomBarLayout(
                              currentTab: 0,
                            ),
                          ),
                        ),
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
