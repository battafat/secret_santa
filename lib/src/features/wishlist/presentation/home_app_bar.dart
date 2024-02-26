import 'package:flutter/material.dart';
import 'package:secret_santa/src/features/participants/data/fake_participants_repository.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    final participantsList = FakeParticipantsRepository.instance.getParticipantsList();
    return ListWheelScrollView(
      
      itemExtent: 42,
      children: [ListView.builder(
        itemCount: participantsList.length,
        itemBuilder: (context, index) {
        return ListTile(title: Text('index: $index'));
        }
      )],
      
    );
  }
@override
  Size get preferredSize => const Size.fromHeight(60.0);

}


