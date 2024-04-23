import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class Wish {
  const Wish({
    required this.id,
    required this.description,
    // required this.completed,
  });

  // All properties should be `final` on our class.
  final String id;
  final String description;
  // final bool completed;

  // Since Wish is immutable, we implement a method that allows cloning the
  // Wish with slightly different content.
  Wish copyWith({String? description}) {
    return Wish(
      id: id,
      description: description ?? this.description,
      // completed: completed ?? this.completed,
    );
  }
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

  assignWishID(){
    final wishID = state.length + 1;
    return wishID;
  }
}

// Finally, we are using NotifierProvider to allow the UI to interact with
// our TodosNotifier class.
final wishesProvider = NotifierProvider<WishesNotifier, List<Wish>>(() {
  return WishesNotifier();
});
