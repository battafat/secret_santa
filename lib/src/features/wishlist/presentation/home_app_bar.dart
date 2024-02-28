import 'package:flutter/material.dart';
import 'package:secret_santa/src/features/participants/data/fake_participants_repository.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    //TODO: decide whether it's worth it to convert participantsList to List<String>
    final participantsList = FakeParticipantsRepository.instance.getParticipantsList();
    return Flexible(
      flex: 1,
      child: ListView.builder(
          // itemExtent: 3.0,
          itemCount: participantsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
          return Container(
            width: 150,
            height: 150,
            child: ListTile(
              key: Key('$index'),
              title: Text(
              participantsList[index].name)),
          );
          }
        ),
    );
  }
@override
  Size get preferredSize => const Size.fromHeight(60.0);

}


