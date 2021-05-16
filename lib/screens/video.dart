import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:humming_sparrow_task/model/news.dart';
import 'package:humming_sparrow_task/widgets/app_drawer.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  static final routeName = '/video';

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  VideoPlayerController _controller;
  final AppBar appBar = AppBar(
    brightness: Brightness.dark,
    elevation: 0,
  );
  TextStyle textStyle;
  Size screenSize;
  MediaQueryData mqc;
  int maxLines = 2;
  bool isInit = true;

  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      mqc = MediaQuery.of(context);
      screenSize = Size(mqc.size.width,
          mqc.size.height - appBar.preferredSize.height - mqc.padding.top);
      textStyle = TextStyle(
        color: Colors.grey,
        fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
      );
      _controller.setLooping(true);

      isInit = false;
    }
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          SystemChrome.setEnabledSystemUIOverlays([]);
        } else {
          SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        }
        return orientation == Orientation.landscape
            ? Scaffold(
                backgroundColor: Colors.black,
                body: Center(
                  child: buildBasicVideoPlayer(),
                ),
              )
            : Scaffold(
                appBar: appBar,
                drawer: AppDrawer(),
                body: Container(
                  child: Column(
                    children: [
                      Container(
                        height: appBar.preferredSize.height,
                        width: double.maxFinite,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, -2),
                                spreadRadius: 2,
                                blurRadius: 1,
                                color: Colors.black12)
                          ],
                          color: Colors.white,
                        ),
                        child: Text(
                          "Videos",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _controller.value.isInitialized
                          ? buildBasicVideoPlayer()
                          : Container(
                              color: Colors.black,
                              height: screenSize.width * 0.5,
                              width: screenSize.width,
                            ),
                      Expanded(
                        child: ListView(
                          children: [
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(screenSize.width * 0.06),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    News.headline,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.005,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Date & Time Here",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              .fontSize,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.01,
                                  ),
                                  Text(
                                    News.discription,
                                    maxLines: maxLines,
                                    style: textStyle,
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.03,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        maxLines == 2
                                            ? maxLines = 10
                                            : maxLines = 2;
                                      });
                                    },
                                    child: Text("Information"),
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          if (states.contains(
                                              MaterialState.pressed)) return 3;
                                          return 5;
                                        }),
                                        foregroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          if (states
                                              .contains(MaterialState.pressed))
                                            return Colors.white;
                                          return Colors.black;
                                        }),
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          if (states
                                              .contains(MaterialState.pressed))
                                            return Theme.of(context)
                                                .primaryColor;
                                          return Colors.grey[100];
                                        }),
                                        minimumSize: MaterialStateProperty.all(
                                            Size(double.infinity, 50))),
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                  ...[
                                    "https://wallpaperaccess.com/full/1912279.jpg",
                                    "https://static.theprint.in/wp-content/uploads/2019/10/Farming-in-India.jpg",
                                    "https://images.unsplash.com/photo-1560493676-04071c5f467b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YWdyaWN1bHR1cmV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
                                  ].map(
                                    (e) {
                                      return VideoSuggestionItem(
                                          screenSize: screenSize,
                                          textStyle: textStyle,
                                          imageUrl: e);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }

  InkWell buildBasicVideoPlayer() {
    return InkWell(
      onTap: () {
        setState(() {
          _visible = !_visible;
          if (_controller.value.isPlaying)
            _controller.pause();
          else
            _controller.play();
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: VideoPlayer(_controller),
          ),
          AnimatedOpacity(
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 200),
            opacity: _visible ? 1 : 0,
            child: Icon(
              Icons.play_arrow_rounded,
              size: 100,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class VideoSuggestionItem extends StatelessWidget {
  const VideoSuggestionItem({
    Key key,
    @required this.screenSize,
    @required this.textStyle,
    @required this.imageUrl,
  }) : super(key: key);

  final Size screenSize;
  final TextStyle textStyle;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height * 0.1,
      // color: Colors.red,
      margin: EdgeInsets.symmetric(
        vertical: screenSize.height * 0.015,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(left: screenSize.width * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    News.headline,
                    style: Theme.of(context).textTheme.headline6,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            color: Colors.grey[400],
                            size: 20,
                          ),
                          SizedBox(
                            width: screenSize.height * 0.006,
                          ),
                          Text(
                            "03-03-2021",
                            style: textStyle,
                          )
                        ],
                      ),
                      SizedBox(
                        width: screenSize.width * 0.04,
                      ),
                      Container(
                        width: screenSize.width * 0.2,
                        height: screenSize.height * 0.02,
                        decoration: BoxDecoration(
                            color: Colors.orange[700],
                            borderRadius: BorderRadius.circular(2)),
                        alignment: Alignment.center,
                        child: Text(
                          "Info",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
