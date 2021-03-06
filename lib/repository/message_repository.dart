import 'package:hola/model/message.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class MessageRepository {
  static Future<List<Message>> loadAllMessages() async {
    var apiResponse = await Message().getAll();
    print("------" + apiResponse.result.toString());
    List<Message> lst = [];
    if (apiResponse.success && apiResponse.results != null) {
      for (Message m in apiResponse.results) {
        lst.add(m);
      }
    }

    return lst;
  }

  static Future<bool> sendMessage({String message}) async {
    var m = Message()
      ..set('message', message)
      ..set('user', await ParseUser.currentUser());
    var apiResponse = await m.save();
    return apiResponse.success;
  }
}
