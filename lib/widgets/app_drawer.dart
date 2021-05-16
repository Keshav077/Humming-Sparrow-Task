import 'package:flutter/material.dart';
import 'package:humming_sparrow_task/screens/home.dart';
import 'package:humming_sparrow_task/screens/profile.dart';
import 'package:humming_sparrow_task/screens/video.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: EdgeInsets.all(0),
              child: Container(color: Theme.of(context).primaryColor)),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: ListTile(
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, Home.routeName),
                  title: Text("Home"),
                ),
              ),
            ],
          ),
          Divider(
            indent: 10,
            endIndent: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: ListTile(
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, Video.routeName),
                  title: Text("Video"),
                ),
              ),
            ],
          ),
          Divider(
            indent: 10,
            endIndent: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: ListTile(
                  onTap: () => Navigator.pushReplacementNamed(
                      context, Profile.routeName),
                  title: Text("Profile"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
