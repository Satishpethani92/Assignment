class ProductAddArgument{
  String? previousScreen;
  ProductModel? productModel;
  int? index;
  ProductAddArgument({this.previousScreen, this.productModel , this.index});
  
}
class ProductModel {
  int? id;
  String? name;
  String? launchedAt;
  String? launchSite;
  double? popularity;

  ProductModel(
      {this.id, this.name, this.launchedAt, this.launchSite, this.popularity});


  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'],
      name: json['name'],
      launchedAt: json['launchedAt'],
      launchSite: json['launchSite'],
      popularity: json['popularity']);

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'launchedAt': launchedAt,
    'launchSite': launchSite,
    'popularity': popularity
  };
}

