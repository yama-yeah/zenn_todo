import 'package:todo/model/freezed/todo_model.dart';
import 'package:todo/model/db/todo_db.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:drift/drift.dart';

class TodoDatabaseNotifier extends StateNotifier<TodoStateData> {
  //データベースの状態が変わるたびTodoのviewをビルドするようにするクラスです。
  TodoDatabaseNotifier() : super(TodoStateData());
  //ここからはデータベースに関する処理をこのクラスで行えるように記述します。
  final _db = MyDatabase();
  //書き込み処理部分
  writeData(TempTodoItemData data) async {
    if (data.title.isEmpty) {
      return;
    }
    TodoItemCompanion entry = TodoItemCompanion(
      title: Value(data.title),
      description: Value(data.description),
      limitDate: Value(data.limit),
      isNotify: Value(data.isNotify),
    );
    state = state.copyWith(isLoading: true);
    await _db.writeTodo(entry);
    readData();
    //書き込むたびにデータベースを読み込む
  }

  //削除処理部分
  deleteData(TodoItemData data) async {
    state = state.copyWith(isLoading: true);
    await _db.deleteTodo(data.id);
    readData();
    //削除するたびにデータベースを読み込む
  }

  //更新処理部分
  updateData(TodoItemData data) async {
    if (data.title.isEmpty) {
      return;
    }
    state = state.copyWith(isLoading: true);
    await _db.updateTodo(data);
    readData();
    //更新するたびにデータベースを読み込む
  }

  //データ読み込み処理
  readData() async {
    state = state.copyWith(isLoading: true);

    final todoItems = await _db.readAllTodoData();

    state = state.copyWith(
      isLoading: false,
      isReadyData: true,
      todoItems: todoItems,
    );
    //stateを更新します
    //freezedを使っているので、copyWithを使うことができます
    //これは、stateの中身をすべて更新する必要がありません。例えば
    //state.copyWith(isLoading: true)のように一つの値だけを更新することもできます。
    //複数の値を監視したい際、これはとても便利です。
  }
}

final todoDatabaseProvider = StateNotifierProvider((_) {
  TodoDatabaseNotifier notify = TodoDatabaseNotifier();
  notify.readData();
  //初期化処理
  return notify;
});
