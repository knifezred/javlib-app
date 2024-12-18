import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../store/app_state.dart';

class ActressPage extends StatelessWidget {
  const ActressPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text('No actress yet.'),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Center(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text('You have '
                      '${appState.favorites.length} favorites:'),
                ),
                for (var pair in appState.favorites)
                  ListTile(
                    leading: const Icon(Icons.favorite),
                    title: Text(pair),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
