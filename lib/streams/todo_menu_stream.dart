import 'package:rxdart/rxdart.dart';class TodoMenuStream {  final _todoGroupsController = BehaviorSubject<List<String>>.seeded([]);  final _showTextFieldController = BehaviorSubject<bool>.seeded(false);  Stream<List<String>> get todoGroups => _todoGroupsController.stream;  Stream<bool> get showTextField => _showTextFieldController.stream;  void addTodoGroup(String item) {    final currentItems = _todoGroupsController.value;    _todoGroupsController.add([...currentItems, item]);    toggleTextField(false);  }  void toggleTextField(bool show) {    _showTextFieldController.add(show);  }  void dispose() {    _todoGroupsController.close();    _showTextFieldController.close();  }}