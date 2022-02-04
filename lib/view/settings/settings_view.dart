import 'package:todo/view/settings/notify/notify_setting_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Settings extends HookConsumerWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Card(
        child: ListTile(
          title: Text('Notify Setting'),
          subtitle: Text('何時間前に通知するか設定します'),
          trailing: Icon(Icons.notifications),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return NotifySetting();
            }));
          },
        ),
      ),
    );
  }
}
