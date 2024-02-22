import 'package:flutter_sms/flutter_sms.dart';

void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    return 'sendSMS error';
  });
  print(_result);
}


//SMS button
// Align(
//     alignment: Alignment.bottomRight,
//     child: FloatingActionButton(
//       backgroundColor: Colors.red,
//       tooltip: "Finished?",
//       onPressed: () {
//         String message = "This is a test message!";
//         List<String> recipents = ["4027081733"];

//         _sendSMS(message, recipents);
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(builder: (context) => const SecondRoute()),
//         // );
//       },   
//       child: FittedBox (
//         child: 
//           Text('Finalize'),
//       ),    
//     ),
//   )