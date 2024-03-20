import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secret_santa/src/features/participants/data/fake_participants_repository.dart';

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  //TODO: either remove 'implements PreferredSizeWidget' or use it
  const HomeAppBar({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO: decide whether it's worth it to convert participantsList to List<String>
    final participantsList = ref.watch(participantsRepositoryProvider).getParticipantsList();
    return ListView.builder(
    //TODO: shrinkWrap is supposedly expensive: is there a workaround?
        shrinkWrap: true,
        itemCount: participantsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(8.0),
          width: 150,
          height: 150,
          child: ListTile(
            key: Key('$index'),
            title: ElevatedButton(
              onPressed: null,
              child: Text(
              participantsList[index].name),
            )),
        );
        }
      );
  }
@override
  Size get preferredSize => const Size.fromHeight(60.0);

}


