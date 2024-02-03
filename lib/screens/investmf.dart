// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, sort_child_properties_last, avoid_unnecessary_containers, unnecessary_new

// import 'package:app1/main.dart';
// import 'package:app1/models/fdmodel.dart';
// import 'package:app1/models/mfmodel.dart';
// import 'package:app1/models/mfmodel2.dart';
// import 'package:app1/models/mfmodel3.dart';
// import 'package:app1/models/remote_services.dart';
// import 'package:app1/screens/navigator.dart';
// import 'package:app1/screens/splashscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// Future<List<MFNAV>?> getMF() async {
//   var client = http.Client();

//   var uri = Uri.parse(
//       'https://latest-mutual-fund-nav.p.rapidapi.com/fetchLatestNAV?SchemeType=Open%20Ended%20Schemes');
//   var response = await client.get(uri, headers: {
//     'X-RapidAPI-Key': 'be32dc0dd5msh8ba1a495a126990p177ec6jsndeafd301c064',
//     'X-RapidAPI-Host': 'latest-mutual-fund-nav.p.rapidapi.com'
//   });
//   if (response.statusCode == 200) {
//     var json = response.body;
//     return MFNAVFromJson(json);
//   }
//   return null;
// }

// Future<FDs?> getFD() async {
//   var client = http.Client();

//   var uri = Uri.parse('https://api.kuvera.in/fixed_deposit/api/v1/plans.json');
//   var response = await client.get(uri);

//   if (response.statusCode == 200) {
//     var json = response.body;
//     return FDsFromJson(json);
//   }
//   return null;
// }

// class InvestMFPage extends StatefulWidget {
//   const InvestMFPage({super.key});

//   @override
//   State<InvestMFPage> createState() => _InvestMFPageState();
// }

// class _InvestMFPageState extends State<InvestMFPage> {
//   var selec = 0;

//   @override
//   void initState() {
//     super.initState();
//     Provider.of<FD>(context, listen: false).getPosts();
//     Provider.of<FD>(context, listen: false).getMF();
//   }

//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return await Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => NavPage(
//                       pageIndex: 0,
//                     )));
//       },
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: SafeArea(
//           child: Column(
//             children: [
//               Container(
//                   child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 20.0, right: 20, top: 0, bottom: 0),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       child: Column(
//                         children: [
//                           SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 8.0),
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         selec = 0;
//                                       });
//                                     },
//                                     child: Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 20, vertical: 10),
//                                       decoration: BoxDecoration(
//                                           border: (selec == 0)
//                                               ? Border(
//                                                   bottom: BorderSide(
//                                                       width: 0.5,
//                                                       color: Colors.blue))
//                                               : Border(
//                                                   bottom: BorderSide(
//                                                       width: 0.5,
//                                                       color: Colors.black))),
//                                       child: Text(
//                                         "Fixed Deposits",
//                                         style: GoogleFonts.ubuntu(
//                                             fontSize: 16,
//                                             color: (selec == 0)
//                                                 ? Colors.blue
//                                                 : Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       selec = 1;
//                                     });
//                                   },
//                                   child: Container(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 20, vertical: 10),
//                                     decoration: BoxDecoration(
//                                         border: (selec == 1)
//                                             ? Border(
//                                                 bottom: BorderSide(
//                                                     width: 0.5,
//                                                     color: Colors.blue))
//                                             : Border(
//                                                 bottom: BorderSide(
//                                                     width: 0.5,
//                                                     color: Colors.black))),
//                                     child: Text(
//                                       "Mutual Funds",
//                                       style: GoogleFonts.ubuntu(
//                                           fontSize: 16,
//                                           color: (selec == 1)
//                                               ? Colors.blue
//                                               : Colors.white),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   if (selec == 0) ...[
//                     Container(
//                         height: MediaQuery.of(context).size.height / 1.37,
//                         child: Consumer<FD>(
//                             builder: (context, snapshot, _) => (snapshot
//                                         .fdlist !=
//                                     null)
//                                 ? SingleChildScrollView(
//                                     physics: BouncingScrollPhysics(),
//                                     child: ListView.builder(
//                                         shrinkWrap: true,
//                                         physics: NeverScrollableScrollPhysics(),
//                                         scrollDirection: Axis.vertical,
//                                         itemCount: snapshot.fdlist!.data.length,
//                                         itemBuilder: ((context, index) {
//                                           return Padding(
//                                             padding: const EdgeInsets.only(
//                                                 left: 8.0, bottom: 20),
//                                             child: Card(
//                                               color: Color.fromRGBO(
//                                                   186, 201, 255, 0.1),
//                                               elevation: 1,
//                                               child: Container(
//                                                 padding: EdgeInsets.only(
//                                                     left: 10, right: 10),
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width /
//                                                     1.25,
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height /
//                                                     5,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                     border:
//                                                         Border.all(width: 0.2)),
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceAround,
//                                                   children: [
//                                                     Row(
//                                                       children: [
//                                                         Container(
//                                                           padding:
//                                                               EdgeInsets.all(8),
//                                                           decoration:
//                                                               BoxDecoration(
//                                                             color: Colors
//                                                                 .grey.shade100,
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         10),
//                                                             //  border: Border.all(color: Colors.black, width: 1)
//                                                           ),
//                                                           child: Image(
//                                                               image: AssetImage(
//                                                                   "assets/images/invest.png"),
//                                                               height: MediaQuery.of(
//                                                                           context)
//                                                                       .size
//                                                                       .height /
//                                                                   20),
//                                                         ),
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .only(
//                                                                   left: 10.0),
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Text(
//                                                                   snapshot
//                                                                       .fdlist!
//                                                                       .data[
//                                                                           index]
//                                                                       .attributes
//                                                                       .name,
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           18,
//                                                                       color: Colors
//                                                                           .white,
//                                                                       fontFamily:
//                                                                           'Anderson',
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w700)),
//                                                               Text(
//                                                                 "Type: Fixed Deposit",
//                                                                 style: GoogleFonts
//                                                                     .ubuntu(
//                                                                         color: Colors
//                                                                             .grey),
//                                                               )
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Column(
//                                                           children: [
//                                                             Text(
//                                                               "Interest Rate",
//                                                               style: GoogleFonts
//                                                                   .ubuntu(
//                                                                       color: Colors
//                                                                           .grey
//                                                                           .shade600,
//                                                                       fontSize:
//                                                                           12),
//                                                             ),
//                                                             Text(
//                                                               "${snapshot.fdlist!.data[index].attributes.interestRate}%",
//                                                               style: GoogleFonts.ubuntu(
//                                                                   color: Color
//                                                                       .fromRGBO(
//                                                                           186,
//                                                                           201,
//                                                                           255,
//                                                                           1),
//                                                                   fontSize: 18),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         Column(
//                                                           children: [
//                                                             Text(
//                                                               "Min Amount",
//                                                               style: GoogleFonts
//                                                                   .ubuntu(
//                                                                       color: Colors
//                                                                           .grey
//                                                                           .shade600,
//                                                                       fontSize:
//                                                                           12),
//                                                             ),
//                                                             Text(
//                                                               "₹${snapshot.fdlist!.data[index].attributes.minAmount}",
//                                                               style: GoogleFonts.ubuntu(
//                                                                   color: Color
//                                                                       .fromRGBO(
//                                                                           186,
//                                                                           201,
//                                                                           255,
//                                                                           1),
//                                                                   fontSize: 18),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         Container(
//                                                           padding:
//                                                               EdgeInsets.all(
//                                                                   10),
//                                                           decoration: BoxDecoration(
//                                                               color: Colors
//                                                                   .lightBlue
//                                                                   .shade50,
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           5)),
//                                                           child: Row(
//                                                             children: [
//                                                               Text(
//                                                                 snapshot
//                                                                     .fdlist!
//                                                                     .data[index]
//                                                                     .attributes
//                                                                     .tenureFromInMonths
//                                                                     .toString(),
//                                                                 style:
//                                                                     GoogleFonts
//                                                                         .ubuntu(
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w500,
//                                                                 ),
//                                                               ),
//                                                               Text(
//                                                                 " Months",
//                                                                 style:
//                                                                     GoogleFonts
//                                                                         .ubuntu(
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w500,
//                                                                 ),
//                                                               )
//                                                             ],
//                                                           ),
//                                                         )
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         })),
//                                   )
//                                 : Center(
//                                     child: Container(
//                                         height:
//                                             MediaQuery.of(context).size.height /
//                                                 15,
//                                         child: CircularProgressIndicator()))))
//                   ] else if (selec == 1) ...[
//                     Container(
//                         height: MediaQuery.of(context).size.height / 1.37,
//                         child: Consumer<FD>(
//                             builder: (context, snapshot, _) => (snapshot
//                                         .mfnavlist !=
//                                     null)
//                                 ? SingleChildScrollView(
//                                     child: ListView.builder(
//                                         shrinkWrap: true,
//                                         physics: BouncingScrollPhysics(),
//                                         scrollDirection: Axis.vertical,
//                                         itemCount: 40,
//                                         itemBuilder: ((context, index) {
//                                           return Padding(
//                                             padding: const EdgeInsets.all(8),
//                                             child: Container(
//                                               height: MediaQuery.of(context)
//                                                       .size
//                                                       .height /
//                                                   5,
//                                               decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(5),
//                                                   color: Color.fromRGBO(
//                                                       186, 201, 255, 0.1)),
//                                               child: Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(8.0),
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceAround,
//                                                   children: [
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceAround,
//                                                       children: [
//                                                         Container(
//                                                           padding:
//                                                               EdgeInsets.all(8),
//                                                           decoration:
//                                                               BoxDecoration(
//                                                             color: Colors
//                                                                 .grey.shade100,
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         10),
//                                                             //  border: Border.all(color: Colors.black, width: 1)
//                                                           ),
//                                                           child: Image(
//                                                               image: AssetImage(
//                                                                   "assets/images/invest.png"),
//                                                               height: MediaQuery.of(
//                                                                           context)
//                                                                       .size
//                                                                       .height /
//                                                                   20),
//                                                         ),
//                                                         Container(
//                                                           width: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width /
//                                                               1.5,
//                                                           child: Text(
//                                                             snapshot
//                                                                 .mfnavlist![
//                                                                     index]
//                                                                 .schemeName,
//                                                             style: TextStyle(
//                                                                 fontSize: 15,
//                                                                 color: Colors
//                                                                     .white,
//                                                                 fontFamily:
//                                                                     'Anderson',
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w700),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Column(
//                                                           children: [
//                                                             Text(
//                                                                 "Net Asset Val",
//                                                                 style: GoogleFonts.ubuntu(
//                                                                     color: Colors
//                                                                         .grey
//                                                                         .shade600,
//                                                                     fontSize:
//                                                                         12)),
//                                                             Text(
//                                                                 "₹" +
//                                                                     snapshot
//                                                                         .mfnavlist![
//                                                                             index]
//                                                                         .netAssetValue,
//                                                                 style: GoogleFonts.ubuntu(
//                                                                     color: Color
//                                                                         .fromRGBO(
//                                                                             186,
//                                                                             201,
//                                                                             255,
//                                                                             1),
//                                                                     fontSize:
//                                                                         16)),
//                                                           ],
//                                                         ),
//                                                         Column(
//                                                           children: [
//                                                             Text("As on",
//                                                                 style: GoogleFonts.ubuntu(
//                                                                     color: Colors
//                                                                         .grey
//                                                                         .shade600,
//                                                                     fontSize:
//                                                                         12)),
//                                                             Text(
//                                                                 snapshot
//                                                                     .mfnavlist![
//                                                                         index]
//                                                                     .date,
//                                                                 style: GoogleFonts.ubuntu(
//                                                                     color: Color
//                                                                         .fromRGBO(
//                                                                             186,
//                                                                             201,
//                                                                             255,
//                                                                             1),
//                                                                     fontSize:
//                                                                         16)),
//                                                           ],
//                                                         ),
//                                                         Container(
//                                                           padding:
//                                                               EdgeInsets.all(5),
//                                                           decoration: BoxDecoration(
//                                                               color: Colors
//                                                                   .lightBlue
//                                                                   .shade50,
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           5)),
//                                                           child: Column(
//                                                             children: [
//                                                               Text(
//                                                                   "Scheme Code",
//                                                                   style: GoogleFonts.ubuntu(
//                                                                       color: Colors
//                                                                           .grey
//                                                                           .shade900,
//                                                                       fontSize:
//                                                                           10)),
//                                                               Text(
//                                                                   snapshot
//                                                                       .mfnavlist![
//                                                                           index]
//                                                                       .schemeCode,
//                                                                   style: GoogleFonts.ubuntu(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                           14)),
//                                                             ],
//                                                           ),
//                                                         )
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         })),
//                                   )
//                                 : Center(
//                                     child: Image(
//                                     image: AssetImage(
//                                         "assets/images/loading3.gif"),
//                                   )))),
//                   ],
//                 ],
//               )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
