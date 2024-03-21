import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class Wish {
  const Wish({
    // required this.id,
    required this.description,
    // required this.completed,
  });

  // All properties should be `final` on our class.
  // final String id;
  final String description;
  // final bool completed;

  // Since Wish is immutable, we implement a method that allows cloning the
  // Wish with slightly different content.
  // Wish copyWith({String? id, String? description, bool? completed}) {
  //   return Wish(
  //     id: id ?? this.id,
  //     description: description ?? this.description,
  //     completed: completed ?? this.completed,
  //   );
  // }
}

class WishesNotifier extends Notifier<List<Wish>> {
  // We initialize the list of wishes to an empty list
  @override
  List<Wish> build() {
    return [];
  }

  // Let's allow the UI to add wishes.
  void addWish(Wish wish) {
    // Since our state is immutable, we are not allowed to do `state.add(wish)`.
    // Instead, we should create a new list of wishes which contains the previous
    // items and the new one.
    // Using Dart's spread operator here is helpful!
    state = [...state, wish];
    // No need to call "notifyListeners" or anything similar. Calling "state ="
    // will automatically rebuild the UI when necessary.
  }

  // Let's allow removing wishes
  void removeWish(String wishId) {
    // Again, our state is immutable. So we're making a new list instead of
    // changing the existing list.
    state = [
      for (final wish in state)
        if (wish.id != wishId) wish,
    ];
  }

  // Let's mark a wish as completed
  void toggle(String wishId) {
    state = [
      for (final wish in state)
        // we're marking only the matching wish as completed
        if (wish.id == wishId)
          // Once more, since our state is immutable, we need to make a copy
          // of the wish. We're using our `copyWith` method implemented before
          // to help with that.
          wish.copyWith(completed: !wish.completed)
        else
          // other wishes are not modified
          wish,
    ];
  }
}

// Finally, we are using NotifierProvider to allow the UI to interact with
// our TodosNotifier class.
final wishesProvider = NotifierProvider<WishesNotifier, List<Wish>>(() {
  return WishesNotifier();
});
