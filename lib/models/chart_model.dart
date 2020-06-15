class ChartModel {
  Since _since = Since.daily;
  int _type = 0;

  set type(type) => _type = type;
  set since(since) => _since = since;

  Since get since => _since;
  int get type => _type;
}

enum Since {
  daily,
  weekly,
  monthly,
}