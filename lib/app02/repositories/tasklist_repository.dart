import 'dart:convert';

import 'package:app_development/app02/models/tasklist.dart';
import 'package:shared_preferences/shared_preferences.dart';

const taskListKey = 'tasklist';

class TaskListRepository {
  //
  late SharedPreferences sharePref;

  Future<List<TaskList>> loadTaskList() async {
    //
    sharePref = await SharedPreferences.getInstance();
    final String jsonText = sharePref.getString(taskListKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonText) as List;
    return jsonDecoded.map((e) => TaskList.fromJson(e)).toList();
  }

  void saveTaskList(List<TaskList> tasks) {
    //
    final String jsonText = json.encode(tasks);
    sharePref.setString(taskListKey, jsonText);
    //print(jsonText);
  }
}
