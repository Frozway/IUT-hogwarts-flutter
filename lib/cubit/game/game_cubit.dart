import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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
      emit(GameError('Failed to load games'));
    }
  }
}