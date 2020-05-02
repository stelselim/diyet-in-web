import 'package:diyetinweb/utilities/urlLaunchers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget socialMediaBar() {
  return Row(
    children: <Widget>[
      IconButton(
        icon: Icon(FontAwesomeIcons.instagram),
        onPressed: () => launchInstagram(),
      ),
      IconButton(
        icon: Icon(FontAwesomeIcons.twitter),
        onPressed: () => launchTwitter(),
      ),
      IconButton(
        icon: Icon(FontAwesomeIcons.facebook),
        onPressed: () => launchFacebook(),
      ),
    ],
  );
}
