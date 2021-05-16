import 'package:flutter/material.dart';
import '../model/news.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({
    Key key,
    @required this.screenSize,
    @required this.orientation,
    @required this.index,
  }) : super(key: key);

  final int index;
  final Size screenSize;
  final Orientation orientation;
  // final TextStyle textStyle = const TextStyle(
  //   fontSize: 15,
  //   color: Colors.grey,
  // );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      // color: Colors.red,
      height: orientation == Orientation.landscape
          ? screenSize.height * 0.35
          : screenSize.height * 0.15,
      width: screenSize.width,
      child: Row(
        children: [
          Container(
            width: orientation == Orientation.landscape
                ? screenSize.height * 0.35
                : screenSize.height * 0.15,
            height: orientation == Orientation.landscape
                ? screenSize.height * 0.35
                : screenSize.height * 0.15,
            decoration: BoxDecoration(
              // color: Theme.of(context).primaryColor,
              image: DecorationImage(
                image: NetworkImage(News.imageUrl[index]),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    News.headline,
                    maxLines: screenSize.height < 700 ? 1 : 2,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  // SizedBox(
                  //   height: screenSize.height < 900 ? 4 : 10,
                  // ),
                  Text(
                    News.headline,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  // SizedBox(
                  //   height: screenSize.height < 700
                  //       ? 5
                  //       : screenSize.height < 900
                  //           ? 9
                  //           : 14,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            color: Colors.grey,
                            size: screenSize.height < 700 ? 17 : 20,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            News.date,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .fontSize),
                          ),
                        ],
                      ),
                      Container(
                        width: orientation == Orientation.landscape
                            ? screenSize.width * 0.15
                            : screenSize.width * 0.18,
                        height: orientation == Orientation.landscape
                            ? screenSize.height * 0.05
                            : screenSize.height * 0.02,
                        decoration: BoxDecoration(
                            color: Colors.orange[700],
                            borderRadius: BorderRadius.circular(2)),
                        alignment: Alignment.center,
                        child: Text(
                          News.category,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        Icons.bookmark_outline_rounded,
                        size: screenSize.height < 700 ? 17 : 22,
                      ),
                      if (orientation == Orientation.landscape)
                        SizedBox(width: screenSize.width * 0.3),
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
