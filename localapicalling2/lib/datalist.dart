class datalist {
  int? id;
  String? name;
  String? category;

  datalist({this.id, this.name, this.category});
  datalist.formjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
  }
}
