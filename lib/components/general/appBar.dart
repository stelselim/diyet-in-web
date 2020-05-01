import 'package:diyetinweb/utilities/urlLaunchers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


Widget appBarWidget({BuildContext context, @required String title}) {
  double width = MediaQuery.of(context).size.width;
  String urlOfIcon =
      "https://lh3.googleusercontent.com/i1hhu2Y_zw5o3jER8H7llvhkCID3Lw05fQ8G8sbNE1LyK-WKzuo3K0ux9Re-fVPGORQ=s360-rw";

  if (width < 600) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
            urlOfIcon,
            scale: 1.2,
          ),
          radius: 50,
        ),
      ),
      title: Text(
        'Diyet-in',
        style: appBarHeaderTextStyle,
      ),
      actionsIconTheme: IconThemeData(size: 18),
      actions: <Widget>[
        IconButton(
          icon: Icon(FontAwesomeIcons.instagram),
          onPressed: () =>launchInstagram(),
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.facebook),
          onPressed: () => launchFacebook()
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.twitter),
          onPressed: ()=> launchTwitter(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: PopupMenuButton(
            child: Icon(Icons.dehaze),
            onSelected: (value) {
              if (value == 'Blog') print('Go Blog');
              if (value == 'Tarifler') print('Go Tarif');
              if (value == 'SSS') print('Go SSS');
              if (value == 'Hakkımızda') print('Go about');
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
        ),
      ],
    );
  } else {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
            urlOfIcon,
            scale: 1.2,
          ),
          radius: 50,
        ),
      ),
      title: Text(
        'Diyet-in',
        style: appBarHeaderTextStyle,
      ),
      actionsIconTheme: IconThemeData(size: 18),
      actions: <Widget>[
        FlatButton(
          colorBrightness: Brightness.light,
          child: Text(
            'Blog',
            style: buttonTextStyle,
          ),
          onPressed: () {},
        ),
        FlatButton(
          colorBrightness: Brightness.light,
          child: Text(
            'Tarifler',
            style: buttonTextStyle,
          ),
          onPressed: () {},
        ),
        FlatButton(
          colorBrightness: Brightness.light,
          child: Text(
            'SSS',
            style: buttonTextStyle,
          ),
          onPressed: () {},
        ),
        FlatButton(
          colorBrightness: Brightness.light,
          child: Text(
            'Hakkımızda',
            style: buttonTextStyle,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.instagram),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.facebook),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.twitter),
          onPressed: () {},
        ),
      ],
    );
  }
}

final appBarHeaderTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w500,
);
final buttonTextStyle = TextStyle(
  color: Colors.black54,
  fontSize: 18,
  fontWeight: FontWeight.w400
);
