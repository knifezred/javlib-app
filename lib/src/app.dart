import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import '../router.dart';
import 'settings/settings_controller.dart';
import 'store/app_state.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: ToastificationWrapper(
        child: MaterialApp.router(
          title: 'JavLib媒体库',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          routerConfig: router,
        ),
      ),
    );
  }
}
