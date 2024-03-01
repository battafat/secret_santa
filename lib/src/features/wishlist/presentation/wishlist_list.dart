import 'package:flutter/material.dart';

class WishlistList extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<WishlistList> {
  final List<String> wishList = [];    

  void deleteItemFromList(int index){
    
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
  
      );
  }
}