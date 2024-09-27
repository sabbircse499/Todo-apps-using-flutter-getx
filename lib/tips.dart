import 'package:flutter/material.dart';

class TipsTricksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips & Tricks'),
      ),
      body: TipsList(),
    );
  }
}

class TipsList extends StatelessWidget {
  final List<Map<String, String>> tips = [
    {
      "tip": "Use Categories",
      "description": "Organize your tasks by categories to keep them manageable."
    },
    {
      "tip": "Set Deadlines",
      "description": "Assign deadlines to your tasks to prioritize and stay on track."
    },
    {
      "tip": "Recurring Tasks",
      "description": "Use the recurring feature for tasks that you do regularly."
    },
    {
      "tip": "Prioritize Your Tasks",
      "description": "Mark important tasks as high priority to ensure they get done first."
    },
    {
      "tip": "Utilize Notifications",
      "description": "Set up notifications to remind you about upcoming deadlines."
    },
    {
      "tip": "Review Your Day",
      "description": "Take a few minutes each day to review what you've accomplished."
    },
    {
      "tip": "Keep It Simple",
      "description": "Don’t overload your list; keep tasks clear and concise."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tips.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tips[index]["tip"]!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 5),
                Text(tips[index]["description"]!),
              ],
            ),
          ),
        );
      },
    );
  }
}
