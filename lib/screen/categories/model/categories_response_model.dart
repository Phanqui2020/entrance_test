class CategoriesResponseModel {
  CategoriesResponseModel({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.name ,
      this.isSelected = false,});

  CategoriesResponseModel.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
  }
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  bool isSelected = false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['name'] = name;
    return map;
  }

}