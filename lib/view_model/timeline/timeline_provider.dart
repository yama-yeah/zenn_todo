import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/model/db/todo_db.dart';

class TimelineDataNotifier extends StateNotifier<List<TodoItemData>> {
  TimelineDataNotifier() : super([]);

  Future<List<TodoItemData>> read() async {
    final db = MyDatabase();
    List<TodoItemData> datas = await db.readAllTodoData();
    return datas;
  }

  void makeLimitList(DateTime now) async {
    List<TodoItemData> list = [];
    List<TodoItemData> datas = await read();
    for (TodoItemData data in datas) {
      if (data.limitDate == null) {
        continue;
      }
      if (data.limitDate!.difference(now).inDays == 0) {
        list.add(data);
      }
      list.sort((a, b) => a.limitDate!.compareTo(b.limitDate!));
      state = list;
    }
  }
}

final timelineDataProvider =
    StateNotifierProvider((ref) => TimelineDataNotifier());
