import 'package:url_launcher/url_launcher.dart';

class phone {
  static void launchPhoneDialer() async {
    const phoneNumber =
        'tel:+1234567890'; // Replace this with the phone number you want to dial
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch phone dialer';
    }
  }
}
