// import 'package:fml/model/user.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:async';

// class UserPreferences {
//   Future<bool> saveUser(User user) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     prefs.setString("autoid", user.autoid);
//     prefs.setString("accesstoken", user.accesstoken);
//     prefs.setString("plantcode", user.plantcode);
//     prefs.setString("empcode", user.empcode);
//     prefs.setString("name", user.name);
//     prefs.setString("empstate", user.empstate);
//     prefs.setString("edtstate", user.edtstate);
//     prefs.setString("ptrtf", user.ptrtf);
//     prefs.setString("systemname", user.systemname);

//     print(user.accesstoken);

//     return prefs.commit();
//   }

//   Future<User> getUser() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     String autoid = prefs.getString("autoid");
//     String accesstoken = prefs.getString("accesstoken");
//     String plantcode = prefs.getString("plantcode");
//     String empcode = prefs.getString("empcode");
//     String name = prefs.getString("name");
//     String empstate = prefs.getString("empstate");
//     String edtstate = prefs.getString("edtstate");
//     String ptrtf = prefs.getString("ptrtf");
//     String systemname = prefs.getString("systemname");

//     return User(
//         autoid: autoid,
//         accesstoken: accesstoken,
//         plantcode: plantcode,
//         empcode: empcode,
//         name: name,
//         empstate: empstate,
//         edtstate: edtstate,
//         ptrtf: ptrtf,
//         systemname: systemname);
//   }

//   void removeUser() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     prefs.remove("autoid");
//     prefs.remove("accesstoken");
//     prefs.remove("plantcode");
//     prefs.remove("empcode");
//     prefs.remove("name");
//     prefs.remove("empstate");
//     prefs.remove("edtstate");
//     prefs.remove("ptrtf");
//     prefs.remove("systemname");
//   }

//   Future<String> getToken(args) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String token = prefs.getString("accesstoken");
//     return token;
//   }
// }
