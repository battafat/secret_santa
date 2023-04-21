import 'package:english_words/english_words.dart';
// flutter/material.dart is the flutter framework? 
// and necessary to run flutter?
import 'package:flutter/material.dart';
// I think provider package helps provide state updates
import 'package:provider/provider.dart';
void main() {
  print("");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'secret_santa',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  // var current = WordPair.random();
  // var namesList = ['Nicholas', 'Timothy', 'Bethany', 'Bridget', 'Hannah', 'Benjamin', 'Malia'];
  var namesList = <String> [];
  // var firstName = namesList.elementAt(0);

  // var name = namesList.elementAt(-1);

  // getName() {
  //   var name = namesList.elementAt(-1);
  //   notifyListeners();
  // } 

  getName(name) {
    namesList.add(name);
  }

  // var currentName = getName();  

  // figure out how to write this in Flutter syntax
  //void matchNames() {
  // for name in current_list:
      // match that name with a random name from
      // current_list
  // }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = MyCustomForm();
        break;
      case 1:
        page = MatchNamesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.man_2_outlined),
                    label: Text('Names'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}


class MatchNamesPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    
    if (appState.namesList.isEmpty) {
      return Center(
        child: Text('No names yet.'),
        );
    }

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have '
                '${appState.namesList.length} names:'),
          ),
          // So this seems to display the favorites on the FavoritesPage
          for (var name in appState.namesList)
            ListTile(
              leading: Icon(Icons.construction_outlined),
              // this sets the case of favorites
              title: Text(name),
            ),
        ],
      ),
    );
  }
}
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});
  
  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}
  
// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  // var appState = context.watch<MyAppState>();
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final myController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter names, one by one'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          appState.getName(myController.text);
          showDialog(
            context: context,
            builder: (context) {
              // appState.getName();
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                // appState.getName(myController.text);
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}

// class MatchNames extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();

    
//   }
// }