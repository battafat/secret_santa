// my_remote_name
// import 'package:english_words/english_words.dart';
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


  getName(name) {
    namesList.add(name);
  }
}

// class AssignNames extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     for (name in appState.namesList) {
      
//     }
//   } 
// }



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

  bool _pinned = true;
  bool _snap = true;
  bool _floating = true;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final myController = TextEditingController();
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 160.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Enter your Santas'), 
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text('Scroll to see your list of santas'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.red : Colors.green,
                  height: 100.0,
                  child: Center(
                    child: Text(myController.text, textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      )
    );
  }  
}
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: TextField(
//           controller: myController,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // When the user presses the button, show an alert dialog containing
//         // the text that the user has entered into the text field.
//         onPressed: () {
//           appState.getName(myController.text);
//           showDialog(
//             context: context,
//             builder: (context) {
//               // appState.getName();
//               return AlertDialog(
//                 // Retrieve the text the that user has entered by using the
//                 // TextEditingController.
//                 // appState.getName(myController.text);
//                 content: Text(myController.text),
//               );
//             },
//           );
//         },
//         tooltip: 'Show me the value!',
//         // child: const Icon(Icons.text_fields),
//         child: Text('Finalize List')
//       ),
//     );
//   }
// }

// class MatchNames extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();

    
//   }
// }