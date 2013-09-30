part of dartlero_example;

class TaskModel extends ConceptModel {

  static final String task = 'Task';

  Map<String, ConceptEntities> newEntries() {
    var tasks = new Tasks();
    var map = new Map<String, ConceptEntities>();
    map[task] = tasks;
    return map;
  }

  Tasks get tasks => getEntry(task);

  init() {
    var design = new Task();
    design.name = 'Task 1';
    design.done = false;
    tasks.add(design);

    var prototype = new Task();
    prototype.name = 'Task 2';
    design.done = false;
    tasks.add(prototype);

    var production = new Task();
    production.name = 'Task 3';
    design.done = false;
    tasks.add(production);
  }

  display() {
    print('Task Model');
    print('=============');
    tasks.display('Tasks');
    print(
      '============= ============= ============= '
      '============= ============= ============= '
    );
  }

}


