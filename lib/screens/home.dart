import 'package:flutter/material.dart';
import 'package:humming_sparrow_task/widgets/app_drawer.dart';
import '../widgets/news_list_item.dart';

class Home extends StatefulWidget {
  static final routeName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    mqc = MediaQuery.of(context);
    screenSize = Size(mqc.size.width,
        mqc.size.height - mqc.padding.top - appBar.preferredSize.height);
  }

  MediaQueryData mqc;
  Size screenSize;
  final AppBar appBar = AppBar(
    brightness: Brightness.dark,
    elevation: 0,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Scaffold(
        appBar: appBar,
        drawer: AppDrawer(),
        body: OrientationBuilder(builder: (octx, orientation) {
          return Container(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return NewsListItem(
                  screenSize: screenSize,
                  orientation: orientation,
                  index: index,
                );
              },
              itemCount: 5,
            ),
          );
        }),
      ),
    );
  }
}
