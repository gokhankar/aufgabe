// import 'package:aufgabe/models/sorte_model.dart';
// import "../services/database_service.dart";

// import 'package:get/get.dart';

// class SorteController extends GetxController {
//   var sorteList = <SorteModel>[].obs;
//   var sorteListText = "Sorte list is being created".obs;
//   var sorteModel = SorteModel().obs;

//   @override
//   void onInit() async {
//     await Future.delayed(const Duration(seconds: 5), () {});
//     getSortenList();
//     super.onInit();
//   }

//   Future getSortenList() async {
//     // print("getPlatzList called");
//     sorteListText.value = "Sorte list is being created";
//     sorteList.clear();
//     var result = await DatabaseService.instance.getSortenList();
//     // print("controller getSortenList: ${result}");
//     sorteList.addAll(result);
//     sorteList.refresh();
//     if (sorteList.isEmpty) sorteListText.value = "Sorten list is empty";
//   }
// }
