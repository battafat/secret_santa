import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secret_santa/src/features/participants/data/fake_participants_repository.dart';
import 'package:secret_santa/src/features/participants/domain/participant.dart';
import 'package:secret_santa/src/features/wishlist/presentation/wishlist_text_bar.dart.dart';

class WishlistList extends ConsumerWidget {

  List<String> unmodifiableWishList =
      FakeParticipantsRepository.instance.getWishesList('2');
  // List<String> get wishList => _unmodifiableWishList.toList();

  final wishlist = FakeParticipantsRepository.instance;
  
  print(wishlist);

  void deleteItemFromList(int index) {
    setState(() {
      if (wishList.isNotEmpty) {
        wishList.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return ReorderableListView.builder(
      reverse: true,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      itemCount: wishList.length,
      prototypeItem: ListTile(
        title: Text(wishList.first),
      ),
      itemBuilder: (BuildContext context, int index) {
        //TODO: add editing functionality for list items
        return ListTile(
          key: Key('$index'),
          tileColor: index.isOdd ? oddItemColor : evenItemColor,
          title: Text(textAlign: TextAlign.center, wishList[index]),
          trailing: IconButton(
            iconSize: 33,
            icon: const Icon(Icons.delete),
            onPressed: () {
              deleteItemFromList(index);
            },
          ),
        );
      },
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
            // what does newIndex start at?
          }
          final String item = wishList.removeAt(oldIndex);
          wishList.insert(newIndex, item);
        });
      },
    );
  }
}
