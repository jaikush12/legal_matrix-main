class sectionModel {
  String? section_number;
  sectionModel({this.section_number});

  sectionModel.fromJson(Map<String, dynamic> json) {
    section_number = json['section_number'];
  }
}
