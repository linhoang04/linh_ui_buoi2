import 'dart:async';
import 'dart:math';

import 'package:rebuildbloc/base/base_bloc.dart';
import 'package:rebuildbloc/base/base_even.dart';
import 'package:rebuildbloc/event/add_screan_event.dart';
import 'package:rebuildbloc/event/delete_screan_event.dart';
import 'package:rebuildbloc/model/todo.dart';

class ScreanBloc extends BaseBloc {
  StreamController<List<Todo>> _baseBlocController =
      StreamController<List<Todo>>();
  Stream<List<Todo>> get listUser => _baseBlocController.stream;
  var _random = Random();
  List<Todo> _listus = [];
  _addTodo(Todo context) {
    _listus.add(context);
    _baseBlocController.sink.add(_listus);
  }

  _deleteTodo(Todo context) {
    _listus.remove(context);
    _baseBlocController.sink.add(_listus);
  }

  @override
  void dispatevent(BaseEven even) {
    if (even is AddScreanEvent) {
      Todo todo = Todo.fromData(_random.nextInt(100), even.content);
      _addTodo(todo);
    } else if (even is DeleteScreanEvents) {
      _deleteTodo(even.todo);
    }
  }

  @override
  void dispose() {
    _baseBlocController.close();
  }
}
