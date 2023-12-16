import 'package:rebuildbloc/base/base_even.dart';
import 'package:rebuildbloc/model/todo.dart';

class DeleteScreanEvents extends BaseEven {
  Todo todo;
  DeleteScreanEvents(this.todo);
}
