import 'package:flutter/material.dart';


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
  IconButton? suffixIcon,
  bool isPassword = false,
  bool isClickable = true,
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
    suffixIcon: suffixIcon,
    border: const OutlineInputBorder(),
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
          const SizedBox(width: 20,),
          Expanded(
            child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${model['title']}', style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 10,),
                  Text('${model['date']}', style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),),
                  const SizedBox(height: 10,),
                  Text('${model['status']}', style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red ,
                  ),),
                ],
              ),
            ],
          ),)
        ],
      ),
    ),
  ),
);
