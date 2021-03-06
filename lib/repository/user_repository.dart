import 'package:get_storage/get_storage.dart';
import 'package:hola/model/user.dart';

String kUserData = "user_data";
String kToken = "token";

String authToken;
User currentUser;

void setUserData(User user, String token) {
  GetStorage storage = GetStorage();
  storage.write(kUserData, user.toJson());
  currentUser = user;
  storage.write(kToken, token);
  authToken = token;
}

void loadUserData() {
  GetStorage storage = GetStorage();
  currentUser = User.fromJson(storage.read(kUserData));
  authToken = storage.read(kToken);
}
