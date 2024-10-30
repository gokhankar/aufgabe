import 'package:get/get.dart';
import "../services/database_service.dart";

class HomePageController extends GetxController {
  var loadingText = "".obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    initilizeDb();
    super.onInit();
  }

  void initilizeDb() async {
    isLoading(true);
    loadingText.value = "Accessing the database";
    try {
      await DatabaseService.instance.initialize();
      isLoading(false);
      loadingText.value = "";
    } catch (e) {
      loadingText.value = "A Database error occured : ${e.toString()}";
      return;
    }
  }
}
