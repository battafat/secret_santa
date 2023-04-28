import 'package:flutter/material.dart';

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
                },
              ),
              ElevatedButton(
                onPressed: () {
                  deleteItemFromList();
                },
                child: Text('Delete'),
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
              onPressed: null,
              backgroundColor: Colors.red,
              tooltip: "Finished?",
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