import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Expenselist extends StatefulWidget {
  const Expenselist({Key? key}) : super(key: key);

  @override
  State<Expenselist> createState() => _ExpenselistState();
}

class _ExpenselistState extends State<Expenselist> {
  List<dynamic> expenthis = [];
  List<String> ka = ['january','february','march','april','may','june','july','august','september','october','november','december'];
  int chek =0;
  @override
  void initState() {
    initialize(0);
    super.initState();
  }

  void initialize(int n) async {
    final snap = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      expenthis = snap.data()?['${ka[n]}'];
      chek =1;
    });
  }
  int selec = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black,),
        centerTitle: true,
        title: Text("Monthly Expense",style: TextStyle(
          color: Colors.black
        ),),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
      child: Column(children: [
        SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selec = 0;
                      initialize(0);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 0)
                          ? Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.white)),
                    ),
                    child: Text(
                      "January",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          color: (selec == 0)
                              ? Colors.blue
                              : Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selec = 1;
                      initialize(1);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 1)
                          ? Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.white)),
                    ),
                    child: Text(
                      "February",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          color: (selec == 1)
                              ? Colors.blue
                              : Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selec = 2;
                      initialize(2);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 2)
                          ? Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.white)),
                    ),
                    child: Text(
                      "March",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          color: (selec == 2)
                              ? Colors.blue
                              : Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selec = 3;
                      initialize(3);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 3)
                          ? Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.white)),
                    ),
                    child: Text(
                      "April",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          color: (selec == 3)
                              ? Colors.blue
                              : Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selec = 4;
                      initialize(4);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 4)
                          ? Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.white)),
                    ),
                    child: Text(
                      "May",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          color: (selec == 4)
                              ? Colors.blue
                              : Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selec = 5;
                      initialize(5);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 5)
                          ? Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.white)),
                    ),
                    child: Text(
                      "June",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          color: (selec == 5)
                              ? Colors.blue
                              : Colors.black),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selec = 6;
                      initialize(6);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 6)
                          ? Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.white)),
                    ),
                    child: Text(
                      "July",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          color: (selec == 6)
                              ? Colors.blue
                              : Colors.black),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selec = 7;
                      initialize(7);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 7)
                          ? Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.white)),
                    ),
                    child: Text(
                      "August",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          color: (selec == 7)
                              ? Colors.blue
                              : Colors.black),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selec = 8;
                      initialize(8);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 8)
                          ? Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.white)),
                    ),
                    child: Text(
                      "September",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          color: (selec == 8)
                              ? Colors.blue
                              : Colors.black),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selec = 9;
                      initialize(9);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 9)
                          ? Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.white)),
                    ),
                    child: Text(
                      "October",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          color: (selec == 9)
                              ? Colors.blue
                              : Colors.black),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selec = 10;
                      initialize(
                          10
                      );
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 10)
                          ? Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.white)),
                    ),
                    child: Text(
                      "November",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          color: (selec == 10)
                              ? Colors.blue
                              : Colors.black),
                    ),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selec = 11;
                      initialize(
                          11
                      );
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 11)
                          ? Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.white)),
                    ),
                    child: Text(
                      "December",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          color: (selec == 11)
                              ? Colors.blue
                              : Colors.black),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
          expenthis.length!=0?Container(
            height: MediaQuery.of(context).size.height*0.8,
            child: ListView.builder(
                itemCount: expenthis.length,
                itemBuilder: (context, i) {
                  print('${expenthis.length}');
                  var p = expenthis[i];
                    return
                        Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(15)),
                      elevation: 1,
                      child: Container(
                        height:
                        MediaQuery.of(context).size.height /
                            10,
                        width:
                        MediaQuery.of(context).size.width /
                            1.10,
                        decoration: BoxDecoration(
                          /*border: Border.all(width: 1.5, color: Colors.black),*/
                          color: Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color:
                                      Colors.orange.shade50,
                                      borderRadius:
                                      BorderRadius.circular(
                                          15),
                                      //  border: Border.all(color: Colors.black, width: 1)
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/learn2.png"),
                                        height: MediaQuery.of(
                                            context)
                                            .size
                                            .height /
                                            20),
                                  ),
                                ),

                                Padding(
                                  padding:
                                  const EdgeInsets
                                      .all(8.0),
                                  child: Text(
                                      'Merchant'),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.all(
                                  8.0),
                              child: p<0?Text(
                                "${p}",
                                // 'check',
                                style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  color: Colors.red,
                                ),
                              ):Text(
                                "${p}",
                                // 'check',
                                style: GoogleFonts.roboto(
                                  fontSize:20,
                                  color: Colors.green,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
    ),
          ):expenthis.length==0&&chek==0?Center(child: CircularProgressIndicator(),):Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text("Nothing to show here",style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.bold)),),
          ),
        ],
      ),
    ));
  }
}
