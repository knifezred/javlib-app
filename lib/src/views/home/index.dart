import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jav_lib_app/src/model/movie_item.dart';
import 'package:jav_lib_app/src/store/app_state.dart';
import 'package:jav_lib_app/src/views/home/movie_detail.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    List<MovieItem> movies = [
      MovieItem(
          1,
          '肖申克的救赎',
          'https://image.tmdb.org/t/p/original/x6cLNyJWKK7jdaqL9UNPlvJJoVD.jpg',
          'https://image.tmdb.org/t/p/original/x6cLNyJWKK7jdaqL9UNPlvJJoVD.jpg',
          9.8,
          5,
          1994,
          'file',
          'uniqueid',
          'num',
          '1947年，小有成就的青年银行家安迪因涉嫌杀害妻子及她的情人而锒铛入狱。在这座名为肖申克的监狱内，希望似乎虚无缥缈，终身监禁的惩罚无疑注定了安迪接下来灰暗绝望的人生。未过多久，安迪尝试接近囚犯中颇有声望的瑞德，请求对方帮自己搞来小锤子。以此为契机，二人逐渐熟络，安迪也仿佛在鱼龙混杂、罪恶横生、黑白混淆的牢狱中找到属于自己的求生之道。他利用自身的专业知识，帮助监狱管理层逃税、洗黑钱，同时凭借与瑞德的交往在犯人中间也渐渐受到礼遇。表面看来，他已如瑞德那样对那堵高墙从憎恨转变为处之泰然，但是对自由的渴望仍促使他朝着心中的希望和目标前进。而关于其罪行的真相，似乎更使这一切朝前推进了一步。',
          '|剧情|犯罪|',
          '豆瓣Top250',
          'studio',
          'country',
          'director',
          '|蒂姆·罗宾斯|摩根·弗里曼|鲍勃·冈顿|威廉姆·赛德勒|克兰西·布朗|吉尔·贝罗斯|小詹姆斯·艾伦·惠特莫尔|马克·罗尔斯顿|杰弗里·德蒙|拉里·勃兰登堡|尼尔·吉恩托利|',
          '1994-09-23',
          0,
          1),
      MovieItem(
          2,
          '教父',
          'https://image.tmdb.org/t/p/original/y03tzUKvkRCYwJ5NWys4W4bnS9m.jpg',
          'https://image.tmdb.org/t/p/original/y03tzUKvkRCYwJ5NWys4W4bnS9m.jpg',
          9.8,
          5,
          1994,
          'file',
          'uniqueid',
          'num',
          'test',
          '|剧情|犯罪|',
          '豆瓣Top250',
          'studio',
          'country',
          'director',
          '|蒂姆·罗宾斯|摩根·弗里曼|鲍勃·冈顿|威廉姆·赛德勒|克兰西·布朗|吉尔·贝罗斯|小詹姆斯·艾伦·惠特莫尔|马克·罗尔斯顿|杰弗里·德蒙|拉里·勃兰登堡|尼尔·吉恩托利|',
          '1994-09-23',
          0,
          1)
    ];
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 2.0 / 3.0,
        ),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              appState.currentMovie = movies[index];
              // Navigate to the details page. If the user leaves and returns to
              // the app after it has been killed while running in the
              // background, the navigation stack is restored.
              GoRouter.of(context).pushNamed(MovieDetailPage.routeName);
            },
            child: Image(
              image: NetworkImage(movies[index].poster),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
