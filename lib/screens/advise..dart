// import 'dart:convert';
// import 'dart:math';
//
// import 'package:app1/models/firebaseCalls.dart';
// import 'package:app1/models/llm.dart';
// import 'package:app1/models/stockmodel.dart';
// import 'package:app1/screens/homepage2.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:http/http.dart' as http;
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import '../models/fdmodel.dart';
// import 'placeholder.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// // 019Q5HJMOHIRHH8M
// String data = "";
// String metaData = "";
// String lastUpdated = "";
// List<MostActivelyTraded> topGainers = [];
// List<MostActivelyTraded> topLosers = [];
// List<MostActivelyTraded> mostActivelyTraded = [];
// late Stocks _stocks;
// int flag = 0;
// Future<Stocks?> getStocks() async {
//   var client = http.Client();
//
//   var uri = Uri.parse(
//       'https://www.alphavantage.co/query?function=TOP_GAINERS_LOSERS&apikey=019Q5HJMOHIRHH8M');
//   var response = await client.get(uri);
//
//   if (response.statusCode == 200) {
//     var json = response.body;
//     _stocks = stocksFromJson(json);
//     print(_stocks.topGainers);
//     return _stocks;
//   }
//   return null;
// }
//
// List<MostActivelyTraded> selectRandomStocks(
//     List<MostActivelyTraded> stocksList, int count) {
//   List<MostActivelyTraded> selectedStocks = [];
//
//   // Ensure that the count of stocks to select is not greater than the number of stocks available
//   if (count > stocksList.length) {
//     count = stocksList.length;
//   }
//
//   // Shuffle the list to ensure randomness
//   stocksList.shuffle();
//
//   // Select 'count' number of stocks from the shuffled list
//   for (int i = 0; i < count; i++) {
//     selectedStocks.add(stocksList[i]);
//   }
//   print(selectedStocks);
//   return selectedStocks;
// }
//
// class AdvisePage extends StatefulWidget {
//   final String question;
//   const AdvisePage({super.key, required this.question});
//
//   @override
//   State<AdvisePage> createState() => _AdvisePageState();
// }
//
// class _AdvisePageState extends State<AdvisePage> {
//   FocusNode _focusNode = FocusNode();
//   FocusNode _focusNode2 = FocusNode();
//   FocusNode _focusNode3 = FocusNode();
//   FocusNode _focusNode4 = FocusNode();
//   final Llm poemRepository = Llm();
//   String hereItIs = '';
//   bool itsHere = false;
//   Future getHaikuTextData(String productName) async {
//     var poemData = await poemRepository.getPoems(productName);
//     setState(() {
//       if (poemData != null) {
//         hereItIs = poemData;
//       } else {
//         //curellm = llmanswers[productName]!;
//       }
//       finalLoad = 3;
//     });
//   }
//
//   double tt = 0.0;
//
//   var personalExpense =
//       FirebaseFirestore.instance.collection('personal expense');
//   late DocumentSnapshot<Map<String, dynamic>> result;
//   late List<MostActivelyTraded> randomStocks;
//   @override
//   void initState() {
//     super.initState();
//     _focusNode = FocusNode();
//
//     // Automatically open the keyboard when the widget initializes
//     _focusNode.requestFocus();
//     // getHaikuTextData(widget.question);
//     Future.delayed(Duration(seconds: 1), () {
//       setState(() {
//         _opacity = 1.0;
//       });
//     });
//     getStocks();
//     print("Total Expense: " + totalExpense);
//   }
//
//   int accept1 = 0;
//   int accept2 = 0;
//   int accept3 = 0;
//   int load1 = 0;
//   int load2 = 0;
//   int finalLoad = 0;
//   final _controller = PageController();
//
//   TextEditingController _inputController = TextEditingController();
//   TextEditingController _inputController2 = TextEditingController();
//   TextEditingController _expense = TextEditingController();
//   TextEditingController _income = TextEditingController();
//   double _opacity = 0.0;
//   double _opacity2 = 0.0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Column(
//             children: [
//               AnimatedOpacity(
//                 duration:
//                     Duration(milliseconds: 1000), // Duration of the animation
//                 opacity: _opacity,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 30),
//                     width: MediaQuery.of(context).size.width,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image(
//                         image: AssetImage(
//                           "assets/images/ex2.gif",
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 100,),
//               Text("Beta Version Rolling Out Soon",style: GoogleFonts.exo2(fontSize: 22,color: Colors.white),)
//               // (finalLoad == 0)
//               //     ? Padding(
//               //         padding: const EdgeInsets.all(20.0),
//               //         child: Container(
//               //             padding: EdgeInsets.all(20),
//               //             decoration: BoxDecoration(
//               //               borderRadius: BorderRadius.circular(10),
//               //               color: Color.fromRGBO(186, 201, 255, 0.07),
//               //             ),
//               //             width: MediaQuery.of(context).size.width,
//               //             height: MediaQuery.of(context).size.height / 1.8,
//               //             child: Column(
//               //               crossAxisAlignment: CrossAxisAlignment.start,
//               //               children: [
//               //                 Column(
//               //                   crossAxisAlignment: CrossAxisAlignment.start,
//               //                   children: [
//               //                     Padding(
//               //                       padding: const EdgeInsets.only(
//               //                           left: 20.0, top: 20),
//               //                       child: Text(
//               //                         "👉 What financial goal do you have in mind?",
//               //                         style: GoogleFonts.exo(
//               //                             fontSize: 14, color: Colors.white),
//               //                       ),
//               //                     ),
//               //                     Padding(
//               //                       padding: const EdgeInsets.only(top: 10.0),
//               //                       child: Container(
//               //                         child: Padding(
//               //                           padding: const EdgeInsets.only(
//               //                             left: 20.0,
//               //                             right: 20,
//               //                           ),
//               //                           child: accept1 == 0
//               //                               ? TextField(
//               //                                   onSubmitted: (value) {
//               //                                     setState(() {
//               //                                       load1 = 1;
//               //                                       accept1 = 1;
//               //                                       FocusScope.of(context)
//               //                                           .requestFocus(
//               //                                               _focusNode2);
//               //                                     });
//               //                                   },
//               //                                   focusNode: _focusNode,
//               //                                   controller: _inputController,
//               //                                   style: GoogleFonts.exo(
//               //                                       color:
//               //                                           Colors.grey.shade300),
//               //                                   decoration: InputDecoration(
//               //                                     suffixIcon: IconButton(
//               //                                       icon: Icon(
//               //                                         Icons.send,
//               //                                         size: 18,
//               //                                       ),
//               //                                       onPressed: () {
//               //                                         setState(() {
//               //                                           load1 = 1;
//               //                                           accept1 = 1;
//               //                                           FocusScope.of(context)
//               //                                               .requestFocus(
//               //                                                   _focusNode2);
//               //                                         });
//               //                                         HapticFeedback
//               //                                             .heavyImpact();
//               //                                       },
//               //                                     ),
//               //                                     hintStyle: GoogleFonts.exo(
//               //                                         color:
//               //                                             Colors.grey.shade700),
//               //                                     hintText:
//               //                                         "tell us your latest finance goal...",
//               //                                   ),
//               //                                 )
//               //                               : Container(
//               //                                   width: MediaQuery.of(context)
//               //                                       .size
//               //                                       .width,
//               //                                   decoration: BoxDecoration(
//               //                                     borderRadius:
//               //                                         BorderRadius.all(
//               //                                             Radius.circular(10)),
//               //                                     color: Color.fromRGBO(
//               //                                         186, 201, 255, 0.07),
//               //                                   ),
//               //                                   padding: EdgeInsets.symmetric(
//               //                                       horizontal: 20,
//               //                                       vertical: 10),
//               //                                   child: Row(
//               //                                     children: [
//               //                                       Icon(
//               //                                         Icons.check,
//               //                                         size: 15,
//               //                                         color: Colors.white60,
//               //                                       ),
//               //                                       Padding(
//               //                                         padding:
//               //                                             const EdgeInsets.only(
//               //                                                 left: 10.0),
//               //                                         child: Text(
//               //                                           _inputController.text,
//               //                                           style: GoogleFonts.exo(
//               //                                               color:
//               //                                                   Colors.white60),
//               //                                         ),
//               //                                       ),
//               //                                     ],
//               //                                   ),
//               //                                 ),
//               //                         ),
//               //                       ),
//               //                     ),
//               //                   ],
//               //                 ),
//               //                 AnimatedOpacity(
//               //                   opacity: load1 == 1 ? 1.0 : 0.0,
//               //                   duration: Duration(milliseconds: 500),
//               //                   child: Padding(
//               //                     padding: const EdgeInsets.only(top: 40.0),
//               //                     child: Column(
//               //                       crossAxisAlignment:
//               //                           CrossAxisAlignment.start,
//               //                       children: [
//               //                         Padding(
//               //                           padding: const EdgeInsets.only(
//               //                               left: 20.0, top: 20),
//               //                           child: Text(
//               //                             "👉 What timeframe are you aiming to achieve this goal?",
//               //                             style: GoogleFonts.exo(
//               //                                 fontSize: 14,
//               //                                 color: Colors.white),
//               //                           ),
//               //                         ),
//               //                         Padding(
//               //                           padding:
//               //                               const EdgeInsets.only(top: 10.0),
//               //                           child: Container(
//               //                             child: Padding(
//               //                               padding: const EdgeInsets.only(
//               //                                 left: 20.0,
//               //                                 right: 20,
//               //                               ),
//               //                               child: accept2 == 0
//               //                                   ? TextField(
//               //                                       controller:
//               //                                           _inputController2,
//               //                                       onSubmitted: (value) {
//               //                                         setState(() {
//               //                                           load2 = 1;
//               //                                           accept2 = 1;
//               //                                           FocusScope.of(context)
//               //                                               .requestFocus(
//               //                                                   _focusNode3);
//               //                                           _expense.text =
//               //                                               totalExpense;
//               //                                         });
//               //                                       },
//               //                                       focusNode: _focusNode2,
//               //                                       style: GoogleFonts.exo(
//               //                                           color: Colors
//               //                                               .grey.shade300),
//               //                                       decoration: InputDecoration(
//               //                                         suffixIcon: IconButton(
//               //                                           icon: Icon(
//               //                                             Icons.send,
//               //                                             size: 18,
//               //                                           ),
//               //                                           onPressed: () {
//               //                                             setState(() {
//               //                                               load2 = 1;
//               //                                               accept2 = 1;
//               //                                               FocusScope.of(
//               //                                                       context)
//               //                                                   .requestFocus(
//               //                                                       _focusNode3);
//               //                                               _expense.text =
//               //                                                   totalExpense;
//               //                                             });
//               //                                             HapticFeedback
//               //                                                 .heavyImpact();
//               //                                           },
//               //                                         ),
//               //                                         hintStyle:
//               //                                             GoogleFonts.exo(
//               //                                                 color: Colors.grey
//               //                                                     .shade700),
//               //                                         hintText:
//               //                                             "6 months / 1 year / 5 years ...",
//               //                                       ),
//               //                                     )
//               //                                   : Container(
//               //                                       width:
//               //                                           MediaQuery.of(context)
//               //                                               .size
//               //                                               .width,
//               //                                       decoration: BoxDecoration(
//               //                                         borderRadius:
//               //                                             BorderRadius.all(
//               //                                                 Radius.circular(
//               //                                                     10)),
//               //                                         color: Color.fromRGBO(
//               //                                             186, 201, 255, 0.07),
//               //                                       ),
//               //                                       padding:
//               //                                           EdgeInsets.symmetric(
//               //                                               horizontal: 20,
//               //                                               vertical: 10),
//               //                                       child: Row(
//               //                                         children: [
//               //                                           Icon(
//               //                                             Icons.check,
//               //                                             size: 15,
//               //                                             color: Colors.white60,
//               //                                           ),
//               //                                           Padding(
//               //                                             padding:
//               //                                                 const EdgeInsets
//               //                                                     .only(
//               //                                                     left: 10.0),
//               //                                             child: Text(
//               //                                               _inputController2
//               //                                                   .text,
//               //                                               style: GoogleFonts.exo(
//               //                                                   color: Colors
//               //                                                       .white60),
//               //                                             ),
//               //                                           ),
//               //                                         ],
//               //                                       ),
//               //                                     ),
//               //                             ),
//               //                           ),
//               //                         ),
//               //                       ],
//               //                     ),
//               //                   ),
//               //                 ),
//               //                 AnimatedOpacity(
//               //                   opacity: load2 == 1 ? 1.0 : 0.0,
//               //                   duration: Duration(milliseconds: 500),
//               //                   child: Column(
//               //                     crossAxisAlignment: CrossAxisAlignment.start,
//               //                     children: [
//               //                       Padding(
//               //                         padding: const EdgeInsets.only(top: 40.0),
//               //                         child: Column(
//               //                           crossAxisAlignment:
//               //                               CrossAxisAlignment.start,
//               //                           children: [
//               //                             Padding(
//               //                               padding: const EdgeInsets.only(
//               //                                   left: 20.0,
//               //                                   top: 20,
//               //                                   bottom: 30),
//               //                               child: Text(
//               //                                 "👉 Describe your current monthly finances",
//               //                                 style: GoogleFonts.exo(
//               //                                     fontSize: 14,
//               //                                     color: Colors.white),
//               //                               ),
//               //                             ),
//               //                             Padding(
//               //                               padding: const EdgeInsets.symmetric(
//               //                                   horizontal: 20),
//               //                               child: Row(
//               //                                 mainAxisAlignment:
//               //                                     MainAxisAlignment
//               //                                         .spaceBetween,
//               //                                 children: [
//               //                                   Container(
//               //                                     width: MediaQuery.of(context)
//               //                                             .size
//               //                                             .width /
//               //                                         3.2,
//               //                                     height: 50,
//               //                                     child: accept3 == 0
//               //                                         ? TextField(
//               //                                             controller: _expense,
//               //                                             style: GoogleFonts.exo(
//               //                                                 color: Colors.grey
//               //                                                     .shade300),
//               //                                             onSubmitted: (value) {
//               //                                               setState(() {
//               //                                                 accept3 = 1;
//               //                                                 FocusScope.of(
//               //                                                         context)
//               //                                                     .requestFocus(
//               //                                                         _focusNode4);
//               //                                               });
//               //                                             },
//               //                                             focusNode:
//               //                                                 _focusNode3,
//               //                                             decoration:
//               //                                                 InputDecoration(
//               //                                               suffixIcon:
//               //                                                   IconButton(
//               //                                                 icon: Icon(
//               //                                                   Icons.send,
//               //                                                   size: 18,
//               //                                                 ),
//               //                                                 onPressed: () {
//               //                                                   setState(() {
//               //                                                     accept3 = 1;
//               //                                                     FocusScope.of(
//               //                                                             context)
//               //                                                         .requestFocus(
//               //                                                             _focusNode4);
//               //                                                   });
//               //                                                 },
//               //                                               ),
//               //                                               hintText: "Expense",
//               //                                               hintStyle:
//               //                                                   GoogleFonts.exo(
//               //                                                       color: Colors
//               //                                                           .grey
//               //                                                           .shade700),
//               //                                             ),
//               //                                           )
//               //                                         : Container(
//               //                                             width: MediaQuery.of(
//               //                                                     context)
//               //                                                 .size
//               //                                                 .width,
//               //                                             decoration:
//               //                                                 BoxDecoration(
//               //                                               borderRadius:
//               //                                                   BorderRadius
//               //                                                       .all(Radius
//               //                                                           .circular(
//               //                                                               10)),
//               //                                               color:
//               //                                                   Color.fromRGBO(
//               //                                                       186,
//               //                                                       201,
//               //                                                       255,
//               //                                                       0.07),
//               //                                             ),
//               //                                             padding: EdgeInsets
//               //                                                 .symmetric(
//               //                                                     horizontal:
//               //                                                         20,
//               //                                                     vertical: 10),
//               //                                             child: Row(
//               //                                               children: [
//               //                                                 Icon(
//               //                                                   Icons.check,
//               //                                                   size: 15,
//               //                                                   color: Colors
//               //                                                       .white60,
//               //                                                 ),
//               //                                                 Padding(
//               //                                                   padding:
//               //                                                       const EdgeInsets
//               //                                                           .only(
//               //                                                           left:
//               //                                                               10.0),
//               //                                                   child: Text(
//               //                                                     _expense.text,
//               //                                                     style: GoogleFonts.exo(
//               //                                                         color: Colors
//               //                                                             .white60),
//               //                                                   ),
//               //                                                 ),
//               //                                               ],
//               //                                             ),
//               //                                           ),
//               //                                   ),
//               //                                   Container(
//               //                                     width: MediaQuery.of(context)
//               //                                             .size
//               //                                             .width /
//               //                                         3.2,
//               //                                     height: 50,
//               //                                     child: TextField(
//               //                                       onSubmitted: (value) {
//               //                                         setState(() {
//               //                                           finalLoad = 2;
//               //                                           randomStocks =
//               //                                               selectRandomStocks(
//               //                                                   _stocks
//               //                                                       .topGainers,
//               //                                                   10);
//               //                                           print(randomStocks);
//               //                                           getHaikuTextData(_inputController
//               //                                                   .text +
//               //                                               "and i want to achieve this goal in " +
//               //                                               _inputController2
//               //                                                   .text +
//               //                                               "my current monthly expenses are  rupees " +
//               //                                               _expense.text +
//               //                                               " and my current monthly income is rupees" +
//               //                                               _income.text);
//               //                                         });
//               //                                       },
//               //                                       controller: _income,
//               //                                       focusNode: _focusNode4,
//               //                                       style: GoogleFonts.exo(
//               //                                           color: Colors
//               //                                               .grey.shade300),
//               //                                       decoration: InputDecoration(
//               //                                         suffixIcon: IconButton(
//               //                                           icon: Icon(
//               //                                             Icons.send,
//               //                                             size: 18,
//               //                                           ),
//               //                                           onPressed: () {
//               //                                             setState(() {
//               //                                               finalLoad = 2;
//               //                                               randomStocks =
//               //                                                   selectRandomStocks(
//               //                                                       _stocks
//               //                                                           .topGainers,
//               //                                                       10);
//               //                                               print(randomStocks);
//               //                                               getHaikuTextData(_inputController.text +
//               //                                                   "and i want to achieve this goal in " +
//               //                                                   _inputController2
//               //                                                       .text +
//               //                                                   "my current monthly expenses are  rupees " +
//               //                                                   _expense.text +
//               //                                                   " and my current monthly income is rupees" +
//               //                                                   _income.text);
//               //                                             });
//               //                                             HapticFeedback
//               //                                                 .heavyImpact();
//               //                                           },
//               //                                         ),
//               //                                         hintText: "Income",
//               //                                         hintStyle:
//               //                                             GoogleFonts.exo(
//               //                                                 color: Colors.grey
//               //                                                     .shade700),
//               //                                       ),
//               //                                     ),
//               //                                   )
//               //                                 ],
//               //                               ),
//               //                             ),
//               //                           ],
//               //                         ),
//               //                       ),
//               //                     ],
//               //                   ),
//               //                 ),
//               //               ],
//               //             )),
//               //       )
//               //     : (finalLoad == 2)
//               //         ? Padding(
//               //             padding: const EdgeInsets.symmetric(
//               //                 horizontal: 20, vertical: 20),
//               //             child: Container(
//               //                 alignment: Alignment.center,
//               //                 padding: EdgeInsets.symmetric(horizontal: 30),
//               //                 width: MediaQuery.of(context).size.width,
//               //                 child: Text(
//               //                   "Loading ...",
//               //                   style: GoogleFonts.exo(
//               //                       fontSize: 14, color: Colors.white),
//               //                 )),
//               //           )
//               //         : AnimatedOpacity(
//               //             opacity: finalLoad == 3 ? 1.0 : 0.0,
//               //             duration: Duration(milliseconds: 1000),
//               //             child: Column(
//               //               children: [
//               //                 Padding(
//               //                   padding: const EdgeInsets.only(
//               //                       left: 20.0, right: 20),
//               //                   child: Container(
//               //                     padding: EdgeInsets.all(20),
//               //                     decoration: BoxDecoration(
//               //                       borderRadius: BorderRadius.circular(10),
//               //                       color: Color.fromRGBO(186, 201, 255, 0.07),
//               //                     ),
//               //                     width: MediaQuery.of(context).size.width,
//               //                     height:
//               //                         MediaQuery.of(context).size.height / 1.8,
//               //                     child: Container(
//               //                       child: Markdown(
//               //                         physics: BouncingScrollPhysics(),
//               //                         styleSheet: MarkdownStyleSheet.fromTheme(
//               //                             ThemeData(
//               //                                 textTheme: TextTheme(
//               //                                     bodyMedium: GoogleFonts.exo(
//               //                                         fontSize: 14.0,
//               //                                         color: Colors.white)))),
//               //                         data: hereItIs,
//               //                       ),
//               //                     ),
//               //                   ),
//               //                 ),
//               //                 Padding(
//               //                   padding: const EdgeInsets.only(top: 40.0),
//               //                   child: Column(
//               //                     children: [
//               //                       Text(
//               //                         "Here are some investment options .. ",
//               //                         style: GoogleFonts.exo(
//               //                             fontSize: 14, color: Colors.white),
//               //                       ),
//               //                       Text(
//               //                         "As per: " + _stocks.lastUpdated,
//               //                         style: GoogleFonts.exo(
//               //                             fontSize: 14, color: Colors.grey),
//               //                       ),
//               //                       Container(
//               //                         padding:
//               //                             EdgeInsets.only(bottom: 20, left: 20),
//               //                         width: MediaQuery.of(context).size.width,
//               //                         height:
//               //                             MediaQuery.of(context).size.height /
//               //                                 4,
//               //                         child: ListView.builder(
//               //                             physics: BouncingScrollPhysics(),
//               //                             scrollDirection: Axis.horizontal,
//               //                             controller: _controller,
//               //                             itemCount: randomStocks.length,
//               //                             itemBuilder:
//               //                                 (BuildContext context, int indx) {
//               //                               return Padding(
//               //                                 padding: const EdgeInsets.only(
//               //                                     right: 20, top: 20),
//               //                                 child: Card(
//               //                                   shape: RoundedRectangleBorder(
//               //                                       borderRadius:
//               //                                           BorderRadius.all(
//               //                                               Radius.circular(
//               //                                                   10))),
//               //                                   color: Color.fromRGBO(
//               //                                       186, 201, 255, 0.1),
//               //                                   elevation: 1,
//               //                                   child: Container(
//               //                                     width: MediaQuery.of(context)
//               //                                             .size
//               //                                             .width /
//               //                                         1.15,
//               //                                     padding: EdgeInsets.only(
//               //                                         left: 20, right: 20),
//               //                                     height: MediaQuery.of(context)
//               //                                             .size
//               //                                             .height /
//               //                                         5,
//               //                                     decoration: BoxDecoration(
//               //                                         borderRadius:
//               //                                             BorderRadius.circular(
//               //                                                 10),
//               //                                         border: Border.all(
//               //                                             width: 0.2)),
//               //                                     child: Column(
//               //                                       crossAxisAlignment:
//               //                                           CrossAxisAlignment
//               //                                               .start,
//               //                                       mainAxisAlignment:
//               //                                           MainAxisAlignment
//               //                                               .spaceAround,
//               //                                       children: [
//               //                                         Row(
//               //                                           children: [
//               //                                             Container(
//               //                                               padding:
//               //                                                   EdgeInsets.all(
//               //                                                       8),
//               //                                               decoration:
//               //                                                   BoxDecoration(
//               //                                                 color: Colors.grey
//               //                                                     .shade100,
//               //                                                 borderRadius:
//               //                                                     BorderRadius
//               //                                                         .circular(
//               //                                                             10),
//               //                                                 //  border: Border.all(color: Colors.black, width: 1)
//               //                                               ),
//               //                                               child: Image(
//               //                                                   image: AssetImage(
//               //                                                       "assets/images/invest.png"),
//               //                                                   height: MediaQuery.of(
//               //                                                               context)
//               //                                                           .size
//               //                                                           .height /
//               //                                                       30),
//               //                                             ),
//               //                                             Padding(
//               //                                               padding:
//               //                                                   const EdgeInsets
//               //                                                       .only(
//               //                                                       left: 10.0),
//               //                                               child: Column(
//               //                                                 crossAxisAlignment:
//               //                                                     CrossAxisAlignment
//               //                                                         .start,
//               //                                                 children: [
//               //                                                   Text(
//               //                                                       randomStocks[
//               //                                                               indx]
//               //                                                           .ticker,
//               //                                                       style: GoogleFonts.exo(
//               //                                                           color: Colors
//               //                                                               .white,
//               //                                                           fontSize:
//               //                                                               16)),
//               //                                                   Text(
//               //                                                     "volume: " +
//               //                                                         randomStocks[
//               //                                                                 indx]
//               //                                                             .volume,
//               //                                                     style: GoogleFonts.exo(
//               //                                                         color: Colors
//               //                                                             .grey,
//               //                                                         fontSize:
//               //                                                             12),
//               //                                                   )
//               //                                                 ],
//               //                                               ),
//               //                                             ),
//               //                                           ],
//               //                                         ),
//               //                                         Row(
//               //                                           mainAxisAlignment:
//               //                                               MainAxisAlignment
//               //                                                   .spaceBetween,
//               //                                           children: [
//               //                                             Column(
//               //                                               children: [
//               //                                                 Text(
//               //                                                   "Change Rate",
//               //                                                   style: GoogleFonts.exo(
//               //                                                       color: Colors
//               //                                                           .grey
//               //                                                           .shade600,
//               //                                                       fontSize:
//               //                                                           12),
//               //                                                 ),
//               //                                                 Text(
//               //                                                   randomStocks[
//               //                                                           indx]
//               //                                                       .changePercentage,
//               //                                                   style: GoogleFonts.ubuntu(
//               //                                                       color: Color
//               //                                                           .fromRGBO(
//               //                                                               186,
//               //                                                               201,
//               //                                                               255,
//               //                                                               1),
//               //                                                       fontSize:
//               //                                                           18),
//               //                                                 ),
//               //                                               ],
//               //                                             ),
//               //                                             Column(
//               //                                               children: [
//               //                                                 Text(
//               //                                                   "Change Amount",
//               //                                                   style: GoogleFonts.ubuntu(
//               //                                                       color: Colors
//               //                                                           .grey
//               //                                                           .shade600,
//               //                                                       fontSize:
//               //                                                           12),
//               //                                                 ),
//               //                                                 Text(
//               //                                                   randomStocks[
//               //                                                           indx]
//               //                                                       .changeAmount,
//               //                                                   style: GoogleFonts.ubuntu(
//               //                                                       color: Color
//               //                                                           .fromRGBO(
//               //                                                               186,
//               //                                                               201,
//               //                                                               255,
//               //                                                               1),
//               //                                                       fontSize:
//               //                                                           18),
//               //                                                 ),
//               //                                               ],
//               //                                             ),
//               //                                             Container(
//               //                                               padding:
//               //                                                   EdgeInsets.all(
//               //                                                       10),
//               //                                               decoration: BoxDecoration(
//               //                                                   color: Colors
//               //                                                       .lightBlue
//               //                                                       .shade50,
//               //                                                   borderRadius:
//               //                                                       BorderRadius
//               //                                                           .circular(
//               //                                                               5)),
//               //                                               child: Row(
//               //                                                 children: [
//               //                                                   Text(
//               //                                                     "\$",
//               //                                                     style: GoogleFonts.exo(
//               //                                                         fontSize:
//               //                                                             14,
//               //                                                         fontWeight:
//               //                                                             FontWeight
//               //                                                                 .w500),
//               //                                                   ),
//               //                                                   Text(
//               //                                                     randomStocks[
//               //                                                             indx]
//               //                                                         .price,
//               //                                                     style:
//               //                                                         GoogleFonts
//               //                                                             .exo(
//               //                                                       fontSize:
//               //                                                           14,
//               //                                                       fontWeight:
//               //                                                           FontWeight
//               //                                                               .w500,
//               //                                                     ),
//               //                                                   )
//               //                                                 ],
//               //                                               ),
//               //                                             )
//               //                                           ],
//               //                                         ),
//               //                                       ],
//               //                                     ),
//               //                                   ),
//               //                                 ),
//               //                               );
//               //                             }),
//               //                       ),
//               //                       Padding(
//               //                         padding: const EdgeInsets.only(
//               //                             top: 15.0, bottom: 20),
//               //                         child: SmoothPageIndicator(
//               //                           controller: _controller,
//               //                           count: 10,
//               //                           effect: ExpandingDotsEffect(
//               //                             dotColor: Colors.grey,
//               //                             activeDotColor: const Color.fromRGBO(
//               //                                 117, 114, 255, 0.8),
//               //                             dotHeight: 4,
//               //                             dotWidth: 8,
//               //                             expansionFactor: 4,
//               //                             spacing: 4.0,
//               //                           ),
//               //                         ),
//               //                       ),
//               //                     ],
//               //                   ),
//               //                 )
//               //               ],
//               //             ),
//               //           ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // Shimmer.fromColors(
// //                       baseColor: Color.fromRGBO(186, 201, 255, 0.1),
// //                       highlightColor: Color.fromRGBO(186, 201, 255, 0.07),
// //                       enabled: true,
// //                       child: const SingleChildScrollView(
// //                         physics: NeverScrollableScrollPhysics(),
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           mainAxisSize: MainAxisSize.max,
// //                           children: [
// //                             BannerPlaceholder(),
// //                           ],
// //                         ),
// //                       ))
