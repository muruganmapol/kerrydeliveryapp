class User {
  String? autoid;
  String? accesstoken;
  String? plantcode;
  String? empcode;
  String? name;
  String? empstate;
  String? edtstate;
  String? ptrtf;
  String? systemname;

  User({
    this.autoid,
    this.accesstoken,
    this.plantcode,
    this.empcode,
    this.name,
    this.edtstate,
    this.empstate,
    this.ptrtf,
    this.systemname,
  });

  factory User.fromJson(Map responseData) {
    return User(
      autoid: responseData['autoid'],
      accesstoken: responseData['accesstoken'],
      plantcode: responseData['plantcode'],
      empcode: responseData['empcode'],
      name: responseData['name'],
      edtstate: responseData['edtstate'],
      empstate: responseData['empstate'],
      ptrtf: responseData['ptrtf'],
      systemname: responseData['systemname'],
    );
  }
}
