import 'package:flutter_sms/flutter_sms.dart';

void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    return 'sendSMS error';
  });
  print(_result);
}
