import 'package:todo/util/notify/notify.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/sp/notify_setting_sp.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotifySetting extends HookConsumerWidget {
  const NotifySetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = useState(0);

    useEffect(() {
      getNotifySetting().then((value) {
        state.value = value;
        make_notify_all();
      });
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Setting'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: state.value.toString() + '時間前に通知',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onSubmitted: (value) {
              try {
                setNotifySetting(int.parse(value));
                state.value = int.parse(value);
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
    );
  }
}
