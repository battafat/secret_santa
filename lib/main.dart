import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secret_santa/src/features/participants/data/fake_participants_repository.dart';
import 'package:secret_santa/src/features/wishlist/presentation/home_app_bar.dart';
import 'package:secret_santa/src/features/wishlist/presentation/wishlist_text_bar.dart.dart';
import 'package:secret_santa/src/features/wishlist/presentation/wishlist_list.dart';


void main() {
  runApp(ProviderScope(child: MyApp()));
  // MaterialApp(
  //   home: MyApp(),
  // ));
}

class MyApp extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<MyApp> {
  // List<String> wishList = FakeParticipantsRepository.instance.getWishesList('1');

  List<String> _unmodifiableWishList =
      FakeParticipantsRepository.instance.getWishesList('2');
  // List<String>  wishList = List.from(unmodifiableWishList); 
  List<String> get wishList => _unmodifiableWishList.toList();
  // void makeWishlist (wishList) {
  //   wishList; 
  // }
  
  // makeWishlist () {
  //   wishList = unmodifiableWishList.toList();
  //   }
  // List<String> addWishes(unmodifiableWishList) {
    // wishList = unmodifiableWishList.toList();
  //   return wishList;



  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    // addWishes(unmodifiableWishList);
    return Scaffold(
      
      body: 
      Center(
        child: 
        
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: HomeAppBar()),
          Expanded(
          flex: 8,
          child: wishList.isEmpty
              ? Center(child: Text('Add Items to Your Wishlist!'))
              : WishlistList()),
          WishlistTextBar(),
        ]  
      )
      )
    );
    
  }
}






