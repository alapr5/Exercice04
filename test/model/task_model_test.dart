import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:dartlero_example/dartlero_example.dart';

testTasks(Tasks tasks) {
  group("Testing Tasks", () {
    setUp(() {
      var taskCount = 0;
      expect(tasks.length, equals(taskCount));

      var design = new Task();
      expect(design, isNotNull);
      design.name = 'Task 1';
      design.done = false;
      tasks.add(design);
      expect(tasks.length, equals(++taskCount));

      var prototype = new Task();
      expect(prototype, isNotNull);
      prototype.name = 'Task 2';
      prototype.done = false;
      tasks.add(prototype);
      expect(tasks.length, equals(++taskCount));

      var production = new Task();
      expect(production, isNotNull);
      production.name = 'Task 3';
      production.done = false;
      tasks.add(production);
      expect(tasks.length, equals(++taskCount));

      //tasks.display('Tasks');
    });
    tearDown(() {
      tasks.clear();
      expect(tasks.isEmpty, isTrue);
    });
    test('Add Task', () {
      var task = new Task();
      expect(task, isNotNull);
      var added = tasks.add(task);
      expect(added, isTrue);
      tasks.display('Add Task');
    });
    test('Add Task Without Data', () {
      var taskCount = tasks.length;
      var task = new Task();
      expect(task, isNotNull);
      var added = tasks.add(task);
      expect(added, isTrue);
      tasks.display('Add Task Without Data');
    });
    test('Add Task Not Unique', () {
      var taskCount = tasks.length;
      var task = new Task();
      expect(task, isNotNull);
      task.name = 'Task 1';
      var added = tasks.add(task);
      expect(added, isFalse);
      tasks.display('Add Task Not Unique');
    });
    test('Find Task by Name', () {
      var searchName = 'Task 1';
      var task = tasks.find(searchName);
      expect(task, isNotNull);
      expect(task.name, equals(searchName));
      task.display('Find Task by Name');
    });
    test('Order Tasks by Name', () {
      tasks.orderByFunction((m,n) => m.compareTo(n));
      tasks.display('Order Tasks by Name');
    });
    test('New Task', () {
      var taskCount = tasks.length;
      var marketing = new Task();
      expect(marketing, isNotNull);
      marketing.name = 'Task 5';
      marketing.done = true;
      var added = tasks.add(marketing);
      expect(added, isTrue);
      expect(tasks.length, equals(++taskCount));
      tasks.display('New Task');
    });
    test('Copy Tasks', () {
      Tasks copiedTasks = tasks.copy();
      expect(copiedTasks.isEmpty, isFalse);
      expect(copiedTasks.length, equals(tasks.length));
      expect(copiedTasks, isNot(same(tasks)));
      expect(copiedTasks, isNot(equals(tasks)));
      copiedTasks.forEach((cp) =>
          expect(cp, isNot(same(tasks.find(cp.name)))));
      copiedTasks.display('Copied Tasks');
      //tasks.display('Tasks');
    });
    test('From Tasks to JSON', () {
      var json = tasks.toJson();
      expect(json, isNotNull);
      print(json);
    });
    test('From JSON to Task Model', () {
      List<Map<String, Object>> json = tasks.toJson();
      tasks.clear();
      expect(tasks.isEmpty, isTrue);
      tasks.fromJson(json);
      expect(tasks.isEmpty, isFalse);
      tasks.display('From JSON to Tasks');
    });
  });
}

initDisplayModel() {
  TaskModel taskModel = new TaskModel();
  taskModel.init();
  taskModel.display();
}

testModel() {
  TaskModel taskModel = new TaskModel();
  Tasks tasks = taskModel.tasks;
  testTasks(tasks);
}

main() {
  //initDisplayModel();
  testModel();
}
