import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyCP_Gwz3vLAxQOffoeV77fD3IjJ-n9DSIk',
            appId: '1:1090340328276:android:9c0935426415dab2d42ec1',
            messagingSenderId: '1090340328276',
            projectId: 'ecommerceapptotrial'
            ));
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
