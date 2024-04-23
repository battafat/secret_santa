import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secret_santa/src/features/participants/data/fake_participants_repository.dart';
import 'package:secret_santa/src/features/participants/domain/participant.dart';
import 'package:secret_santa/src/features/wishlist/domain/wish.dart';
import 'package:secret_santa/src/features/wishlist/presentation/wishlist_text_bar.dart.dart';



class WishlistView extends ConsumerWidget{
  const WishlistView({super.key});
 

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    List<Wish> wishList = ref.watch(wishesProvider);

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return ReorderableListView.builder(
      reverse: true,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      itemCount: wishList.length,
      prototypeItem: ListTile(
        title: Text(wishList.first.description),
      ),
      itemBuilder: (BuildContext context, int index) {
        //TODO: add editing functionality for list items
        return ListTile(
          key: Key('$index'),
          tileColor: index.isOdd ? oddItemColor : evenItemColor,
          title: Text(textAlign: TextAlign.center, wishList[index].description),
          trailing: IconButton(
            iconSize: 33,
            icon: const Icon(Icons.delete),
            onPressed: () {
              WishesNotifier().removeWish(wishList[index].id);
            },
          ),
        );
      },
      onReorder: (int oldIndex, int newIndex) {
        
        // setState(() {
        //   if (oldIndex < newIndex) {
        //     newIndex -= 1;
        //   }
        //   final String item = wishList.removeAt(oldIndex);
        //   wishList.insert(newIndex, item);
        // });
      },
    );
  }
}
