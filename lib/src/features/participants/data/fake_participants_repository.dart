import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:secret_santa/src/constants/test_participants.dart';
import 'package:secret_santa/src/features/participants/domain/participant.dart';

class FakeParticipantsRepository {
  //Private constructor
  
  
  final List<Participant> _participants = kTestParticipants;
  
  List<Participant> getParticipantsList() {
    return _participants;
  }

  Participant? getParticipant(String id) {
    return _participants.firstWhere((participant) => participant.id == id);
  }

  List<String> getWishesList(String id) {
    final Participant? participantWishes = getParticipant(id);
    return participantWishes!.wishes;
  }

  final participantsRepositoryProvider = Provider<FakeParticipantsRepository>((ref) {
    return FakeParticipantsRepository();
  });


}

@riverpod
class Wishes extends FakeParticipantsRepository{
  // @override //Do I not need this?
  List<String> build() {
    return [];
  }

  void addWish(String wish) {
    state = [...state, wish];
  }
}
