import 'package:flutter/material.dart';
import 'package:secret_santa/src/constants/test_participants.dart';
import 'package:secret_santa/src/features/wishlist/presentation/home_app_bar.dart';

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
  final List<String> giftList = [];

  TextEditingController nameController = TextEditingController();



  void addItemToList(){
    setState(() {
      giftList.insert(0,nameController.text);
    });
  }

  void deleteItemFromList(int index){
    setState(() {
      if (giftList.isNotEmpty) {
      giftList.removeAt(index);
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

  void pairgiftListRandom(){
    setState((){
    
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    
    return Scaffold(
      body: Center(
        child: 
        
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
          flex: 1,
          //TODO: adjust 'Add Items to Your Wishlist!' higher up on screen
          child: giftList.isEmpty
              ? Center(child: Text('Add Items to Your Wishlist!'))
              : ReorderableListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  itemCount: giftList.length,
                  prototypeItem: ListTile(
                    title: Text(giftList.first),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    //TODO: add editing functionality for list items
                    return ListTile(
                      key: Key('$index'),
                      tileColor: index.isOdd ? oddItemColor : evenItemColor,
                      title: Text(
                          textAlign: TextAlign.center, giftList[index]),
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
                      final String item = giftList.removeAt(oldIndex);
                      giftList.insert(newIndex, item);
                    });
                  },
                )),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                  child: Center(
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
                        suffixIcon: Align(
                          child: ElevatedButton(
                            child: Text('Add'),
                            onPressed: () {
                              //can I use a ternary operator here?
                              if (nameController.text.isEmpty) {
                                //TODO: refactor with ternary operator
                                //TODO: investigate: The return type 'AlertDialog' isn't a 'void', as required by the closure's context.
                                AlertDialog(
                                  // TODO: add gift icon
                                  // TODO: refactor so that text pops up
                                  // TODO: add case where user only types spaces
                                  title:
                                      const Text('type a gift idea first'),
                                  content: const Text('add'),
                                );
                              } else {
                                addItemToList();
                                clearText();
                              }
                            },
                          ),
                        ),
                      ),
                      
                    ),
                  ),
              ),
            ],
          ),
        ]  
      )
      )
    );
    
  }
}






