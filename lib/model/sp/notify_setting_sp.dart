import 'package:shared_preferences/shared_preferences.dart';

Future<int> getNotifySetting() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getInt('notifySetting') != null) {
    return prefs.getInt('notifySetting')!;
  } else {
    prefs.setInt('notifySetting', 3);
    return 3;
  }
}

Future<void> setNotifySetting(int setting) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('notifySetting', setting);
}
