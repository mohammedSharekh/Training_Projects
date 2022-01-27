import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
   int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Counter Screen', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: ()=> {
              setState(() {
                number = number - 1;
              })
            }, icon: const Icon(Icons.remove)),
            const SizedBox(width: 40,),
            Text('$number', style: TextStyle(fontSize: 25),),
            const SizedBox(width: 40,),
            IconButton(onPressed: ()=> {
              setState(() {
                number++;
              })
            }, icon: const Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
