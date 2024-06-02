import 'package:bloc/bloc.dart';

part 'card_state.dart';
part 'card_event.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(CardInitial()) {
    on<AdditionEvent>((event, emit) {
      emit(CardAdding());
      emit(CardLoad(event.number + 1));
    });

    on<AdditionEvent>((event, emit) {
      emit(CardAdding());
      emit(CardLoad(event.number + 1));
    });
  }
}
