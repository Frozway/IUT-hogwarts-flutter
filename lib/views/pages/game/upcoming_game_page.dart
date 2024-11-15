import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lefrancois_thibaut_y2_flutter/services/game_service.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/atoms/list_item.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/molecules/list_view_item.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/templates/main_template.dart';

import '../../../cubit/game/game_cubit.dart';

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
              return ListViewItem(
                items: state.games.map((game) => ListItem(
                  icon: const Icon(Icons.sports_baseball),
                  title: '${game.homeTeam} vs ${game.awayTeam}',
                  subtitle: 'Tournament: ${game.tournament}',
                )).toList(),
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