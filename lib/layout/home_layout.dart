import 'package:bmi_calculater/modules/archiveTasks/archive_tasks.dart';
import 'package:bmi_calculater/modules/doneTasks/done_tasks.dart';
import 'package:bmi_calculater/modules/newTasks/new_tasks.dart';
import 'package:bmi_calculater/shared/components/components.dart';
import 'package:bmi_calculater/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var TitleController = TextEditingController();
  var DateController = TextEditingController();
  var TimeController = TextEditingController();
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.add;
  late Database database;

  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var _formKey = GlobalKey<FormState>();

   int navIndex = 0;

   List<Widget> screens = [
     NewTasks(),
     DoneTasks(),
     ArchivedTasks(),
   ];

   List<String> titles = [
     'New Tasks',
     'Done Tasks',
     'Archived Tasks',
   ];

  // create the database on inital state
  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title:Text(
          titles[navIndex],
          style: TextStyle(),),
        centerTitle: true,
      ),
      backgroundColor: isBottomSheetShown ? Colors.grey: Colors.purple[50],
      body: tasks.length == 0 ? const Center(child: CircularProgressIndicator()) : screens[navIndex],
      floatingActionButton: floutingButton(),
      bottomNavigationBar: bottomNavbar(),
    );
  }

  Widget floutingButton() =>  FloatingActionButton(
    onPressed: () async{
      if(isBottomSheetShown) {
        Navigator.pop(context);
        setState(() {
          fabIcon = Icons.add;
        });
        isBottomSheetShown = false;
      } else {
        _scaffoldKey.currentState?.showBottomSheet((context) => Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Add New Task", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  formField(controller: TitleController,
                    type: TextInputType.text,
                    validate: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Title must not be empty';
                      }
                      return null;
                    },
                    label: 'Task Title',
                    prefixIcon: Icon(Icons.title),
                  ),
                  const SizedBox(height: 20,),
                  formField(controller: DateController,
                    type: TextInputType.datetime,
                    onTap: () {
                      showDatePicker(context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.parse('2022-05-03')).then((value) => DateController.text = DateFormat.yMMMd().format(value!),
                      );
                    },
                    validate: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Date must not be empty';
                      }
                      return null;
                    },
                    label: 'Task Date',
                    prefixIcon: Icon(Icons.date_range),
                  ),
                  const SizedBox(height: 20,),
                  formField(
                    controller: TimeController,
                    type: TextInputType.datetime,
                    onTap: () {
                      showTimePicker(context: context,
                          initialTime: TimeOfDay.now()).then((value) => TimeController.text =  value!.format(context).toString());
                    },
                    validate: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Time must not be empty';
                      }
                      return null;
                    },
                    label: 'Task Time',
                    prefixIcon: Icon(Icons.watch),
                  ),
                  const SizedBox(height: 20,),

                  defaultButton(
                      text: 'Add Task',
                      background: Colors.deepPurple,
                      function: () {
                        if(_formKey.currentState!.validate()) {
                          insertDatabase(
                            title: TitleController.text,
                            date: DateController.text,
                            time: TimeController.text,
                          ).then((value)  {
                            Navigator.pop(context);
                            getDataFromDatabase(database).then((value) {
                              setState(() {fabIcon = Icons.edit;});
                              isBottomSheetShown = false;
                              setState(() {
                                tasks = value;
                              });
                            });
                          });
                        };
                        TitleController.text = '';
                        DateController.text = '';
                        TimeController.text = '';
                      }),
                ],
              ),
            ),
          ),
        )).closed.then((value) {
          setState(() {
            fabIcon = Icons.add;
          });
          isBottomSheetShown = false;
        });
        setState(() {
          fabIcon = Icons.edit;
        });
        isBottomSheetShown = true;
      }
    },

    child: Icon(fabIcon),
  );

  Widget bottomNavbar() =>  SizedBox(
    height: 70,
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      // showSelectedLabels: false,
      currentIndex: navIndex,
      onTap: (index) {
        setState(() {
          navIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Tasks',),
        BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline), label: 'Done'),
        BottomNavigationBarItem(icon: Icon(Icons.archive_outlined), label: 'Archive'),
      ],
    ),
  );

   void createDatabase() async{
     try {
       database = await openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database, version) async{
          await database.execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)'
          );
          print('Database is Created!');
        },
        onOpen: (database) {
          getDataFromDatabase(database).then((value) {
            setState(() {
              tasks = value;
            });
          });
        },
           );
     }  catch (e) {
       print(e);
     }
   }

   Future insertDatabase({required String title, required String date, required String time} ) async{
     try {
        database.transaction((txn) async {
         int id1 = await txn.rawInsert(
             'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "Incomplete")');
         print('inserted: $id1');
       });
     }  catch (e) {
       print(e);
     }
   }

   Future <List<Map>> getDataFromDatabase(database) async{
     return await database.rawQuery('SELECT * FROM tasks');
  }

  void updateDatabase() {}
  void deleteDatabase() {}




}
