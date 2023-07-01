import 'package:flutter/material.dart';

///1. Create a Flutter project on Task Management.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _myTitle = TextEditingController();
  final TextEditingController _myDescription = TextEditingController();
  final TextEditingController _myDays = TextEditingController();

  List<TaskList> myTaskList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Task Assignment"),
      ),

      ///2. Implement a main screen that displays a list of tasks.
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///6. Display the added tasks in the main screen's list.
                ListTile(
                  ///7. Implement a long press gesture on each task item in the list to open a bottom sheet.
                  onLongPress: () {
                    ///8. The bottom sheet should show the task details along with an option to  delete the task.
                    showDialogBoxWithDelete(context, index);
                  },
                  title: Text(
                    myTaskList[index].title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    myTaskList[index].description,
                    style: const TextStyle(fontSize: 16),
                  ),
                )
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 2,
            );
          },
          itemCount: myTaskList.length),

      ///3. Add a floating action button (FAB) that opens a dialog to add a new task.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ///4. When the user clicks the FAB, display a dialog with text fields
          ///   to input task details such as title, description, and deadline.
          showAddBottomSheet();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // display a dialog with text fields
  void showAddBottomSheet() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Add Task'),
        content: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: _myTitle,
                decoration: const InputDecoration(
                    hintText: "Title", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: _myDescription,
                minLines: 3,
                // any number you need (It works as the rows for the textarea)
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: "Description",
                  label: Text("Description"),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: _myDays,
                decoration: const InputDecoration(
                    hintText: "Days Required", border: OutlineInputBorder()),
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel")),
          ///5. Implement a "Save" button in the dialog to add the new task to the task list.
          ElevatedButton(
              onPressed: () {
                if (_myTitle.text.isNotEmpty &&
                    _myDescription.text.isNotEmpty &&
                    _myDays.text.isNotEmpty) {
                  myTaskList.add(
                    TaskList(_myTitle.text, _myDescription.text, _myDays.text),
                  );
                  if (mounted) {
                    setState(() {});
                  }
                } else {
                  // Show snack bar msg
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.deepOrangeAccent,
                    content: Center(
                      child: Text(
                        'Fields Can Not Be Empty!!',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    duration: Duration(seconds: 3),
                  ));
                }

                _myTitle.clear();
                _myDescription.clear();
                _myDays.clear();
                Navigator.pop(context);
              },
              child: const Text("Save")),
        ],
      ),
    );
  }

  // The bottom sheet should show the task details
  void showDialogBoxWithDelete(context, index) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Task Details:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Title: ${myTaskList[index].title}'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Description: ${myTaskList[index].description}'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Days Required: ${myTaskList[index].deadline}'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ///9. The bottom sheet will always be closed when delete is pressed.
                ElevatedButton(
                  child: const Text('Delete'),
                  onPressed: () => {
                    myTaskList.removeAt(index),
                    setState(() {}),
                    Navigator.pop(context)
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// making a todo tasks type
class TaskList {
  String title, description, deadline;

  TaskList(this.title, this.description, this.deadline);
}
