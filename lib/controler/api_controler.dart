import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:legal_matrix/model/article%20model.dart';

class ApiControler extends GetxController {
  var sections = <sectionModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }

  Future<void> getUsers() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    Map<String, String> body = {"section_number": "3"};

    const String userUrl =
        "https://ml-webscrapping.onrender.com/get_section_content";
    final response = await http.post(Uri.parse(userUrl),
        headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200) {
      // result variable has this data now.
      String result = jsonDecode(response.body)['section_content'];
      print("API Response: $result");
      // sections.value = result.map((e) => sectionModel.fromJson(e)).toList();
      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
