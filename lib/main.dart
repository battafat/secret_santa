import 'package:flutter/material.dart';
import 'package:secret_santa/src/constants/test_participants.dart';
import 'package:secret_santa/src/features/wishlist/presentation/home_app_bar.dart';
import 'package:secret_santa/src/features/wishlist/presentation/wishlist_text_bar.dart.dart';
import 'package:secret_santa/src/features/wishlist/presentation/wishlist_list.dart';


void main() {
  print(kTestParticipants);
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<MyApp> {
  final List<String> wishList = [];

  TextEditingController nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    
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
              // TODO: Center the Text('Add Item to your Wishlist!') with TextField and HomeAppBar
              ? Center(child: Text('Add Items to Your Wishlist!'))
              : WishlistList()),
          wishlistTextBar(),
        ]  
      )
      )
    );
    
  }
}






