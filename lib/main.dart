import 'package:flutter/material.dart';
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
  final List<String> giftList = [];

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
                        alignLabelWithHint: true,
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        border: OutlineInputBorder(),
                        hintText: 'Enter a gift',
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
            child: giftList.isEmpty ? Center(child: Text('Add Items to Your Wishlist!')) :ReorderableListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                itemCount: giftList.length,
                prototypeItem: ListTile(
                  title: Text(giftList.first),
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    key: Key('$index'),
                    tileColor: index.isOdd ? oddItemColor : evenItemColor,
                    title: Text(
                      textAlign: TextAlign.center,
                      giftList[index]),
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

