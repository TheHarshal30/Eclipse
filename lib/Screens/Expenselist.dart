
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Expenselist extends StatefulWidget {
  List<dynamic> jan;
  List<dynamic> feb;
  List<dynamic> mar ;
  List<dynamic> apr;
  List<dynamic> may;
  List<dynamic> june;
  List<dynamic> july ;
  List<dynamic> august ;
  List<dynamic> september;
  List<dynamic> october ;
  List<dynamic> november ;
  List<dynamic> december ;
  double janx ;
  double febx ;
  double marx ;
  double mayx ;
  double aprx ;
  double junex ;
  double julyx ;
  double augustx ;
  double septx ;
  double octx ;
  double novx ;
  double decx ;
   Expenselist({Key? key,required this.december,required this.november,required this.october,required this.september,required this.august,required this.july,required this.june,required this.may,required this.apr,required this.mar,required this.feb,required this.jan, required this.janx,required this.febx,required this.marx,required this.mayx,required this.aprx,required this.junex,required this.julyx ,required this.augustx,
     required this.septx,required this.octx,required this.novx,required this.decx}) : super(key: key);

  @override
  State<Expenselist> createState() => _ExpenselistState();
}

class _ExpenselistState extends State<Expenselist> {
  List<dynamic> expenthis = [];
  List<String> ka = ['january','february','march','april','may','june','july','august','september','october','november','december'];
  List<String> kk = ['janx','febx','marx','aprx','mayx','junex','julyx','augustx','septx','octx','novx','decx'];
  double extotal = 0.0;
  int chek =0;
  int len =0;
  @override
  void initState() {
    super.initState();
    initialize(0);
    expenthis = widget.jan;
    chek=1;
    setState(() {
      chek=0;
    });


  }

  void initialize(int n) async {
    final snap = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      // expenthis = snap.data()![ka[n]];
      // extotal = snap.data()![kk[n]];
      expenthis = widget.jan;
      extotal=widget.janx;
      chek =1;
      len = (widget.jan.length/3.toInt()) as int;
    });
  }
  int selec = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black,),
        centerTitle: true,
        title: const Text("Monthly Expense",style: TextStyle(
          color: Colors.black
        ),),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(children: [
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
                      expenthis = widget.jan;
                      extotal = widget.janx;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 0)
                          ? const Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : const Border(
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
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selec = 1;
                      expenthis = widget.feb;
                      extotal = widget.febx;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 1)
                          ? const Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : const Border(
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
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selec = 2;
                      expenthis = widget.mar;
                      extotal = widget.marx;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 2)
                          ? const Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : const Border(
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
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selec = 3;
                      expenthis = widget.apr;
                      extotal = widget.aprx;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 3)
                          ? const Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : const Border(
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
                      expenthis = widget.may;
                      extotal = widget.mayx;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 4)
                          ? const Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : const Border(
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
                      expenthis = widget.june;
                      extotal = widget.junex;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 5)
                          ? const Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : const Border(
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
                      expenthis = widget.july;
                      extotal = widget.julyx;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 6)
                          ? const Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : const Border(
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
                      expenthis = widget.august;
                      extotal = widget.augustx;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 7)
                          ? const Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : const Border(
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
                      expenthis = widget.september;
                      extotal = widget.septx;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 8)
                          ? const Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : const Border(
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
                      expenthis = widget.october;
                      extotal = widget.octx;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 9)
                          ? const Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : const Border(
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
                      expenthis = widget.november;
                      extotal = widget.novx;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 10)
                          ? const Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : const Border(
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
                      expenthis = widget.december;
                      extotal = widget.decx;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: (selec == 11)
                          ? const Border(
                          bottom: BorderSide(
                              width: 0.5, color: Colors.blue))
                          : const Border(
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
       selec!=0? Padding(
         padding: const EdgeInsets.only(left: 20.0),
         child: Container(
           alignment: Alignment.centerLeft,
           child: Text(
              "${ka[selec]}'s Expense ",
              style: GoogleFonts.ubuntu(fontSize: 15),
            ),
         ),
       ):Padding(
         padding: const EdgeInsets.only(left: 20.0),
         child: Container(
           alignment: Alignment.centerLeft,
           child: Text(
             "${ka[selec]}'s Expense ",
             style: GoogleFonts.ubuntu(fontSize: 15),
           ),
         ),
       ),
        selec!=0?Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              extotal!=0.0?
              "${-1*extotal.toDouble()}":"${extotal.toDouble()}",
              style: GoogleFonts.ubuntu(
                  fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
        ):Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "${-1*widget.janx.toDouble()}",
              style: GoogleFonts.ubuntu(
                  fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
        ),
          expenthis.isNotEmpty?SizedBox(
            height: MediaQuery.of(context).size.height*0.7,
            child: ListView.builder(
                itemCount: (expenthis.length/3).toInt(),
                itemBuilder: (context, i) {
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
                        decoration: const BoxDecoration(
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
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color:
                                      Colors.orange.shade50,
                                      borderRadius:
                                      BorderRadius.circular(
                                          15),
                                      //  border: Border.all(color: Colors.black, width: 1)
                                    ),
                                    child: Image(
                                        image: const AssetImage(
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
                                  EdgeInsets
                                      .all(8.0),
                                  child: p<0?Text(
                                      'Debited'):Text("Credited"),
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
          ):expenthis.isEmpty&&chek==0?const Center(child: CircularProgressIndicator(),):Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text("Nothing to show here",style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.bold)),),
          ),
        ],
      ));
  }
}
