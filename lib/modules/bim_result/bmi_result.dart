import "package:flutter/material.dart";

class BmiResultScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const BmiResultScreen({
    required this.result,
    required this.isMale,
    required this.height,
    required this.age,
    required this.weight,
  });

  final double result;
  final bool isMale;
  final double height;
  final int age;
  final int weight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: Icon(Icons.keyboard_arrow_left),
        ),
        elevation: 0,
        toolbarHeight: 80,
        title: const Text("BMI RESULT", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Gender: ${isMale ? "Male" : "Female"}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Age: $age',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Height: ${height.round()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Weight: $weight',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 95,
                ),
                Text(
                  'BMI Result : ${result.round()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
