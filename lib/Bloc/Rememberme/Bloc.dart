import 'package:bloc/bloc.dart';
import 'Event.dart';
import 'State.dart';

class RememberMeBloc extends Bloc<RememberMeEvent,RememberMeState>{
  RememberMeBloc():super(const RememberMeState(false)){
  on<RememberMeEvent>((event,emit){
    emit(RememberMeState(!state.Remember));
  });
  }
}
