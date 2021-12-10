import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class Pickupgcninvoiceform extends StatefulWidget {
  const Pickupgcninvoiceform({Key? key}) : super(key: key);

  @override
  _PickupgcninvoiceformState createState() => _PickupgcninvoiceformState();
}

class _PickupgcninvoiceformState extends State<Pickupgcninvoiceform> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 126, 61),
        centerTitle: true,
        title: const Text(
          "Pickup GCN Invoice",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.orange[50],
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextFieldTags(
                            tagsStyler: TagsStyler(
                              tagTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              tagDecoration: BoxDecoration(
                                color: const Color.fromARGB(255, 6, 72, 172),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              tagCancelIcon: const Icon(Icons.cancel,
                                  size: 16.0,
                                  color: Color.fromARGB(255, 235, 214, 214)),
                              tagPadding: const EdgeInsets.all(10.0),
                            ),
                            textFieldStyler: TextFieldStyler(
                                helperText: '', hintText: 'Enter invoice'),
                            onTag: (tag) {},
                            onDelete: (tag) {},
                            validator: (tag) {
                              if (tag.length > 15) {
                                return "hey that's too long";
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          "GCN :  ",
                          style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.orange[50],
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: TextFieldTags(
                            tagsStyler: TagsStyler(
                              tagTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              tagDecoration: BoxDecoration(
                                color: const Color.fromARGB(255, 6, 72, 172),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              tagCancelIcon: const Icon(Icons.cancel,
                                  size: 16.0,
                                  color: Color.fromARGB(255, 235, 214, 214)),
                              tagPadding: const EdgeInsets.all(10.0),
                            ),
                            textFieldStyler: TextFieldStyler(
                                helperText: '', hintText: 'Enter invoice'),
                            onTag: (tag) {},
                            onDelete: (tag) {},
                            validator: (tag) {
                              if (tag.length > 15) {
                                return "hey that's too long";
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          "GCN :  ",
                          style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.orange[50],
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: TextFieldTags(
                            tagsStyler: TagsStyler(
                              tagTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              tagDecoration: BoxDecoration(
                                color: const Color.fromARGB(255, 6, 72, 172),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              tagCancelIcon: const Icon(Icons.cancel,
                                  size: 16.0,
                                  color: Color.fromARGB(255, 235, 214, 214)),
                              tagPadding: const EdgeInsets.all(10.0),
                            ),
                            textFieldStyler: TextFieldStyler(
                                helperText: '', hintText: 'Enter invoice'),
                            onTag: (tag) {},
                            onDelete: (tag) {},
                            validator: (tag) {
                              if (tag.length > 15) {
                                return "hey that's too long";
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          "GCN :  ",
                          style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.orange[50],
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: TextFieldTags(
                            tagsStyler: TagsStyler(
                              tagTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              tagDecoration: BoxDecoration(
                                color: const Color.fromARGB(255, 6, 72, 172),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              tagCancelIcon: const Icon(Icons.cancel,
                                  size: 16.0,
                                  color: Color.fromARGB(255, 235, 214, 214)),
                              tagPadding: const EdgeInsets.all(10.0),
                            ),
                            textFieldStyler: TextFieldStyler(
                                helperText: '', hintText: 'Enter invoice'),
                            onTag: (tag) {},
                            onDelete: (tag) {},
                            validator: (tag) {
                              if (tag.length > 15) {
                                return "hey that's too long";
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          "GCN :  ",
                          style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Card(
            //     color: Colors.orange[50],
            //     child: ListTile(
            //       title: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               "GCN  ",
            //               style: TextStyle(),
            //             ),
            //             SizedBox(
            //               height: 10, // default\minimum height
            //             ),
            //             Row(
            //               mainAxisSize: MainAxisSize.min,
            //               children: <Widget>[
            //                 Expanded(
            //                   flex: 2,
            //                   child: Text(
            //                     "Invoice",
            //                     style: TextStyle(),
            //                   ),
            //                 ),
            //                 Expanded(
            //                   flex: 4,
            //                   child: TextFieldTags(
            //                       tagsStyler: TagsStyler(
            //                           tagTextStyle: TextStyle(
            //                             fontWeight: FontWeight.normal,
            //                             color: Colors.black,
            //                           ),
            //                           tagDecoration: BoxDecoration(
            //                             color: Colors.white70,
            //                             borderRadius:
            //                                 BorderRadius.circular(5.0),
            //                           ),
            //                           tagCancelIcon: Icon(Icons.cancel,
            //                               size: 18.0, color: Colors.red),
            //                           tagPadding: const EdgeInsets.symmetric(
            //                               vertical: 8.0)),
            //                       textFieldStyler: TextFieldStyler(
            //                         contentPadding:
            //                             EdgeInsets.symmetric(vertical: 0.0),
            //                         textFieldEnabledBorder:
            //                             UnderlineInputBorder(
            //                           borderSide:
            //                               BorderSide(color: Colors.black),
            //                         ),
            //                         textFieldFocusedBorder:
            //                             UnderlineInputBorder(
            //                           borderSide:
            //                               BorderSide(color: Colors.black),
            //                         ),
            //                         textFieldBorder: const OutlineInputBorder(
            //                             borderSide:
            //                                 BorderSide(color: Colors.white)),
            //                         hintText: '',
            //                       ),
            //                       onTag: (tag) {},
            //                       onDelete: (tag) {}),
            //                 ),
            //               ],
            //             ),
            //             SizedBox(
            //               height: 10, // default\minimum height
            //             ),
            //           ]),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
