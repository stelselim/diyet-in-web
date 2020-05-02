import 'package:url_launcher/url_launcher.dart';

void launchInstagram() async {
  const url = 'https://www.instagram.com/diyetinmobil/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void launchTwitter() async {
  const url = 'https://twitter.com/diyet_in';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void launchFacebook() async {
  const url = 'https://www.facebook.com/Diyet-in-104481034552851/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void launchAppleStore() async {
  const url = 'https://apps.apple.com/us/app/diyet-in/id1498230192';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
void launchGooglePlay() async {
  const url = 'https://play.google.com/store/apps/details?id=com.diyetin.beslenme&hl=tr';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
