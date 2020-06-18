class RepositoryLanguageModel {
  String urlParam;
  String name;
  String color;

  RepositoryLanguageModel({this.urlParam = '', this.name = 'All', this.color = "#000000"});

  factory RepositoryLanguageModel.fromJson(Map<String, dynamic> json) {
    return RepositoryLanguageModel(
      urlParam: json["urlParam"],
      name: json["name"],
      color: json["color"],
    );
  }
}