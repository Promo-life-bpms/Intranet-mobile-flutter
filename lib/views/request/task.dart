/* import 'package:flutter/material.dart';

void main() {
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'To-Do-List', home: TodoList());
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<String> _todoList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();
  String date = "";
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: ListView(
        children:
         _getItems()
          
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(context),
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTodoItem(String title) {
    //Wrapping it inside a set state will notify
    // the app that the state has changed

    setState(() {
      _todoList.add(title);
    });
    _textFieldController.clear();
  }

  //Generate list of item widgets
  Widget _buildTodoItem(String title) {
    return ListTile(
      title: Text(title),
    );
  }

    void _deleteTodoItem(String title) {
    setState(() {
      _todoList.remove(title);
    });
    _textFieldController.clear();
  }


  //Generate a single item widget
  Future<Future> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a task to your List'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Enter task here'),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(_textFieldController.text);
                },
                
              ),
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _todoList) {
      _todoWidgets.add(_buildTodoItem(title));
    }
    return _todoWidgets;
  }
}
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


void main() {
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Datepicker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TaskAppPage(),
    );
  }
}

class TaskAppPage extends StatefulWidget {
  const TaskAppPage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<TaskAppPage> {
  String date = "";
  int maxDays = 5;
  List<String> days = [];

  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Datepicker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            days.length >= maxDays?
              const Center(child: Text("No puedes seleccionar mas dias", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold ),),)
            :
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child:const Text("Choose Date"),
            ),

            Expanded(
              child:  ListView.builder(
                itemCount: days.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.delete),
                      onTap: (){
                        _delete(days, days[index]);
                      },
                      
                      title: Text(days[index])),
                  ); 
                  
                  
                }),
            ),
           
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        String formattedDate = DateFormat('yyyy-MM-dd').format(selected);
        days.add(formattedDate);
        selectedDate = selected;
      });
    }
  }

  _delete(days, selected) async {
    
      setState(() {
        days.remove(selected);
      });
  }
}
