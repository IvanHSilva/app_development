import 'dart:convert';

import 'package:app_development/app02/models/tasklist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskListRepository {
  TaskListRepository() {
    SharedPreferences.getInstance().then((value) => sharePref = value);
  }

  late SharedPreferences sharePref;

  void saveTaskList(List<TaskList> tasks) {
    final String jsonText = json.encode(tasks);
    sharePref.setString('tasklist', jsonText);
    //print(jsonText);
  }
}
