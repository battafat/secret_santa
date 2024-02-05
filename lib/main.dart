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
  final List<String> names = <String>[];

  TextEditingController nameController = TextEditingController();
// function for sending sms messages
// from: https://pub.dev/packages/flutter_sms
  // void _sendSMS(String message, List<String> recipents) async {
  //   String result = await sendSMS(message: message, recipients: recipents)
    //         .catchError((onError) {
    //       print(onError);
    //     });
    // print(result);
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

  void deleteItemFromList(){
    setState(() {
      names.removeAt(0);   
    }); 
  }

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   nameController.dispose();
  //   super.dispose();
  // }

  void pairNamesRandom(){
    setState((){
    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secret Santa App'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Santa Names',
              ),
            ),
          ),
          ButtonBar(
            children: [
              ElevatedButton(
                child: Text('Add'),
                onPressed: () {
                  addItemToList();
                  var nameController = "";
                  // dispose();
                },
              ),
              ElevatedButton(
                child: Text('Delete'),
                onPressed: () {
                  deleteItemFromList();
                },
              ),
            ]  
          ),    
        
    
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  margin: EdgeInsets.all(2),
                  child: Center(
                    child: 
                      Text(names[index]),
                      // TextStyle(fontSize: 18),
                  ),
                );
              }
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