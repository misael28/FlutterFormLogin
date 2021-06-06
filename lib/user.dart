class User{
  int? rowId;
  String name;
  String surName;

  User(this.name, this.surName);

  User.fromMap(Map<String, dynamic> map) :
    name = map['name'],
    surName = map['surname'],
    rowId = map['rowid'];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surname' : surName,
      'rowid' : rowId,
    };
  }
}