import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal_matrix/controler/api_controler.dart';
import 'package:legal_matrix/model/article model.dart';

class Artiles_page extends GetView<ApiControler> {
  const Artiles_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<ApiControler>(ApiControler());
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => controller.isLoading.value
          ? Center(child: const CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Icon(Icons.library_books_sharp,
                            color: Color(0xFF393939), size: 30),
                        Text("Articles",
                            style: TextStyle(
                                color: Color(0xFF393939),
                                fontWeight: FontWeight.w700,
                                fontSize: 41)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                      height: h * 0.71,
                      child: ListView.builder(
                        itemCount: controller.sections.length,
                        itemBuilder: (context, index) {
                          final article = controller.sections[index];
                          return Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.symmetric(
                                vertical: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 4,
                                  blurRadius: 0.3,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "$article",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "30 Dec 2018 , 12:34",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF8B949E)),
                                  )
                                ],
                              ),
                              subtitle: Text(
                                '$sectionModel',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF8B949E),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )),
    );
  }
}
