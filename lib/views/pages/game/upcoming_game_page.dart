import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lefrancois_thibaut_y2_flutter/services/game_service.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/atoms/list_item.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/templates/main_template.dart';

import '../../../cubit/game/game_cubit.dart';
import '../../organisms/modal.dart';

class UpcomingGamePage extends StatelessWidget {
  const UpcomingGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainTemplate(
      title: "Upcoming Games",
      body: BlocProvider(
        create: (context) => GameCubit(GameService())..fetchUpcomingGames(),
        child: BlocBuilder<GameCubit, GameState>(
          builder: (context, state) {
            if (state is GameLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GameLoaded) {
              return Stack(
                children: [
                  ListView.builder(
                    itemCount: state.games.length,
                    itemBuilder: (context, index) {
                      final game = state.games[index];
                      return Dismissible(
                        key: Key(game.id!),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          context.read<GameCubit>().deleteGame(game.tournament, game.id.toString());
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        child: ListItem(
                          icon: const Icon(Icons.sports_baseball),
                          title: '${game.homeTeam} vs ${game.awayTeam}',
                          subtitle: 'Tournament: ${game.tournament}',
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: FloatingActionButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => CreateGameDialog(),
                        );
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              );
            } else if (state is GameError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No upcoming games found'));
            }
          },
        ),
      ),
    );
  }
}