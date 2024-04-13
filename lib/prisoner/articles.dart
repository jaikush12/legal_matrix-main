import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal_matrix/controler/api_controler.dart';
import 'package:multi_split_view/multi_split_view.dart';


class Artiles_page extends StatefulWidget {
  const Artiles_page({Key? key}) : super(key: key);

  @override
  State<Artiles_page> createState() => _Artiles_pageState();
}

class _Artiles_pageState extends State<Artiles_page> {
  var controller = Get.put(ApiControler());
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Row(
                          children: [
                            Icon(Icons.library_books_sharp,
                                color: Color(0xFF393939), size: 30),
                                SizedBox(width: 6,),
                            Text("Articles",
                                style: TextStyle(
                                    color: Color(0xFF393939),
                                    fontWeight: FontWeight.w700,)),
                          ],
                        ),
                        automaticallyImplyLeading: false,),
      backgroundColor: Colors.white,
       body: Obx(
         () =>  MultiSplitView(
          children: 
                      [Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Container(
                          height: h * 0.71,
                          child: ListView.builder(
                            itemCount: 14,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: (controller.currentSelectionIndex.value == index) ? Colors.white.withBlue(20) : Colors.white,
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
                                  onTap: () {
                                    controller.getContent(index + 1);
                                    controller.currentSelectionIndex.value = index;
                                  },
                                  title: Text(
                                        "Section ${index+1}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                  subtitle: Text(
                                        DateTime.now().toString(),
                                        
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF8B949E)),
                                      ),
                              ));
                            },
                          ),
  
                  ),
                ),
                (controller.isloading.value == false && controller.isFailed.value == false) ? SafeArea(child: TextField(maxLines: null, enabled: false, style: TextStyle(color: Colors.black), controller: controller.texteditingcontroller,)) : const Center(child: CircularProgressIndicator.adaptive(),),
          ]
         ),
       ),
    );
  }
}
