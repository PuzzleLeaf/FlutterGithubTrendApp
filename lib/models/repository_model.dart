class RepositoryModel {
  String _author;
  String _name;
  String _avatar;
  String _url;
  String _description;
  String _language;
  String _languageColor;
  int _stars;
  int _forks;
  int _currentPeriodStars;
  List<BuiltBy> _builtBy;

  RepositoryModel({
    String author,
    String name,
    String avatar,
    String url,
    String description,
    String language,
    String languageColor,
    int stars,
    int forks,
    int currentPeriodStars,
    List<BuiltBy> builtBy,
  }) {
    this._author = author;
    this._name = name;
    this._avatar = avatar;
    this._url = url;
    this._description = description;
    this._language = language;
    this._languageColor = languageColor;
    this._stars = stars;
    this._forks = forks;
    this._currentPeriodStars = currentPeriodStars;
    this._builtBy = builtBy;
  }

  String get author => _author;

  String get name => _name;

  String get avatar => _avatar;

  String get url => _url;

  String get description => _description;

  String get language => _language;

  String get languageColor => _languageColor;

  int get stars => _stars;

  int get forks => _forks;

  int get currentPeriodStars => _currentPeriodStars;

  List<BuiltBy> get builtBy => _builtBy;

  RepositoryModel.fromJson(Map<String, dynamic> json) {
    _author = json['author'];
    _name = json['name'];
    _avatar = json['avatar'];
    _url = json['url'];
    _description = json['description'];
    _language = json['language'];
    _languageColor = json['languageColor'];
    _stars = json['stars'];
    _forks = json['forks'];
    _currentPeriodStars = json['currentPeriodStars'];
    if (json['builtBy'] != null) {
      _builtBy = new List<BuiltBy>();
      json['builtBy'].forEach((v) {
        _builtBy.add(new BuiltBy.fromJson(v));
      });
    }
  }
}

class BuiltBy {
  String _username;
  String _href;
  String _avatar;

  BuiltBy({String username, String href, String avatar}) {
    this._username = username;
    this._href = href;
    this._avatar = avatar;
  }

  String get username => _username;
  set username(String username) => _username = username;
  String get href => _href;
  set href(String href) => _href = href;
  String get avatar => _avatar;
  set avatar(String avatar) => _avatar = avatar;

  BuiltBy.fromJson(Map<String, dynamic> json) {
    _username = json['username'];
    _href = json['href'];
    _avatar = json['avatar'];
  }
}
