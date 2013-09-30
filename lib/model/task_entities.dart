part of dartlero_example;

class Task extends ConceptEntity<Task> {

  String _name;
  bool done;

  String get name => _name;
  set name(String name) {
    _name = name;
    if (code == null) {
      code = name;
    }
  }

  Task newEntity() => new Task();

  Task copy() {
    var Task = super.copy();
    Task.name = name;
    Task.done = done;
    return Task;
  }

  String toString() {
    return '  {\n '
           '    ${super.toString()}, \n '
           '    name: ${name}, \n '
           '    done: ${done}\n'
           '  }';
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    entityMap['name'] = name;
    entityMap['done'] = done;
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    super.fromJson(entityMap);
    name = entityMap['name'];
    done = entityMap['done'];
  }

  int compareTo(Task other) {
    return name.compareTo(other.name);
  }

}

class Tasks extends ConceptEntities<Task> {

  Tasks newEntities() => new Tasks();
  Task newEntity() => new Task();

}
