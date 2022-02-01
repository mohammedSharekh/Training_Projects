import 'package:bmi_calculater/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit(CounterStates initialState) : super(CounterInitialStates());

  static CounterCubit get(context) =>  BlocProvider.of(context);

  int counter = 1;
  void minus() {
    counter--;
    emit(CounterminusStates());
  }
  void pluss() {
    counter++;
    emit(CounterPlusStates());

  }
}