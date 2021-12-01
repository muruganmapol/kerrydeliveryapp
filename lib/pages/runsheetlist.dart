// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fml/model/runsheetdata_model.dart';
import 'package:fml/pages/gcnnumber.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Runsheetlist extends StatefulWidget {
  const Runsheetlist({Key? key,runsheetnos}) : super(key: key);

  @override
  _RunsheetlistState createState() => _RunsheetlistState();
}

class _RunsheetlistState extends State<Runsheetlist> {

  @override 
  Widget build(BuildContext context) {
       final litems = ModalRoute.of(context)!.settings.arguments as User;
      
       var runsheelist=litems.runsheetnos; 
    
       
return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 126, 61),
        centerTitle: true,
        title: const Text(
          "Runsheet List",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
<<<<<<< HEAD
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Color.fromARGB(255, 241, 241, 241),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.blue[900],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Gcnnumber()),
                    );
                  },
                  title: Text("RunSheet1"),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Color.fromARGB(255, 241, 241, 241),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.blue[900],
                  ),
                  title: Text("RunSheet1"),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Color.fromARGB(255, 241, 241, 241),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.blue[900],
                  ),
                  title: Text("RunSheet1"),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ],
=======
      body: ListView.builder(
        itemCount: runsheelist.length,
        itemBuilder: (BuildContext context,int index){
          return ListTile(
            leading: Icon(
                    Icons.list,
                    color: Colors.blue[900],
                  ),
                  title: Text(runsheelist[index]),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.orange,
                  ),

             onTap: () {
              var runsheetNo =  runsheelist[index];
               _getgcndata(runsheetNo);
                    
                    
                  },
            );
        }
>>>>>>> yuvarajmapol
        ),
    );       
  }
  void _getgcndata(runsheetNo) async {

    var url = Uri.parse("http://182.72.177.132/backend/public/api/getgcndata");
    Response response = await post(
       url,
        body: json.encode({
          "runsheet_no" : runsheetNo

        }),
         headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
      );
      if (response.statusCode==200) {
                 Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Gcnnumber(),
                  settings: RouteSettings(
                    arguments:User(gcndata :json.decode(response.body), runsheetnos: [])),
                  ),
            );
              
      }else{
        print("ERROR");
      }
  }
}
