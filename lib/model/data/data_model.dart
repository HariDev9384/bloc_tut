class DataModel {
   int? userId;
   int? id;
   String? title;

  DataModel({ this.userId,  this.id,  this.title});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
