import 'package:flutter/material.dart';
import 'package:jav_lib_app/src/store/app_state.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});
  static const routeName = 'movie_detail';

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('影片详情'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 海报和详情区域
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // 海报
                  Expanded(
                    flex: 2,
                    child: Image.network(
                      appState.currentMovie.poster,
                      fit: BoxFit.cover,
                      height: 240,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  // 详情区域
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // 标题
                        Text(
                          appState.currentMovie.title,
                          style: TextStyle(fontSize: 24),
                        ),
                        // 评分和发行时间
                        Text(
                          '${appState.currentMovie.score.toStringAsFixed(1)} 分',
                          style: TextStyle(
                              fontSize: 20,
                              color: const Color.fromARGB(255, 255, 191, 0)),
                        ),
                        Text(
                          '厂商: ${appState.currentMovie.studio}',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          '${appState.currentMovie.year}${appState.currentMovie.tags.replaceAll('|', ' / ')}',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          '导演: ${appState.currentMovie.director}',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // 简介
              Text(
                appState.currentMovie.introduction,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              // 相关推荐
              Text(
                '演职人员',
                style: TextStyle(fontSize: 18),
              ),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: appState.currentMovie.actress.split('|').map((movie) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        movie.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      // 这里可以添加电影的小海报或其他信息
                      // Image.network(...)
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
              // 相关推荐
              Text(
                '相关推荐',
                style: TextStyle(fontSize: 18),
              ),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [1, 2, 3].map((movie) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        movie.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      // 这里可以添加电影的小海报或其他信息
                      // Image.network(...)
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
