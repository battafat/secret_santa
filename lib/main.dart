import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secret_santa/src/features/wishlist/presentation/home_app_bar.dart';
import 'package:secret_santa/src/features/wishlist/domain/wish.dart';
import 'package:secret_santa/src/features/wishlist/presentation/wishlist_text_bar.dart.dart';
import 'package:secret_santa/src/features/wishlist/presentation/wishlist_view.dart';
//TODO: navigate between names of participants
//TODO: keep track of person who input the wish
//TODO: keep track of who is logged in to know who adds wish: userID?
//TODO: make sure each wish has the author and the intended recipient
//TODO: keep the wishes that each user makes for themself in a separate list? Or just check the author
void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Wish> wishList = ref.watch(wishesProvider);
  
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme(
          brightness: Brightness.dark, 
          primary: Colors.green, 
          onPrimary: Colors.white, 
          secondary: Colors.grey, 
          onSecondary: Colors.black, 
          error: Colors.red, 
          onError: Colors.black, 
          background: Colors.black, 
          onBackground: Colors.white, 
          surface: Colors.blue, 
          onSurface: Colors.purple),
      ),
      home: Scaffold(
          appBar: HomeAppBar(),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
            // Expanded(flex: 1, child: HomeAppBar()),
            Expanded(
                flex: 8,
                child: wishList.isEmpty
                    ? Center(child: Text('Add Items to Your Wishlist!'))
                    : WishlistView()),
            WishlistTextBar(),
          ]))),
    );
  }
}
