import 'dart:html';

import 'package:flutter/material.dart';
import "dart:math";
import 'package:flash_card/flash_card.dart';
import 'package:flutter_sms/flutter_sms.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<MyApp> {
  final List<String> names = [];

  TextEditingController nameController = TextEditingController();

  void _sendSMS(String message, List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
        return 'sendSMS error';
    });
    print(_result);
  }

  void addItemToList(){
    setState(() {
      names.insert(0,nameController.text);
    });
  }

  void deleteItemFromList(int index){
    setState(() {
      if (names.isNotEmpty) {
      names.removeAt(index);
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

  void pairNamesRandom(){
    setState((){
    
    });
  }
  // ReoderableListView.builder stuff:
  // late final List<int> _items = List<int>.generate(names.length, (int index) => index);
  @override
  Widget build(BuildContext context) {
    // print(_items);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Secret Santa App'),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
              child: Card(
                child: AnimatedSize(
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 200),
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter a gift',
                      ),
                      minLines: 1,
                      maxLines: null,
                    ),
                  ),
                ),
              ),
          ),
          ButtonBar(
            children: [
              ElevatedButton(
                child: Text('Add'),
                onPressed: () {
                  addItemToList();
                  clearText();
                },
              ),
            ]  
          ),    
    
          Expanded(
            flex: 1,
            child: names.isEmpty ? Center(child: Text('Add Items to Your Wishlist!')) :ReorderableListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                itemCount: names.length,
                prototypeItem: ListTile(
                  title: Text(names.first),
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    key: Key('$index'),
                    tileColor: index.isOdd ? oddItemColor : evenItemColor,
                    title: Text(
                      textAlign: TextAlign.center,
                      names[index]),
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
                    final String item = names.removeAt(oldIndex);
                    names.insert(newIndex, item);
                  });
                },
              )
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              tooltip: "Finished?",
              onPressed: () {
                String message = "This is a test message!";
                List<String> recipents = ["4027081733"];

                _sendSMS(message, recipents);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const SecondRoute()),
                // );
              },   
              child: FittedBox (
                child: 
                  Text('Finalize'),
              ),    
            ),
          )
        ]  
      )
      )
    );
    
  }
}



class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Column(
        children: [
            FlashCard(
              frontWidget: Align(
                alignment: Alignment.center,
                child: Text(
                  // textAlign: TextAlign.center,
                  'front'
                ),
              ),
              backWidget: Align(
                alignment: Alignment.center,
                child: Text(
                'back'
                ),
              )
            ),
            Align(
            alignment: Alignment.bottomLeft,
            child: ElevatedButton(
              onPressed: () {
                // Navigate back to first route when tapped.
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ),  
        ],
      ),
    );
  }
}

// class nameAssignment extends StatelessWidget {
//   var list = ['Lacci','Tim','Bet','Bridget','Hannah'];
// //   var newList = list.toList();
// //   print(newList);
//   // generates a new Random object
//   final random = Random();
  

  
//   assignNames(){
  
//     Map<String, String> santasMap ={
//     };
//     var newList = list.toList();
//     containsI(i){
//       if (newList.contains(i)){
//         newList.remove(i);
//         return true;
//       }
//     }

//     for (String i in list) {
//       print("santasMap, line 30: {$santasMap}");
//       print("newList, line 34: {$newList}");
//   //     does this fix the problem?
//       var checkContainsI = containsI(i);
//   // if newList is empty, start over
// //   this got an infinite loop problem, error:
// //   Uncaught RangeError: Maximum call stack size exceededError
//       if (newList.isEmpty){
//         break;
//       }  
// //     if I refill newList, will that fix the problem?
// //     will I also have to empty santasMap?
// //     what if I break first and then return assignNames?
// //        somehow have to get out of the for loop, 
// //        start over
// //         AND in the case that everyone is assigned, 
// //         return some kind of "I'm finished" deal. Maybe true.
        
// //         break;
// //         return assignNames();
      
//       print("newList, line 36: {$newList}"); 
//   //     var newList = newList.removeAt(i)
//       var element = newList[random.nextInt(newList.length)];
//       print('element, line 39: {$element}');
//       santasMap [i] = element;
//       print('santasMap: {$santasMap}');
// //    the function should say it's done AND return true
// //    in case I need to use true for flutter
//       if (santasMap.length == list.length){
//         print("all matched!");
//         return true;
//       }
//       print("santasMap: {$santasMap}");
//   //  redefine newList to equal the original list
//   // I think I'm going to have to add them back individually, after checking
//   // if they're not in the 
//   //     newList = list.toList(); 
//       print("newList, line 43: {$newList}");
//   // need to redefine newList as the original list minus the element/giftee 
//   // AND minus the other elements/giftees who have been assigned

//       var elementIndex = newList.indexOf(element);
//       newList.removeAt(elementIndex);

//       if (checkContainsI == true){
//         newList.add(i);
//       }
//   // trying to get rid of repeat assignment of names; ie. two santas
//   // get assigned to the same person
//   //     if (santasMap.containsValue(i)){
//   //       newList.
//   //     }
//   //     for (String name in list){
//   //       if (santasMap.containsValue(name)){
//   //         newList.add(name);
//   //       }
//   //     }
//   // damn. This makes sense. Bet has already been assigned when I remove Bet 
//   //  from newList. So then at line 35 it iterates on Bet in list
//   // and it tried to remove Bet (i) from newList.
//   //  but Bet has already been removed from newList. Sneaky problem.
//       print("newList, line 46: {$newList}");
//       }

//     print("santasMap: {$santasMap}");
//     print("newList: {$newList}");
//     print("Start Over!");
    
//     return assignNames();
//    }
  
//   assignNames();
//   //     for (String x in list) {
//   //       if (x != i){
//   //         iLessList.add(x);
//   //       }else{
//   //         continue;
//   //       }
//   //     }

//   //   for (int i = list.length - 1; i >= 0; --i) {
//   //     [...]
//   //     // at the very end...
//   //     if (list[i] == i) {
//   //       list.removeAt(i);
//   //     }
//   //   }



//   //     print(iLessList);
//   //     var element = iLessList[random.nextInt(iLessList.length)];
//   //     newList.remove(element);
//   //   print(i);
//     }
// }