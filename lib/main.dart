import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'todo_controller.dart';
import 'splashsreen.dart';
import 'privacy.dart';
import 'CalenderPage.dart';
import 'tips.dart';// Import the calendar page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ToDoController controller = Get.put(ToDoController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: controller.isDarkMode.value
            ? ThemeData.dark()
            : ThemeData.light(), // Toggle between light and dark theme
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => SplashScreen()),
          GetPage(name: '/home', page: () => Home()),
          GetPage(name: '/tips', page: () => TipsTricksPage()),
          GetPage(name: '/calendar', page: () => CalendarPage()), // Calendar page route
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _PageState();
}

class _PageState extends State<Home> {
  final ToDoController controller = Get.find();
  final TextEditingController _searchController = TextEditingController();
  String? searchQuery; // Variable for search query

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do'),
        backgroundColor: Colors.blue,
        actions: [

          IconButton(
            icon: Icon(Icons.calendar_today, color: Colors.white), // Calendar icon
            onPressed: () {
              Get.toNamed('/tips'); // Navigate to Calendar Page
            },
          ),
          IconButton(
            icon: Icon(Icons.calendar_today, color: Colors.white), // Calendar icon
            onPressed: () {
              Get.toNamed('/calendar'); // Navigate to Calendar Page
            },
          ),
          IconButton(
            icon: Icon(
              controller.isDarkMode.value ? Icons.wb_sunny : Icons.nights_stay,
              color: Colors.white,
            ),
            onPressed: () {
              controller.toggleTheme(); // Toggle between dark and light theme
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Fasa To Do\nWrite your feelings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Privacy policy'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => privacypolicy()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Developer info'),
                      content: Text(
                        'I am Mos Bilh, a software engineer specializing in Flutter, Django, and full-stack development. I love creating mobile and web applications!',
                      ),
                      actions: [
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue), // Default border color
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green), // Border when enabled
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red), // Border when focused
                ),
                labelText: 'Search tasks',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      searchQuery = null; // Clear search query
                    });
                  },
                ),
              ),

              onChanged: (value) {
                setState(() {
                  searchQuery = value.isNotEmpty ? value : null; // Update search query
                });
              },
            ),
          ),
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: controller.tos.length,
                itemBuilder: (context, index) {
                  // Filter tasks based on search query
                  if (searchQuery == null ||
                      controller.tos[index].toLowerCase().contains(searchQuery!.toLowerCase())) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green, // Green container for each task
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        title: Text(controller.tos[index], style: TextStyle(color: Colors.white)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.white), // Edit icon
                              onPressed: () {
                                _showUpdateTaskDialog(index); // Show update dialog
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.white), // Delete icon
                              onPressed: () {
                                _deleteTask(index); // Delete task
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return SizedBox.shrink(); // Empty widget
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _showAddTaskDialog(); // Show add task dialog
              },
              child: Text('Add Task'),
            ),
          ),
        ],
      ),
    );
  }

  void showSearchDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Search Tasks'),
          content: TextField(
            controller: _searchController,
            decoration: InputDecoration(hintText: 'Search...'),
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showAddTaskDialog() {
    final TextEditingController taskController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            controller: taskController,
            decoration: InputDecoration(hintText: 'Enter task name'),
          ),
          actions: [
            TextButton(
              child: Text('Add'),
              onPressed: () async {
                String task = taskController.text.trim();
                if (task.isNotEmpty) {
                  await controller.addTodo(task); // Add task to the list and save
                  Navigator.of(context).pop(); // Close the dialog
                }
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  void _showUpdateTaskDialog(int index) {
    final TextEditingController taskController = TextEditingController(text: controller.tos[index]);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Task'),
          content: TextField(
            controller: taskController,
            decoration: InputDecoration(hintText: 'Update task name'),
          ),
          actions: [
            TextButton(
              child: Text('Update'),
              onPressed: () async {
                String updatedTask = taskController.text.trim();
                if (updatedTask.isNotEmpty) {
                  await controller.updateTodoAt(index, updatedTask); // Update the task
                  Navigator.of(context).pop(); // Close the dialog
                }
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteTask(int index) async {
    await controller.removeTodoAt(index); // Remove the task from the list and save
  }
}
