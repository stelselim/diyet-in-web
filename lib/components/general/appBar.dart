import 'package:diyetinweb/utilities/urlLaunchers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget appBarWidget({BuildContext context, @required String title}) {
  double width = MediaQuery.of(context).size.width;
  String assetImage = "assets/icon.png";

  if (width < 620) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GestureDetector(
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            backgroundImage: AssetImage(assetImage),
          ),
          onTap: () {
            Navigator.of(context).pushNamed("/");
          },
        ),
      ),
      title: GestureDetector(
        child: Text(
          'Diyet-in',
          style: smallAppBarHeaderTextStyle,
        ),
        onTap: () => Navigator.of(context).pushNamed("/"),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            FontAwesomeIcons.instagram,
            size: 20,
          ),
          onPressed: () => launchInstagram(),
        ),
        IconButton(
            icon: Icon(FontAwesomeIcons.appStore, size: 20),
            onPressed: () => launchAppleStore()),
        IconButton(
          icon: Icon(FontAwesomeIcons.googlePlay, size: 20),
          onPressed: () => launchGooglePlay(),
        ),
        PopupMenuButton(
          child: Icon(
            Icons.dehaze,
            size: 25,
          ),
          onSelected: (value) {
            if (value == 'Blog') Navigator.pushNamed(context, '/Blog');
            if (value == 'Tarif') Navigator.pushNamed(context, '/Recipe');
            if (value == 'SSS') Navigator.pushNamed(context, '/FAQ');
            if (value == 'Hakkımızda') Navigator.pushNamed(context, '/About');
          },
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: ListTile(
                  title: Text('Blog'),
                ),
                value: 'Blog',
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text('Tarifler'),
                ),
                value: 'Tarif',
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text('SSS'),
                ),
                value: 'SSS',
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text('Hakkımızda'),
                ),
                value: 'Hakkımızda',
              ),
            ];
          },
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  } else {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed("/"),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            backgroundImage: AssetImage(
              assetImage,
            ),
          ),
        ),
      ),
      title: FlatButton(
        onPressed: () => Navigator.of(context).pushNamed("/"),
        child: MediaQuery.of(context).size.width > 745
            ? Text(
                'Diyet-in',
                style: appBarHeaderTextStyle,
              )
            : null,
      ),
      actionsIconTheme: IconThemeData(size: 18),
      actions: <Widget>[
        FlatButton(
          colorBrightness: Brightness.light,
          child: Text(
            'Blog',
            style: buttonTextStyle,
          ),
          onPressed: () => Navigator.pushNamed(context, '/Blog'),
        ),
        FlatButton(
          colorBrightness: Brightness.light,
          child: Text(
            'Tarifler',
            style: buttonTextStyle,
          ),
          onPressed: () => Navigator.pushNamed(context, '/Recipe'),
        ),
        FlatButton(
          colorBrightness: Brightness.light,
          child: Text(
            'SSS',
            style: buttonTextStyle,
          ),
          onPressed: () => Navigator.pushNamed(context, '/FAQ'),
        ),
        FlatButton(
          colorBrightness: Brightness.light,
          child: Text(
            'Hakkımızda',
            style: buttonTextStyle,
          ),
          onPressed: () => Navigator.pushNamed(context, '/About'),
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.instagram),
          onPressed: () => launchInstagram(),
        ),
        IconButton(
            icon: Icon(FontAwesomeIcons.appStore),
            onPressed: () => launchAppleStore()),
        IconButton(
          icon: Icon(FontAwesomeIcons.googlePlay),
          onPressed: () => launchGooglePlay(),
        ),
      ],
    );
  }
}

final appBarHeaderTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: Colors.blueGrey.shade700,
  fontSize: 25,
);
final buttonTextStyle = TextStyle(
  color: Colors.black54,
  fontSize: 18,
  fontWeight: FontWeight.w400,
);

final smallAppBarHeaderTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: Colors.blueGrey.shade700,
  fontSize: 18,
);
