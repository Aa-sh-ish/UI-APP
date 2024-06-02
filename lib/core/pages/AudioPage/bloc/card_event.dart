part of 'card_bloc.dart';

abstract class CardEvent {}

final class AdditionEvent extends CardEvent {
  final int number;
  AdditionEvent(this.number);
}

final class SubstractEvent extends CardEvent {
  final int number;
  SubstractEvent(this.number);
}
