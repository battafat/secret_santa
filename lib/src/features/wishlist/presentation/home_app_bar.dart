import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secret_santa/src/features/participants/data/fake_participants_repository.dart';


class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final participantsList =
        ref.watch(participantsRepositoryProvider).getParticipantsList();

    return SafeArea(
      child: Container(
        color: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: participantsList.map((participant) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  child: Text(
                    participant.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(200.0); // Fixed height for the app bar
}





