import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_find_freezed/data/models/character.dart';
import 'package:rick_and_morty_find_freezed/data/repositories/character_repo.dart';

part 'character_bloc.freezed.dart';
// part 'character_bloc.g.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepo characterRepo;
  CharacterBloc({
    required this.characterRepo,
  }) : super(const CharacterState.loading()) {
    on<CharacterEventFetch>((event, emit) async {
      emit(const CharacterState.loading());
      try {
        Character characterLoaded = await characterRepo.getCharacter(
          event.page,
          event.name,
        );
        emit(CharacterState.loaded(characterLoaded: characterLoaded));
      } catch (_) {
        emit(const CharacterState.error());
      }
    });
  }
}
