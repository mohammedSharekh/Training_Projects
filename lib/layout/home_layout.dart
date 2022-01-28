import 'package:bmi_calculater/modules/archiveTasks/archive_tasks.dart';
import 'package:bmi_calculater/modules/doneTasks/done_tasks.dart';
import 'package:bmi_calculater/modules/newTasks/new_tasks.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
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
   @override
  void initState() {
    super.initState();
    createDatabase();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title:Text(
          titles[navIndex],
          style: TextStyle(),),
        centerTitle: true,
      ),
      body: screens[navIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          try {
            var name = await getName();
            print(name);
            throw('Some Error');
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: SizedBox(
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
      ),
    );
  }
  Future<String> getName() async{
    return 'Ahmed Mohammed';
  }
   void createDatabase() async{
    var database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async{
        await database.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)'
        );
        print('Database is Created!');
      },
      onOpen: (database) {
        print('Database is Opened!');
      },
    );
   }
   void insertDatabase() {}
   void updateDatabase() {}
   void deleteDatabase() {}
}
