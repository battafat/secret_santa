import 'package:flutter/material.dart';

class wishlistTextBar extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<wishlistTextBar> {
  final List<String> wishList = [];
  TextEditingController nameController = TextEditingController();
    
  void addItemToList() {
    setState(() {
      wishList.insert(0, nameController.text);
    });
  }

  void deleteItemFromList(int index) {
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
  Widget build(BuildContext context){
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
                      ),
                    ),
                      
                ),
              ),
              
                        
              TextButton(
                child: Text('ENTER'),
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
                      content: const Text('Add'),
                    );
                  } else {
                    addItemToList();
                    clearText();
                  }
                },  
              ),
                          
            ],
          );
  }
}