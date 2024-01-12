import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_find_freezed/bloc/character_bloc.dart';
import 'package:rick_and_morty_find_freezed/data/repositories/character_repo.dart';
import 'package:rick_and_morty_find_freezed/ui/pages/search_page.dart';

class HomePage extends StatelessWidget {
  final String title;
  final repository = CharacterRepo();
  HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          centerTitle: true,
          title: Text(
            'Rick and Morty',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: BlocProvider(
          create: (context) => CharacterBloc(characterRepo: repository),
          child: Container(
              decoration: const BoxDecoration(color: Colors.black87),
              child: const SearchPage()),
        ));
  }
}
