import 'package:flutter/material.dart';
import 'package:secret_santa/src/constants/test_participants.dart';
import 'package:secret_santa/src/features/wishlist/presentation/home_app_bar.dart';
import 'package:secret_santa/src/features/wishlist/presentation/wishlistTextBar.dart';

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



  void addItemToList(){
    setState(() {
      wishList.insert(0,nameController.text);
    });
  }

  void deleteItemFromList(int index){
    setState(() {
      if (wishList.isNotEmpty) {
      wishList.removeAt(index);
      }
    }); 
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }
  void clearText() {
    nameController.clear();
  }


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
              : ReorderableListView.builder(
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
                      title: Text(
                          textAlign: TextAlign.center, wishList[index]),
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
                )),
          wishlistTextBar(),
        ]  
      )
      )
    );
    
  }
}






