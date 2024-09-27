import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoController extends GetxController {
  var tos = <String>[].obs; // Observable list of to-do items
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTodos(); // Load existing to-dos from Shared Preferences
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  // Load to-dos from Shared Preferences
  Future<void> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    tos.value = prefs.getStringList('tos') ?? [];
  }

  // Add a new to-do item
  Future<void> addTodo(String title) async {
    tos.add(title);
    await saveTodos();
  }

  // Remove a to-do item
  Future<void> removeTodoAt(int index) async {
    tos.removeAt(index);
    await saveTodos();
  }

  // Update a to-do item
  Future<void> updateTodoAt(int index, String newTitle) async {
    tos[index] = newTitle;
    await saveTodos();
  }

  // Save to-dos to Shared Preferences
  Future<void> saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('tos', tos);
  }
}
