import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fml/model/gcn_model.dart';
import 'package:fml/model/runsheetdata_model.dart';
import 'package:fml/pages/consignmentupdatescreen.dart';

class Gcnnumber extends StatefulWidget {
  const Gcnnumber({Key? key}) : super(key: key);

  @override
  _GcnnumberState createState() => _GcnnumberState();
}

class _GcnnumberState extends State<Gcnnumber> {
  Widget build(BuildContext context) {
bool isButtonDisabled =false;
final litem = ModalRoute.of(context)!.settings.arguments as User;

 var consignment=litem.gcndata; 
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 126, 61),
        centerTitle: true,
        title: const Text(
          "GCN Number",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: ListView.builder(
                      itemCount: consignment.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Visibility(
                          
                        child: Card(
                          color: Colors.orange[50],
                          child: InkWell(
                            onTap: () {
                              if(consignment[index]['mob_gc_status'] == ' Delivery'){
                                    isButtonDisabled = true;
                                    showAlertDelivery(context);

                              }else{
                                     Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Consignmentupdatescreen(),
                  settings: RouteSettings(
                    arguments:Gcnmodel(docket_no: consignment[index]['consignmentID'], runsheet_id:consignment[index]['runsheet_id'])),
                  
                  ),
                );
                              }
                             
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    Text( 
                                      consignment[index]['consignmentID'].toString(),
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                    ),
                                    SizedBox(width: 15),
                                    Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: const [
                                              0.2,
                                              0.4,
                                            ],
                                            colors: <Color>[
                                              Colors.blue[500]!,
                                              Colors.blue[700]!,
                                            ],
                                          ),
                                          color: Colors.blue[900],
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child:  Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: Text(
                                           consignment[index]['mob_gc_status'].toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Container(
                                      // margin: const EdgeInsets.only(left: 100),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: const [
                                              0.2,
                                              0.4,
                                            ],
                                            colors: <Color>[
                                              Colors.orange[800]!,
                                              Colors.orange[600]!,
                                            ], // r
                                          ),
                                          color: Colors.blue[900],
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child:  Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: Text(
                                          consignment[index]['mob_booking']['mob_payment_name'].toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ]),
                                   Text(
                                    "Consignee :   " + consignment[index]['mob_booking']['consignee_name'].toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14),
                                  ),
                                   Text(
                                    "Address : " + consignment[index]['mob_booking']['consignee_address'].toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    "Pincode : " + consignment[index]['mob_booking']['consignee_pincode'].toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    "Mobile No : "+ consignment[index]['mob_booking']['consignee_phone_no'].toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ),
                      ),
                    )),
              ],
            ),
          )),
    );
  }

  showAlertDelivery(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
     },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("This Consignment Delivered"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


}
