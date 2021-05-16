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
                children: [
                  Text(
                    News.headline,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    News.headline,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Text(
                            News.date,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                      Container(
                        width: orientation == Orientation.landscape
                            ? screenSize.width * 0.15
                            : screenSize.width * 0.2,
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
                      Icon(Icons.bookmark_outline_rounded),
                      if (orientation == Orientation.landscape)
                        SizedBox(width: screenSize.width * 0.4),
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
