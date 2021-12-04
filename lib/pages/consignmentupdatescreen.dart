// @dart=2.9
// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fml/model/gcn_model.dart';
import 'package:fml/model/runsheetdata_model.dart';
import 'package:fml/pages/runsheetlist.dart';
import 'package:http/http.dart';
import 'dart:ui' as ui;
import 'dart:async';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:edge_detection/edge_detection.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'gcnnumber.dart';

class Consignmentupdatescreen extends StatefulWidget {
  const Consignmentupdatescreen({Key key}) : super(key: key);

  @override
  _ConsignmentupdatescreenState createState() =>
      _ConsignmentupdatescreenState();
}

class _ConsignmentupdatescreenState extends State<Consignmentupdatescreen> {
  String _imagePath = 'Unknown';

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String imagePath;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      imagePath = await EdgeDetection.detectEdge;

      final bytes = File(imagePath).readAsBytesSync();
      String img64 = base64Encode(bytes);

      base64Image = img64;

      // final response = await http.post("",
      //     body: <String, dynamic>{
      //       "ConsignmentId":docketno.text,
      //       "POD_Image": base64Image
      //     });

      // if (response.statusCode == 200) {
      //   final snackBar = SnackBar(content: Text('Scaned Successfully'));
      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // } else {
      //   print("Scaned Failed !");
      // }
    } on PlatformException {
      imagePath = 'Failed to get cropped image path.';
    }

    if (!mounted) return;

    setState(() {
      _imagePath = imagePath;
    });
  }

  Image currentPreviewImage;

  final timeController = TextEditingController();
  String valuechoose;
  bool _disVisible = false;
  bool _textisVisible = false;
  bool _unloadingenable = false;
  bool _deliveredcrgenable = false;
  bool _reason = false;
  bool _rtoreason = false;
  bool _pisVisible = true;
  List listItem = ["Pending", "Delivered", "RTO"];
  String valuechoose1;
  String valuechoose5;
  List listItem1 = [
    "Door Locked",
    "Party Not Avaliable",
    "Party Refused to Accept"
  ];

  List listItem5 = ["REASON 1", "REASON 2", "REASON 3"];

  List reason_data = [];

  String valuechoose2;
  List listItem2 = ["Receiver 1", "Receiver 2", "Receiver 3"];
  String valuechoose3;
  List listItem3 = ["Check", "DD", "NEFT", "None"];
  String valuechoose4;
  List listItem4 = ["Bank 1", "Bank 2", "Bank 3"];

  TextEditingController status = TextEditingController();
  TextEditingController docketno = TextEditingController();
  TextEditingController runsheetid = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController dateCt2 = TextEditingController();
  TextEditingController reason = TextEditingController();
  TextEditingController remarks = TextEditingController();
  TextEditingController rtoreason = TextEditingController();
  TextEditingController reason_id = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController dmoblenumber = TextEditingController();
  TextEditingController ocamount = TextEditingController();
  TextEditingController oeamount = TextEditingController();
  TextEditingController ulamount = TextEditingController();
  TextEditingController dlamount = TextEditingController();
  TextEditingController podimage = TextEditingController();
  TextEditingController esignauture = TextEditingController();

  TextEditingController test = TextEditingController();

  String base64Image;
  String base64sngImage;
  Future<File> file;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  String docket;
  String PodImageDoc;

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());

          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

// -------------------------SIGNATURE CODE------------------------------

  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  @override
  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    final info = statuses[Permission.storage].toString();
    print(info);
    _toastInfo(info);
  }

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState.clear();
  }

  void _handleSaveButtonPressed() async {
    RenderSignaturePad boundary = signatureGlobalKey.currentContext
        .findRenderObject() as RenderSignaturePad;
    ui.Image image = await boundary.toImage();
    ByteData byteData = await (image.toByteData(format: ui.ImageByteFormat.png)
        as FutureOr<ByteData>);
    if (byteData != null) {
      final time = DateTime.now().millisecond;
      final name = "signature_$time.png";
      final result = await ImageGallerySaver.saveImage(
          byteData.buffer.asUint8List(),
          quality: 100,
          name: name);
      File file11 = new File("storage/emulated/0/Pictures/" + name + ".jpg");
      base64sngImage = base64Encode(file11.readAsBytesSync());
      esignauture.text = base64sngImage;

      print(result);
      _toastInfo(result.toString());

      final isSuccess = result['isSuccess'];
      signatureGlobalKey.currentState.clear();
      if (isSuccess) {}
    }
  }

  _toastInfo(String info) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(info),
    ));
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments as Gcnmodel;
    runsheetid.text = data.runsheet_id;
    docketno.text = data.docket_no;
    return Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 238, 126, 61),
            centerTitle: true,
            title: const Text(
              "Consignment Update Screen",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: "GCN STATUS",
                        hintText: "Enter your status",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      isExpanded: true,
                      value: valuechoose,
                      onChanged: (newvalue) {
                        status.text = newvalue;
                        get_reason();

                        setState(() {
                          valuechoose = newvalue;
                          if (newvalue == "Delivered") {
                            _disVisible = true;
                            _reason = false;
                            _rtoreason = false;
                          } else if (newvalue == "Pending") {
                            _pisVisible = false;
                            _disVisible = false;
                            _rtoreason = false;
                            _reason = true;
                          } else if (newvalue == "RTO") {
                            _pisVisible = false;
                            _disVisible = false;
                            _reason = false;
                            _rtoreason = true;
                          }
                        });
                      },
                      items: listItem.map((valueitem) {
                        return DropdownMenuItem(
                          value: valueitem,
                          child: Text(valueitem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Visibility(
                  visible: _rtoreason,
                  child: SizedBox(height: 20),
                ),
                Visibility(
                  visible: _rtoreason,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      child: DropdownButtonFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        icon: const Visibility(
                            visible: false, child: Icon(Icons.arrow_downward)),
                        decoration: const InputDecoration(
                          labelText: "REASON",
                          hintText: "Enter your reason",
                          suffixIcon: Icon(Icons.arrow_drop_down),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        isExpanded: true,
                        value: valuechoose5,
                        onChanged: (newvalue1) {
                          setState(() {
                            valuechoose5 = newvalue1;
                            rtoreason.text = valuechoose5;
                          });
                        },
                        items: reason_data.map((value) {
                          reason_id.text = value['id'].toString();
                          return DropdownMenuItem(
                            value: value['id'],
                            child: Text(value['name']),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _reason,
                  child: SizedBox(height: 20),
                ),
                Visibility(
                  visible: _reason,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      child: DropdownButtonFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        icon: const Visibility(
                            visible: false, child: Icon(Icons.arrow_downward)),
                        decoration: const InputDecoration(
                          labelText: "REASON",
                          hintText: "Enter your reason",
                          suffixIcon: Icon(Icons.arrow_drop_down),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        isExpanded: true,
                        value: valuechoose1,
                        onChanged: (newvalue1) {
                          setState(() {
                            valuechoose1 = newvalue1;
                            reason.text = valuechoose1;
                          });
                        },
                        items: reason_data.map((value) {
                          reason_id.text = value['id'].toString();
                          return DropdownMenuItem(
                            value: value['id'],
                            child: Text(value['name']),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _reason,
                  child: SizedBox(height: 20),
                ),
                Visibility(
                  visible: _reason,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        controller: remarks,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "REMARKS",
                            hintText: "enter your remarks",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(Icons.list_alt_sharp)),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _disVisible,
                  child: SizedBox(height: 20),
                ),
                Visibility(
                  visible: _disVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        controller: dateCtl,
                        decoration: InputDecoration(
                          labelText: "DELIVERY DATE",
                          hintText: "Date",
                          suffixIcon: Icon(Icons.date_range),
                        ),
                        onTap: () async {
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(new FocusNode());

                          date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));

                          dateCtl.text = date.toString().substring(0, 10);
                        },
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _disVisible,
                  child: SizedBox(height: 20),
                ),
                Visibility(
                  visible: _disVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        readOnly: true,
                        controller: timeController,
                        decoration: InputDecoration(
                          labelText: "DELIVERY TIME",
                          hintText: "Time",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: Icon(Icons.timelapse),
                        ),
                        onTap: () async {
                          var time = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );
                          timeController.text = time.format(context);
                        },
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _disVisible,
                  child: SizedBox(height: 20),
                ),
                Visibility(
                  visible: _disVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        controller: name,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: "Receiver Name",
                            hintText: "Name",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(Icons.phone_android)),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _disVisible,
                  child: SizedBox(height: 20),
                ),
                Visibility(
                  visible: _disVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        controller: dmoblenumber,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Mobile Number",
                            hintText: "Number",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(Icons.phone_android)),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _disVisible,
                  child: SizedBox(height: 20),
                ),
                Visibility(
                  visible: _disVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        controller: ocamount,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Collected Amount",
                            hintText: "Amount",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(Icons.attach_money)),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _disVisible,
                  child: SizedBox(height: 20),
                ),
                Visibility(
                  visible: _disVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        controller: oeamount,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Other Expensive Amount",
                            hintText: "Amount",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(Icons.attach_money)),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _disVisible,
                  child: SizedBox(height: 20),
                ),
                Visibility(
                  visible: _disVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          width: 25,
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _textisVisible,
                            onChanged: (bool priceupdateValue) {
                              setState(() {
                                _unloadingenable = true;
                                _textisVisible = priceupdateValue;
                              });
                            },
                          ),
                        )),
                        Flexible(
                          flex: 11,
                          child: Visibility(
                            visible: true,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                              },
                              controller: ulamount,
                              enabled: _unloadingenable,
                              decoration: InputDecoration(
                                  labelText: "Unloading Charge",
                                  hintText: "Charge",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  suffixIcon: Icon(Icons.attach_money)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: _disVisible,
                  child: SizedBox(height: 20),
                ),
                Visibility(
                  visible: _disVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          width: 25,
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _deliveredcrgenable,
                            onChanged: (bool priceupdateValue) {
                              setState(() {
                                _deliveredcrgenable = true;
                                _deliveredcrgenable = priceupdateValue;
                              });
                            },
                          ),
                        )),
                        Flexible(
                          flex: 11,
                          child: Visibility(
                            visible: true,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                              },
                              controller: dlamount,
                              enabled: _deliveredcrgenable,
                              decoration: const InputDecoration(
                                  labelText: "Delivered Charge",
                                  hintText: "Charge",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  suffixIcon: Icon(Icons.attach_money)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Visibility(
                  visible: _disVisible,
                  child: Center(
                      child: Text('POD IMAGES',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Colors.orange[900]))),
                ),
                Visibility(
                  visible: _disVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: RaisedButton(
                            onPressed: () {
                              initPlatformState();
                            },
                            child: Text("START SCANNING"),
                          )),
                          Center(
                            child: new Text('Saved image path: $_imagePath\n'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _disVisible,
                  child: SizedBox(height: 20),
                ),
                Visibility(
                  visible: _disVisible,
                  child: Center(
                      child: Text(
                    'E - SIGNATURE',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.orange[900]),
                  )),
                ),
                Visibility(
                  visible: _disVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                    child: SfSignaturePad(
                                        key: signatureGlobalKey,
                                        backgroundColor: Colors.white,
                                        strokeColor: Colors.black,
                                        minimumStrokeWidth: 3.0,
                                        maximumStrokeWidth: 6.0),
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.grey)))),
                            SizedBox(height: 10),
                            Row(children: <Widget>[
                              TextButton(
                                child: Text(
                                  'Save As Image',
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: _handleSaveButtonPressed,
                              ),
                              TextButton(
                                child: Text('Clear',
                                    style: TextStyle(fontSize: 20)),
                                onPressed: _handleClearButtonPressed,
                              )
                            ], mainAxisAlignment: MainAxisAlignment.spaceEvenly)
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _getgcndata();
                      update_get_runsheet();

                      print("Data upload success in server!");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue[900],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 12),
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ));
  }

  void get_reason() async {
    print(status.text);
    var url = Uri.parse("http://182.72.177.132/backend/public/api/getreason");
    Response response = await post(
      url,
      body: json.encode({"reason_type": status.text}),
      headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
    );
    print(response.body);
    setState(() {
      reason_data = json.decode(response.body);
    });
  }

  void update_get_runsheet() async {
    dynamic data_number = await FlutterSession().get("phone_number");
    var url =
        Uri.parse("http://182.72.177.132/backend/public/api/getrunsheetnumber");
    Response response = await post(
      url,
      body: json.encode({"phone_no": data_number}),
      headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
    );
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Runsheetlist(),
          settings: RouteSettings(
              arguments:
                  User(runsheetnos: json.decode(response.body), gcndata: [])),
        ),
      );
    }
  }

  void _getgcndata() async {
    var url =
        Uri.parse("http://182.72.177.132/backend/public/api/gcndataupdata");
    Response response = await post(
      url,
      body: json.encode({
        "delivery_status": status.text,
        "runsheet_id": runsheetid.text,
        "consignment_id": docketno.text,
        "pending_reason": reason.text,
        "pending_remark": remarks.text,
        "delivery_date": dateCtl.text,
        "Dtime": timeController.text,
        "receiver_name": name.text,
        "delivery_mobile_number": dmoblenumber.text,
        "collected_amount": ocamount.text,
        "Other_expensive_amount": oeamount.text,
        "unloading_charge": ulamount.text,
        "delivery_charge": dlamount.text,
        "pod_image": podimage.text,
        "signature": esignauture.text,
        "rto_reason": rtoreason.text,
        "reason_id": reason_id.text
      }),
      headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
    );
    print(response.body);
  }
}
