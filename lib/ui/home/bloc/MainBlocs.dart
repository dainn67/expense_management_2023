import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnflutterapp/ui/home/bloc/MainEvent.dart';
import 'package:learnflutterapp/ui/home/bloc/MainState.dart';

class AppBloc extends Bloc<AppEvent, AppState>{
  AppBloc(): super(InitState()){
    on<IncrementBalanceEvent>((event, emit){
      emit(state.copyWith(balance: state.balance + 10000));
    });

    on<DecrementBalanceEvent>((event, emit){
      emit(state.copyWith(balance: state.balance - 1));
    });
  }
}