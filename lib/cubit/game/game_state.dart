part of 'game_cubit.dart';

abstract class GameState {
  const GameState();

  List<Object> get props => [];
}

class GameInitial extends GameState {}

class GameLoading extends GameState {}

class GameLoaded extends GameState {
  final List<Game> games;

  const GameLoaded(this.games);

  @override
  List<Object> get props => [games];
}

class GameError extends GameState {
  final String message;

  const GameError(this.message);

  @override
  List<Object> get props => [message];
}