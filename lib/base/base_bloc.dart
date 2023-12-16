import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rebuildbloc/base/base_even.dart';
import 'package:rebuildbloc/model/todo.dart';

class BaseBloc {
  StreamController<BaseEven> _eventsController = StreamController();
  Sink<BaseEven> get even => _eventsController.sink;
  BaseBloc() {
    _eventsController.stream.listen((event) {
      if (event is! BaseEven) {
        throw Exception('Even không hợp lệ');
      }
      dispatevent(event);
    });
  }
  void dispatevent(BaseEven even) {}
  @mustCallSuper
  void dispose() {
    _eventsController.close();
  }
}
