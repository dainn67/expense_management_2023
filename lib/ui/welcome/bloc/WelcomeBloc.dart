import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnflutterapp/ui/welcome/bloc/WelcomEvent.dart';
import 'package:learnflutterapp/ui/welcome/bloc/WelcomeState.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState>{
  WelcomeBloc(): super(WelcomeState()){
    on<WelcomeEvent>((event, emit){
      emit(WelcomeState(page: state.page));
    });
  }
}