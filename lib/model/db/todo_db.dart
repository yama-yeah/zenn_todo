// For more information on using drift, please see https://drift.simonbinder.eu/docs/getting-started/

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'dart:io';

part 'todo_db.g.dart';

class TodoItem extends Table {
  IntColumn get id => integer().autoIncrement()(); //primary key
  //Enables auto-increment for this column, which will also make this column the primary key of the table.
  //For this reason, you can't use an [autoIncrement] column and also set a custom [Table.primaryKey] on the same table
  //要するに、autoIncrementを使うと、このカラムはテーブルのプライマリキーになるので、他のカラムにautoIncrementを使うことはできない。
  TextColumn get title =>
      text().withDefault(const Constant('')).withLength(min: 1)();
  TextColumn get description => text().withDefault(const Constant(''))();
  //nullable()でnullを許容する
  DateTimeColumn get limitDate => dateTime().nullable()();
  //DateTimeではなく,dateTimeであることに注意
  BoolColumn get isNotify => boolean().withDefault(const Constant(true))();
  //通知するかどうかを真理値で表す
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  // これは、ファイルのロケーションを探すのに使えるLazyDatabase utilを許可します。
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    // ここに、db.sqliteというファイルを、あなたのアプリのドキュメントフォルダに置きます。
    final dbFolder = await getApplicationDocumentsDirectory();
    //Path to a directory where the application may place data that is user-generated, or that cannot otherwise be recreated by your application.
    //データを配置することができるディレクトリのパス。
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [TodoItem])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  //全てのデータ取得
  Future<List<TodoItemData>> readAllTodoData() => select(todoItem).get();
  //SELECT * FROM ToDoItemTable

  //追加
  Future writeTodo(TodoItemCompanion data) => into(todoItem).insert(data);
  //INSERT INTO ToDoItemTable VALUES(id, 'title', 'description', 'limitDate')

  //更新
  Future updateTodo(TodoItemData data) => update(todoItem).replace(data);
  //UPDATE ToDoItemTable SET title = 'title', description = 'description', limitDate = 'limitDate'

  //削除
  Future deleteTodo(int id) =>
      (delete(todoItem)..where((it) => it.id.equals(id))).go();
  //DELETE FROM ToDoItemTable WHERE id = id
}
//細かい使用方法はこの記事を参考に
//https://drift.simonbinder.eu/docs/getting-started/ (公式ドキュメント)
//https://qiita.com/niusounds/items/e4d731af58201ad5fe6f (ちょい古い)