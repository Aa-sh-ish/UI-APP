part of 'card_bloc.dart';

abstract class CardState {}

final class CardInitial extends CardState {}

final class CardAdding extends CardState {}

final class CardLoad extends CardState {
  final int cardnumber;
  CardLoad(this.cardnumber);
}
