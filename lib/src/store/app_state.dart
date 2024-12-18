import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:toastification/toastification.dart';

import '../model/movie_item.dart';

class MyAppState extends ChangeNotifier {
  static bool isLogin = false;
  String tabBarTitle = 'Hello world';
  MovieItem currentMovie = MovieItem(
      1,
      'title',
      'https://image.tmdb.org/t/p/original/x6cLNyJWKK7jdaqL9UNPlvJJoVD.jpg',
      'cover',
      9.8,
      5,
      1998,
      'file',
      'uniqueid',
      'num',
      'introduction',
      'tags',
      'series',
      'studio',
      'country',
      'director',
      'actress',
      'releaseTime',
      0,
      0);
  var favorites = <String>[];
  final logger = Logger();
  void getNext(bool isTrue) {
    notifyListeners();
  }

  void showToast(String message) {
    if (message.isNotEmpty) {
      toastification.show(
        title: Text(message),
        type: ToastificationType.success,
        style: ToastificationStyle.minimal,
        closeButtonShowType: CloseButtonShowType.none,
        autoCloseDuration: const Duration(seconds: 3),
      );
    }
  }

  void updateAttribute(String result) {
    if (result.isNotEmpty) {
      RegExp regex = RegExp(r'\[attr:[^\]]+\]');
      Iterable<RegExpMatch> matches = regex.allMatches(result);
      for (RegExpMatch match in matches) {
        logger.log(Level.info, match[0]);
      }
    }
  }
}
