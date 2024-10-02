import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secret_santa/src/features/participants/data/fake_participants_repository.dart';
import 'package:secret_santa/src/features/wishlist/domain/wish.dart';

class WishlistTextBar extends ConsumerWidget {
  const WishlistTextBar({super.key});
  // List<String> _unmodifiableWishList =
  //     FakeParticipantsRepository.instance.getWishesList('2');
  // List<String> get wishList => _unmodifiableWishList.toList();
 

  

  // void addItemToList() {
  //   setState(() {
  //     wishList.insert(0, nameController.text);
  //   });
  // }

  // void deleteItemFromList(int index) {
  //   setState(() {
  //     if (wishList.isNotEmpty) {
  //       wishList.removeAt(index);
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   nameController.dispose();
  //   super.dispose();
  // }

  // void clearText() {
  //   nameController.clear();
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController nameController = TextEditingController();
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              textAlign: TextAlign.center,
              controller: nameController,
              minLines: 1,
              maxLines: null,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                border: OutlineInputBorder(),
                hintText: 'Enter a gift',
                //TODO: How do keep track of the author of the gift?
              ),
            ),
          ),
        ),
        TextButton(
          child: Text('ENTER'),
          // TODO: Fix this button's functionality. Currently not working.
          onPressed: () {
            //can I use a ternary operator here?
            if (nameController.text.isEmpty) {
              //TODO: refactor with ternary operator
              //TODO: investigate: The return type 'AlertDialog' isn't a 'void', as required by the closure's context.
              AlertDialog(
                // TODO: add gift icon
                // TODO: refactor so that text pops up
                // TODO: add case where user only types spaces
                title: const Text('type a gift idea first'),
                content: const Text('Add'),
              );
            } else {
              final id = ref.read(wishesProvider.notifier).assignWishID();
              print(id);
              Wish newWish = Wish(description: nameController.text, id: id.toString(), author: participantsRepositoryProvider.name!);
            //  Maybe should change "read" to watch?
            // addItemToList();
              ref.read(wishesProvider.notifier).addWish(newWish);
              // clearText();

            }
          },
        ),
      ],
    );
  }
}
