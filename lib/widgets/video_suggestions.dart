import 'package:flutter/material.dart';
import 'package:humming_sparrow_task/model/news.dart';

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
                    style: Theme.of(context).textTheme.headline5,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.012,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            color: Colors.grey[400],
                            size: screenSize.height < 700 ? 15 : 22,
                          ),
                          SizedBox(
                            width: screenSize.height * 0.006,
                          ),
                          Text(
                            "03-03-2021",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: screenSize.height < 900 ? 12 : 15),
                          )
                        ],
                      ),
                      SizedBox(
                        width: screenSize.width * 0.03,
                      ),
                      Container(
                        width: screenSize.width * 0.2,
                        height: screenSize.height * 0.024,
                        decoration: BoxDecoration(
                          color: Colors.orange[700],
                          borderRadius: BorderRadius.circular(2),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Info",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
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
