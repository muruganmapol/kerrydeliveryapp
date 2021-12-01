// @dart=2.9
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'dart:ui' as ui;
import 'dart:async';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:edge_detection/edge_detection.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class Consignmentupdatescreen extends StatefulWidget {
  const Consignmentupdatescreen({Key key}) : super(key: key);

  @override
  _ConsignmentupdatescreenState createState() =>
      _ConsignmentupdatescreenState();
}

class _ConsignmentupdatescreenState extends State<Consignmentupdatescreen> {
  String _imagePath = 'Unknown';

  @override
  // void initState() {
  //   super.initState();
  //   initPlatformState();
  // }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String imagePath;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      imagePath = await EdgeDetection.detectEdge;

      final bytes = File(imagePath).readAsBytesSync();
      String img64 = base64Encode(bytes);

      base64Image = img64;
    } on PlatformException {
      imagePath = 'Failed to get cropped image path.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
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
  bool _paymentcheck = false;
  bool _paymentdd = false;
  bool _paymentneft = false;
  bool _reason = false;

  bool _pisVisible = true;
  List listItem = ["Pending", "Delivered", "RTO"];
  String valuechoose1;
  List listItem1 = [
    "Door Locked",
    "Party Not Avaliable",
    "Party Refused to Accept"
  ];
  String valuechoose2;
  List listItem2 = ["Receiver 1", "Receiver 2", "Receiver 3"];
  String valuechoose3;
  List listItem3 = ["Check", "DD", "NEFT", "None"];
  String valuechoose4;
  List listItem4 = ["Bank 1", "Bank 2", "Bank 3"];
  TextEditingController dateCtl = TextEditingController();
  TextEditingController dateCt2 = TextEditingController();
  TextEditingController docketno = TextEditingController();
  TextEditingController reason = TextEditingController();
  TextEditingController remarks = TextEditingController();

  TextEditingController Dmoblenumber = TextEditingController();
  TextEditingController oc_amount = TextEditingController();
  TextEditingController oe_amount = TextEditingController();
  TextEditingController ul_amount = TextEditingController();
  TextEditingController dl_amount = TextEditingController();
  TextEditingController pod_image = TextEditingController();
  TextEditingController e_signauture = TextEditingController();

  String base64Image;
  String base64sngImage;
  var currentSelectedValue;
  Future<File> file;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  String docket;

  @override
  initState() {
    // docketno.text = widget.GCN;
    // // print("Docket");
    // // print(docket);

    // super.initState();
    // _requestPermission();
  }

  chooseImage() {
    setState(() {
      // file = ImagePicker.pickImage(
      //   source: ImageSource.camera,
      //   imageQuality: 5,
      // );
    });
    // setStatus('');
  }

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
      print(result);
      _toastInfo(result.toString());

      final isSuccess = result['isSuccess'];
      signatureGlobalKey.currentState.clear();
      if (isSuccess) {
        // await Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (BuildContext context) {
        //       return Scaffold(
        //         appBar: AppBar(),
        //         body: Center(
        //           child: Container(
        //             color: Colors.grey[300],
        //             child: Image.memory(byteData.buffer.asUint8List()),
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // );
      }
    }
  }

  _toastInfo(String info) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(info),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    setState(() {
                      valuechoose = newvalue;
                      if (newvalue == "Delivered") {
                        _disVisible = true;
                        _reason = false;
                      } else if (newvalue == "Pending") {
                        _pisVisible = false;
                        _disVisible = false;
                        _reason = true;
                      } else if (newvalue == "RTO") {
                        _pisVisible = false;
                        _disVisible = false;
                        _reason = false;
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
              visible: _reason,
              child: SizedBox(height: 20),
            ),
            Visibility(
              visible: _reason,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                  child: DropdownButtonFormField(
                    icon: Visibility(
                        visible: false, child: Icon(Icons.arrow_downward)),
                    decoration: InputDecoration(
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
                    items: listItem1.map((valueitem1) {
                      return DropdownMenuItem(
                        value: valueitem1,
                        child: Text(valueitem1),
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
            // Visibility(
            //   visible: _disVisible,
            //   child: SizedBox(height: 20),
            // ),
            // Visibility(
            //   visible: _disVisible,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            //     child: Container(
            //       child: DropdownButtonFormField(
            //         decoration: InputDecoration(
            //           labelText: "RECEIVER TYPE",
            //           hintText: "Type",
            //           contentPadding: EdgeInsets.only(
            //             left: 42.0,
            //             top: 20.0,
            //             right: 12.0,
            //             bottom: 20.0,
            //           ),
            //           floatingLabelBehavior: FloatingLabelBehavior.always,
            //         ),
            //         isExpanded: true,
            //         value: valuechoose2,
            //         onChanged: (newvalue2) {
            //           setState(() {
            //             valuechoose2 = newvalue2;
            //           });
            //         },
            //         items: listItem2.map((valueitem2) {
            //           return DropdownMenuItem(
            //             value: valueitem2,
            //             child: Text(valueitem2),
            //           );
            //         }).toList(),
            //       ),
            //     ),
            //   ),
            // ),
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
                    controller: Dmoblenumber,
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
                    controller: oc_amount,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Other Collected Amount",
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
                    controller: oe_amount,
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
                          controller: ul_amount,
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
                          controller: dl_amount,
                          enabled: _deliveredcrgenable,
                          decoration: InputDecoration(
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
            // Visibility(
            //   visible: _disVisible,
            //   child: SizedBox(height: 20),
            // ),
            // Visibility(
            //   visible: _disVisible,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            //     child: Container(
            //       child: DropdownButtonFormField(
            //         decoration: InputDecoration(
            //           labelText: "Payment Type",
            //           hintText: "Status",
            //           contentPadding: EdgeInsets.only(
            //             left: 42.0,
            //             top: 20.0,
            //             right: 12.0,
            //             bottom: 20.0,
            //           ),
            //           floatingLabelBehavior: FloatingLabelBehavior.always,
            //         ),
            //         isExpanded: true,
            //         value: valuechoose3,
            //         onChanged: (newvalue) {
            //           setState(() {
            //             valuechoose3 = newvalue;
            //             if (newvalue == "Check") {
            //               _paymentcheck = true;
            //               _paymentdd = false;
            //             } else if (newvalue == "DD") {
            //               _paymentdd = true;
            //               _paymentcheck = false;
            //             } else if (newvalue == "NEFT") {
            //               _paymentneft = true;
            //               _paymentcheck = false;
            //               _paymentdd = false;
            //             }
            //           });
            //         },
            //         items: listItem3.map((valueitem) {
            //           return DropdownMenuItem(
            //             value: valueitem,
            //             child: Text(valueitem),
            //           );
            //         }).toList(),
            //       ),
            //     ),
            //   ),
            // ),
            // Visibility(
            //   visible: _paymentcheck,
            //   child: SizedBox(height: 20),
            // ),
            // Visibility(
            //   visible: _paymentcheck,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            //     child: Container(
            //       child: TextFormField(
            //         keyboardType: TextInputType.number,
            //         decoration: InputDecoration(
            //           labelText: "Check No.",
            //           hintText: "Number",
            //           floatingLabelBehavior: FloatingLabelBehavior.always,
            //           suffixIcon: Icon(Icons.confirmation_num),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Visibility(
            //   visible: _paymentcheck,
            //   child: SizedBox(height: 20),
            // ),
            // Visibility(
            //   visible: _paymentcheck,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            //     child: Container(
            //       child: TextFormField(
            //         controller: dateCt2,
            //         decoration: InputDecoration(
            //           labelText: "Check DATE",
            //           hintText: "Date",
            //           suffixIcon: Icon(Icons.date_range),
            //         ),
            //         onTap: () async {
            //           DateTime date = DateTime(1900);
            //           FocusScope.of(context).requestFocus(new FocusNode());

            //           date = await showDatePicker(
            //               context: context,
            //               initialDate: DateTime.now(),
            //               firstDate: DateTime(1900),
            //               lastDate: DateTime(2100));

            //           dateCt2.text = date.toString().substring(0, 10);
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            // Visibility(
            //   visible: _paymentcheck,
            //   child: SizedBox(height: 20),
            // ),
            // Visibility(
            //   visible: _paymentcheck,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            //     child: Container(
            //       child: DropdownButtonFormField(
            //         icon: Visibility(
            //             visible: false, child: Icon(Icons.arrow_downward)),
            //         decoration: InputDecoration(
            //           labelText: "Bank",
            //           hintText: "Enter your bank name",
            //           suffixIcon: Icon(Icons.arrow_drop_down),
            //           floatingLabelBehavior: FloatingLabelBehavior.always,
            //         ),
            //         isExpanded: true,
            //         value: valuechoose2,
            //         onChanged: (newvalue2) {
            //           setState(() {
            //             valuechoose2 = newvalue2;
            //           });
            //         },
            //         items: listItem2.map((valueitem2) {
            //           return DropdownMenuItem(
            //             value: valueitem2,
            //             child: Text(valueitem2),
            //           );
            //         }).toList(),
            //       ),
            //     ),
            //   ),
            // ),
            // Visibility(
            //   visible: _paymentdd,
            //   child: SizedBox(height: 20),
            // ),
            // Visibility(
            //   visible: _paymentdd,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            //     child: Container(
            //       child: TextFormField(
            //         keyboardType: TextInputType.number,
            //         decoration: InputDecoration(
            //           labelText: "DD  No.",
            //           hintText: "Enter your number",
            //           floatingLabelBehavior: FloatingLabelBehavior.always,
            //           suffixIcon: Icon(Icons.payment),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Visibility(
            //   visible: _paymentdd,
            //   child: SizedBox(height: 20),
            // ),
            // Visibility(
            //   visible: _paymentdd,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            //     child: Container(
            //       child: TextFormField(
            //         controller: dateCt2,
            //         decoration: InputDecoration(
            //           labelText: "DD  DATE",
            //           hintText: "Enter your date",
            //           suffixIcon: Icon(Icons.date_range),
            //         ),
            //         onTap: () async {
            //           DateTime date = DateTime(1900);
            //           FocusScope.of(context).requestFocus(new FocusNode());

            //           date = await showDatePicker(
            //               context: context,
            //               initialDate: DateTime.now(),
            //               firstDate: DateTime(1900),
            //               lastDate: DateTime(2100));

            //           dateCt2.text = date.toString().substring(0, 10);
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            // Visibility(
            //   visible: _paymentdd,
            //   child: SizedBox(height: 20),
            // ),
            // Visibility(
            //   visible: _paymentdd,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            //     child: Container(
            //       child: DropdownButtonFormField(
            //         icon: Visibility(
            //             visible: false, child: Icon(Icons.arrow_downward)),
            //         decoration: InputDecoration(
            //           labelText: "Bank",
            //           hintText: "Enter your bank name",
            //           suffixIcon: Icon(Icons.arrow_drop_down),
            //           floatingLabelBehavior: FloatingLabelBehavior.always,
            //         ),
            //         isExpanded: true,
            //         value: valuechoose2,
            //         onChanged: (newvalue2) {
            //           setState(() {
            //             valuechoose2 = newvalue2;
            //           });
            //         },
            //         items: listItem2.map((valueitem2) {
            //           return DropdownMenuItem(
            //             value: valueitem2,
            //             child: Text(valueitem2),
            //           );
            //         }).toList(),
            //       ),
            //     ),
            //   ),
            // ),
            // Visibility(
            //   visible: _paymentneft,
            //   child: SizedBox(height: 20),
            // ),
            // Visibility(
            //   visible: _paymentneft,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            //     child: Container(
            //       child: TextFormField(
            //         keyboardType: TextInputType.number,
            //         decoration: InputDecoration(
            //           labelText: "NEFT  No.",
            //           hintText: "Enter your number",
            //           floatingLabelBehavior: FloatingLabelBehavior.always,
            //           suffixIcon: Icon(Icons.payment),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Visibility(
            //   visible: _paymentneft,
            //   child: SizedBox(height: 20),
            // ),
            // Visibility(
            //   visible: _paymentneft,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            //     child: Container(
            //       child: TextFormField(
            //         controller: dateCt2,
            //         decoration: InputDecoration(
            //           labelText: "NEFT DATE",
            //           hintText: "Enter your date",
            //           suffixIcon: Icon(Icons.date_range),
            //         ),
            //         onTap: () async {
            //           DateTime date = DateTime(1900);
            //           FocusScope.of(context).requestFocus(new FocusNode());

            //           date = await showDatePicker(
            //               context: context,
            //               initialDate: DateTime.now(),
            //               firstDate: DateTime(1900),
            //               lastDate: DateTime(2100));

            //           dateCt2.text = date.toString().substring(0, 10);
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            // Visibility(
            //   visible: _paymentneft,
            //   child: SizedBox(height: 20),
            // ),
            // Visibility(
            //   visible: _paymentneft,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            //     child: Container(
            //       child: DropdownButtonFormField(
            //         icon: Visibility(
            //             visible: false, child: Icon(Icons.arrow_downward)),
            //         decoration: InputDecoration(
            //           labelText: "Bank",
            //           hintText: "Enter your bank name",
            //           suffixIcon: Icon(Icons.arrow_drop_down),
            //           floatingLabelBehavior: FloatingLabelBehavior.always,
            //         ),
            //         isExpanded: true,
            //         value: valuechoose4,
            //         onChanged: (newvalue4) {
            //           setState(() {
            //             valuechoose4 = newvalue4;
            //           });
            //         },
            //         items: listItem4.map((valueitem4) {
            //           return DropdownMenuItem(
            //             value: valueitem4,
            //             child: Text(valueitem4),
            //           );
            //         }).toList(),
            //       ),
            //     ),
            //   ),
            // ),
            // Visibility(
            //   visible: _disVisible,
            //   child: SizedBox(height: 20),
            // ),
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
                      // OutlineButton(
                      //     child: Text('Select Image'),
                      //     onPressed: () {
                      //       initPlatformState();
                      //     }),
                      Center(
                        child: new Text('Saved image path: $_imagePath\n'),
                      ),

                      // Text('Cropped image path: $_imagePath\n'),

                      // Image.file(File(_imagePath)),
                      //  showImage(),
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
                                    border: Border.all(color: Colors.grey)))),
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
                            child:
                                Text('Clear', style: TextStyle(fontSize: 20)),
                            onPressed: _handleClearButtonPressed,
                          )
                        ], mainAxisAlignment: MainAxisAlignment.spaceEvenly)
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                print("Data upload success in server!");
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue[900],
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
