import 'package:get/get.dart';
import 'package:hola/api/api_routes.dart';
import 'package:hola/model/setting.dart';
import 'package:hola/model/user.dart';
import 'package:hola/repository/user_repository.dart';

class SlugScreenController extends GetxController {
  Rx<Setting> slug = Setting().obs;
  RxBool isLoading = false.obs;
  String title;
  String description;
  List pagesList = [];

  Future<void> loadAboutUsSlug() async {
    isLoading.value = true;
    try {
      var response = await API.getStaticPages({
        "slug": "about_us",
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        print(response.data);
        title = response.data['data']['title'];
        description = response.data['data']['description'];
        setUserData(User.fromMap(response.data['data']), "about_us_token");
        /*pagesList = List.generate(
            response.data['data'].length,
            (index) =>
                Setting.fromJson(jsonDecode(response.data['data'][index])));

        print("PAGES LIST HERE IT IS");
        print(pagesList);
     */
      } else {
        Get.snackbar("Error Occured", "Please Try again");
      }
    } catch (e) {
      return e;
    }
  }

  Future<void> loadContactUsSlug() async {
    isLoading.value = true;
    try {
      var response = await API.getStaticPages({
        "slug": "contact_us",
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        print(response.data);
        title = response.data['data']['title'];
        description = response.data['data']['description'];
        //setUserData(User.fromMap(response.data['data']), "about_us_token");

        /*pagesList = List.generate(
            response.data['data'].length,
            (index) =>
                Setting.fromJson(jsonDecode(response.data['data'][index])));

        print("PAGES LIST HERE IT IS");
        print(pagesList);
     */
      } else {
        Get.snackbar("Error Occured", "Please Try again");
      }
    } catch (e) {
      return e;
    }
  }
}
