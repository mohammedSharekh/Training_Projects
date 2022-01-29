import 'package:flutter/material.dart';

import 'constants.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  required Function()? function,
  required String text,
}) => Container(
  width: width,
  decoration: BoxDecoration(
    color: background,
    borderRadius: BorderRadius.circular(5),
  ),
  child: MaterialButton(
    onPressed: function,
    height: 50,
    child: Text(
        isUpperCase ? text.toUpperCase() : text,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);


Widget formField({
  required TextEditingController controller,
  required TextInputType type,
  final ValueChanged<String>? onChanged,
  final Function(String)? onFieldSubmitted,
  final Function()? onTap,
  required FormFieldValidator validate,
  required String label,
  required Icon prefixIcon,
  IconButton? sufixIcon,
  bool isPassword: false,
  bool isClickable: true,
}) => TextFormField(
  validator: validate,
  controller: controller,
  keyboardType: type,
  onChanged: onChanged,
  onTap: onTap,
  enabled: isClickable,
  onFieldSubmitted: onFieldSubmitted,
  obscureText: isPassword ,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: prefixIcon,
    suffixIcon: sufixIcon,
    border: OutlineInputBorder(),
  ),
);


Widget task (Map model) => Padding(

  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            child: Text("${model['time']}"),
          ),
          SizedBox(width: 20,),

          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${model['title']}', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(height: 10,),
              Text('${model['date']}', style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),),
            ],
          ),
        ],
      ),
    ),
  ),
);