// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class TodoItemData extends DataClass implements Insertable<TodoItemData> {
  final int id;
  final String title;
  final String description;
  final DateTime? limitDate;
  final bool isNotify;
  TodoItemData(
      {required this.id,
      required this.title,
      required this.description,
      this.limitDate,
      required this.isNotify});
  factory TodoItemData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TodoItemData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      limitDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}limit_date']),
      isNotify: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_notify'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || limitDate != null) {
      map['limit_date'] = Variable<DateTime?>(limitDate);
    }
    map['is_notify'] = Variable<bool>(isNotify);
    return map;
  }

  TodoItemCompanion toCompanion(bool nullToAbsent) {
    return TodoItemCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      limitDate: limitDate == null && nullToAbsent
          ? const Value.absent()
          : Value(limitDate),
      isNotify: Value(isNotify),
    );
  }

  factory TodoItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoItemData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      limitDate: serializer.fromJson<DateTime?>(json['limitDate']),
      isNotify: serializer.fromJson<bool>(json['isNotify']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'limitDate': serializer.toJson<DateTime?>(limitDate),
      'isNotify': serializer.toJson<bool>(isNotify),
    };
  }

  TodoItemData copyWith(
          {int? id,
          String? title,
          String? description,
          DateTime? limitDate,
          bool? isNotify}) =>
      TodoItemData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        limitDate: limitDate ?? this.limitDate,
        isNotify: isNotify ?? this.isNotify,
      );
  @override
  String toString() {
    return (StringBuffer('TodoItemData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('limitDate: $limitDate, ')
          ..write('isNotify: $isNotify')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, limitDate, isNotify);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoItemData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.limitDate == this.limitDate &&
          other.isNotify == this.isNotify);
}

class TodoItemCompanion extends UpdateCompanion<TodoItemData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime?> limitDate;
  final Value<bool> isNotify;
  const TodoItemCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.limitDate = const Value.absent(),
    this.isNotify = const Value.absent(),
  });
  TodoItemCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.limitDate = const Value.absent(),
    this.isNotify = const Value.absent(),
  });
  static Insertable<TodoItemData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime?>? limitDate,
    Expression<bool>? isNotify,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (limitDate != null) 'limit_date': limitDate,
      if (isNotify != null) 'is_notify': isNotify,
    });
  }

  TodoItemCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<DateTime?>? limitDate,
      Value<bool>? isNotify}) {
    return TodoItemCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      limitDate: limitDate ?? this.limitDate,
      isNotify: isNotify ?? this.isNotify,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (limitDate.present) {
      map['limit_date'] = Variable<DateTime?>(limitDate.value);
    }
    if (isNotify.present) {
      map['is_notify'] = Variable<bool>(isNotify.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoItemCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('limitDate: $limitDate, ')
          ..write('isNotify: $isNotify')
          ..write(')'))
        .toString();
  }
}

class $TodoItemTable extends TodoItem
    with TableInfo<$TodoItemTable, TodoItemData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TodoItemTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title =
      GeneratedColumn<String?>('title', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 1,
          ),
          type: const StringType(),
          requiredDuringInsert: false,
          defaultValue: const Constant(''));
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _limitDateMeta = const VerificationMeta('limitDate');
  @override
  late final GeneratedColumn<DateTime?> limitDate = GeneratedColumn<DateTime?>(
      'limit_date', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _isNotifyMeta = const VerificationMeta('isNotify');
  @override
  late final GeneratedColumn<bool?> isNotify = GeneratedColumn<bool?>(
      'is_notify', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_notify IN (0, 1))',
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, limitDate, isNotify];
  @override
  String get aliasedName => _alias ?? 'todo_item';
  @override
  String get actualTableName => 'todo_item';
  @override
  VerificationContext validateIntegrity(Insertable<TodoItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('limit_date')) {
      context.handle(_limitDateMeta,
          limitDate.isAcceptableOrUnknown(data['limit_date']!, _limitDateMeta));
    }
    if (data.containsKey('is_notify')) {
      context.handle(_isNotifyMeta,
          isNotify.isAcceptableOrUnknown(data['is_notify']!, _isNotifyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TodoItemData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TodoItemTable createAlias(String alias) {
    return $TodoItemTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TodoItemTable todoItem = $TodoItemTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todoItem];
}
