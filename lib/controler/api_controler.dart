import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiControler extends GetxController {
  var isloading = true.obs;
  var currentSelectionIndex = 0.obs;
  var texteditingcontroller = TextEditingController();
  var isFailed = false.obs;

  @override
  onInit() {
    getContent(currentSelectionIndex.value + 1);
    super.onInit();

  }

  Future<void> getContent(int section_number) async {
    isloading.value = true;
    isFailed.value = false;
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    Map<String, String> body = {"section_number": section_number.toString()};

    const String userUrl =
        "https://ml-webscrapping.onrender.com/get_section_content";
    final response = await http.post(Uri.parse(userUrl),
        headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200) {
      // result variable has this data now.
      String result = jsonDecode(response.body)['section_content'];
      texteditingcontroller.text = result;
      isloading.value = false;
      isFailed.value = false;
    } else {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
      isFailed.value = true;
      isloading.value = false;
      
    }
  }
}
