import 'package:bmi_calculater/modules/counter/cubit/cubit.dart';
import 'package:bmi_calculater/modules/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';

class CounterScreen extends StatelessWidget {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(CounterInitialStates()),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {
          if(state is CounterInitialStates) print('Initial State');
          if(state is CounterminusStates) print('Minus State');
          if(state is CounterPlusStates) print('Plus State');
        },
        builder: (context, state) {
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
                  CounterCubit.get(context).minus(),
                  }, icon: const Icon(Icons.remove)),
                  const SizedBox(width: 40,),
                  Text('${CounterCubit.get(context).counter}', style: TextStyle(fontSize: 25),),
                  const SizedBox(width: 40,),
                  IconButton(onPressed: ()=> {
                    CounterCubit.get(context).pluss(),
                  }, icon: const Icon(Icons.add)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

