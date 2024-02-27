import 'package:flutter/material.dart';
import 'package:secret_santa/src/features/participants/data/fake_participants_repository.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    //TODO: decide whether it's worth it to convert participantsList to List<String>
    final participantsList = FakeParticipantsRepository.instance.getParticipantsList();
    return Row(
      children: [
        ListView.builder(
            itemCount: participantsList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
            return ListTile(
              key: Key('$index'),
              title: Text(
              participantsList[index].name));
            }
          ),
      ],
    );
  }
@override
  Size get preferredSize => const Size.fromHeight(60.0);

}


