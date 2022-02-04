import 'package:flutter/material.dart';
import 'package:todo/model/db/todo_db.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/view_model/timeline/timeline_provider.dart';
import 'package:intl/intl.dart';

class TimeLine extends HookConsumerWidget {
  const TimeLine({Key? key}) : super(key: key);

  List<Widget> makeTimeLine(
    List<TodoItemData> todoitems,
  ) {
    //追加
    List<Widget> timeline = [];
    for (int i = 0; i < todoitems.length; i++) {
      Widget tile = TimelineTile(
        endChild: Card(
          child: ListTile(
            title: Text(todoitems[i].title),
            subtitle: Text(DateFormat('HH:mm').format(todoitems[i].limitDate!)),
          ),
        ),
        isFirst: i == 0,
        isLast: i == todoitems.length - 1,
      );
      timeline.add(tile);
    }
    return timeline;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timelineState = ref.watch(timelineDataProvider);
    final timelineProvider = ref.watch(timelineDataProvider.notifier);
    final datas = timelineProvider.state;
    //追加

    useEffect(() {
      timelineProvider.makeLimitList(DateTime.now());
    }, datas); //追加

    List<Widget> timelineTiles = makeTimeLine(
      timelineProvider.state,
    ); //追加
    //List<Widget> timelineTiles = [];
    return Scaffold(
      body: Center(
        child: ListView(
          children: timelineTiles,
        ),
      ),
    );
  }
}
