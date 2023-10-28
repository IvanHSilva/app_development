import 'package:shared_preferences/shared_preferences.dart';

class TaskListRepository {
  TaskListRepository() {
    SharedPreferences.getInstance().then((value) => sharePref = value);
  }

  late SharedPreferences sharePref;
}
