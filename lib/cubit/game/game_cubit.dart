import 'package:bloc/bloc.dart';

import '../../models/game/game.dart';
import '../../services/game_service.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final GameService gameService;

  GameCubit(this.gameService) : super(GameInitial());

  Future<void> fetchCompletedGames() async {
    try {
      emit(GameLoading());
      final games = await gameService.fetchCompletedGames();
      emit(GameLoaded(games));
    } catch (e) {
      emit(const GameError('Failed to load games'));
    }
  }

  Future<void> fetchUpcomingGames() async {
    try {
      emit(GameLoading());
      final games = await gameService.fetchUpcomingGames();
      emit(GameLoaded(games));
    } catch (e) {
      emit(GameError('Failed to load games'));
    }
  }

  Future<void> deleteGame(String tournament, String id) async {
    try {
      await gameService.deleteGame(tournament, id);
      fetchUpcomingGames(); // Refresh the list after deletion
    } catch (e) {
      emit(GameError('Failed to delete game : $e'));
    }
  }

  Future<void> addGame(Game game) async {
    try {
      await gameService.addGame(game);
      fetchUpcomingGames(); // Refresh the list after addition
    } catch (e) {
      emit(GameError('Failed to add game : $e'));
    }
  }
}