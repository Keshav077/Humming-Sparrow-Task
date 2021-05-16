import 'package:flutter/material.dart';
import 'package:humming_sparrow_task/widgets/app_drawer.dart';

class Profile extends StatefulWidget {
  static final routeName = '/profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenSize = Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            appBar.preferredSize.height);
  }

  Size screenSize;
  final AppBar appBar = AppBar(
    brightness: Brightness.dark,
    elevation: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: AppDrawer(),
      body: OrientationBuilder(
        builder: (ctx, orientation) {
          return Container(
            height: screenSize.height,
            width: screenSize.width,
            child: orientation == Orientation.landscape
                ? Row(
                    children: [
                      buildProfilePicContainer(orientation),
                      buildProfileDetailsContainer(orientation),
                    ],
                  )
                : Column(
                    children: [
                      buildProfilePicContainer(orientation),
                      buildProfileDetailsContainer(orientation),
                    ],
                  ),
          );
        },
      ),
    );
  }

  Container buildProfilePicContainer(Orientation orientation) {
    return Container(
      height: orientation == Orientation.landscape
          ? screenSize.height
          : screenSize.height * 0.35,
      width: orientation == Orientation.landscape
          ? screenSize.width * 0.4
          : screenSize.width,
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: orientation == Orientation.landscape
                ? screenSize.height * 0.45
                : screenSize.height * 0.18,
            width: orientation == Orientation.landscape
                ? screenSize.height * 0.45
                : screenSize.height * 0.18,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQt-F5GQg8qB2fWquF1ltQvAT2Z8Dv5pJLb9w&usqp=CAU"),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
              border: Border.all(width: 4, color: Colors.orange[800]),
              // color: Colors.red,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Dinesh yaduvanshi",
            style: TextStyle(color: Colors.orange[700], fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Edit Profile"),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(1),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              foregroundColor: MaterialStateProperty.all(Colors.orange[600]),
            ),
          ),
        ],
      ),
    );
  }

  Container buildProfileDetailsContainer(Orientation orientation) {
    return Container(
      height: orientation == Orientation.landscape
          ? screenSize.height
          : screenSize.height * 0.65,
      width: orientation == Orientation.landscape
          ? screenSize.width * 0.6
          : screenSize.width,
      child: ListView(
        children: [
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          buildTextField(
            "Location",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            2,
          ),
          buildTextField(
            "Pincode",
            "xxxxx",
            1,
          ),
          buildTextField(
            "Date of Birth",
            "dd-mm-yy",
            1,
          ),
          buildTextField(
            "Whatsapp",
            "+91-xxxxxxxxxx",
            1,
          ),
          buildTextField(
            "Email",
            "xxxxxxxxxxx@gmail.com",
            1,
          ),
        ],
      ),
    );
  }

  Container buildTextField(String label, String value, int maxLines) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.01,
          horizontal: screenSize.width * 0.1),
      child: TextField(
        readOnly: true,
        maxLines: maxLines,
        controller: TextEditingController(text: value),
        decoration: InputDecoration(
          border: label == "Email" ? InputBorder.none : null,
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
