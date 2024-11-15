import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:lefrancois_thibaut_y2_flutter/cubit/game/game_cubit.dart';
import 'package:lefrancois_thibaut_y2_flutter/models/game/game.dart';

class CreateGameDialog extends StatefulWidget {
  @override
  _CreateGameDialogState createState() => _CreateGameDialogState();
}

class _CreateGameDialogState extends State<CreateGameDialog> {
  final _formKey = GlobalKey<FormState>();
  String? _homeTeam;
  String? _awayTeam;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create Game'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Home Team'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the home team';
                }
                return null;
              },
              onSaved: (value) {
                _homeTeam = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Away Team'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the away team';
                }
                return null;
              },
              onSaved: (value) {
                _awayTeam = value;
              },
            ),
            DatePicker(
              onDateSelected: (date) {
                _selectedDate = date;
              },
              maxDate: DateTime.now().add(Duration(days: 365)),
              minDate: DateTime.now(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              // DateTime now = DateTime.now();
              // String formattedDate = now.toString();
              // final newGame = Game(
              //   homeTeam: _homeTeam!,
              //   awayTeam: _awayTeam!,
              //   date: formattedDate,
              // );
              // context.read<GameCubit>().addGame(newGame);
              Navigator.of(context).pop();
            }
          },
          child: Text('Create'),
        ),
      ],
    );
  }
}