import 'package:diyetinweb/utilities/urlLaunchers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

<<<<<<< HEAD
Widget appBarWidget({@required String title}) {
  return AppBar(
    title: Text('Diyet-in'),
  );
  
=======
Widget appBarWidget({BuildContext context, @required String title}) {
  double width = MediaQuery.of(context).size.width;
  String urlOfIcon =
      "https://lh3.googleusercontent.com/i1hhu2Y_zw5o3jER8H7llvhkCID3Lw05fQ8G8sbNE1LyK-WKzuo3K0ux9Re-fVPGORQ=s360-rw";

  if (width < 620) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
              urlOfIcon,
              scale: 1.2,
            ),
            radius: 50,
          ),
          onTap: () {
            Navigator.of(context).pushNamed("/");
            print('Hey');
          },
        ),
      ),
      title: GestureDetector(
        child: Text(
          'Diyet-in',
          style: appBarHeaderTextStyle,
        ),
        onTap: () => Navigator.of(context).pushNamed("/"),
      ),
      actionsIconTheme: IconThemeData(size: 18),
      actions: <Widget>[
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
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: PopupMenuButton(
            child: Icon(
              Icons.dehaze,
              size: 24,
            ),
            onSelected: (value) {
              if (value == 'Blog') Navigator.pushNamed(context, '/Blog');
              if (value == 'Tarif') Navigator.pushNamed(context, '/Recipe');
              if (value == 'SSS')  Navigator.pushNamed(context, '/FAQ');
              if (value == 'Hakkımızda')  Navigator.pushNamed(context, '/About');
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
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed("/"),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
              urlOfIcon,
            ),
          ),
        ),
      ),
      title: FlatButton(
        onPressed: () => Navigator.of(context).pushNamed("/"),
        child: 
        MediaQuery.of(context).size.width>745?
        Text(
          'Diyet-in',
          style: appBarHeaderTextStyle,
        )
        :
        null
        ,
      ),
      actionsIconTheme: IconThemeData(size: 18),
      actions: <Widget>[
        FlatButton(
          colorBrightness: Brightness.light,
          child: Text(
            'Blog',
            style: buttonTextStyle,
          ),
          onPressed: () =>  Navigator.pushNamed(context, '/Blog'),
        ),
        FlatButton(
          colorBrightness: Brightness.light,
          child: Text(
            'Tarifler',
            style: buttonTextStyle,
          ),
          onPressed: ()=> Navigator.pushNamed(context, '/Recipe'),
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
          onPressed: ()=> Navigator.pushNamed(context, '/About'),
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
>>>>>>> components
}

final appBarHeaderTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w500,
);
final buttonTextStyle = TextStyle(
  color: Colors.black54,
  fontSize: 18,
  fontWeight: FontWeight.w400,
);
