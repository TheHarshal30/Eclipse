import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app1/screens/advise..dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:timelines/timelines.dart';

class EclipseAI extends StatefulWidget {
  const EclipseAI({super.key});

  @override
  State<EclipseAI> createState() => _EclipseAIState();
}

class _EclipseAIState extends State<EclipseAI>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  Route _createRoute(value) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => value,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  bool _moveRocket = false;
  TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Text(
                    "eclipse ai",
                    style: GoogleFonts.exo(
                      fontSize: 18,
                      color: Color.fromRGBO(186, 201, 255, 1),
                    ),
                  ),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.all(10),
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height / 3.5,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(10),
              //     child: Image(
              //       fit: BoxFit.fill,
              //       image: AssetImage(
              //         "assets/images/ai.jpg",
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 20),
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Rome wasn't build in a day",
                        style:
                            GoogleFonts.exo(fontSize: 22, color: Colors.white),
                      ),
                      Text(
                        "so aren't your finances",
                        style: GoogleFonts.exo(
                            fontSize: 18, color: Colors.white60),
                      ),
                    ],
                  ),
                ),
              ),
              // Image(
              //   width: MediaQuery.of(context).size.width / 2,
              //   image: AssetImage("assets/images/ai2.gif"),
              // ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/images/ai.jpg",
                    ),
                  ),
                ),
              ),

              // Start building your finances

              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
              //   child: Container(
              //     padding: EdgeInsets.all(20),
              //     decoration: BoxDecoration(
              //         color: Color.fromRGBO(186, 201, 255, 0.07),
              //         borderRadius: BorderRadius.circular(10)),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.symmetric(vertical: 10.0),
              //           child: Container(
              //             width: MediaQuery.of(context).size.width / 1.25,
              //             child: Text(
              //               "start building your finances now!",
              //               style: GoogleFonts.ubuntu(
              //                 fontSize: 18,
              //                 color: Colors.blueGrey,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(top: 20.0),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Container(
              //                 width: MediaQuery.of(context).size.width / 2,
              //                 child: Text(
              //                   "eclipse ai will analyze your current financial condition and will laugh about it\nfor more info visit our socials!",
              //                   style: GoogleFonts.ubuntu(
              //                     fontSize: 13,
              //                     color: Colors.white60,
              //                   ),
              //                 ),
              //               ),
              //               Container(
              //                 width: MediaQuery.of(context).size.width / 4,
              //                 child: Lottie.asset(
              //                   "assets/images/ai33.json",
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Text(
                  "what does eclipse ai do 🤔",
                  style: GoogleFonts.exo(fontSize: 18, color: Colors.white70),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(186, 201, 255, 0.07),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.25,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "⚡",
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 12,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      "Describe us your a financial goal",
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 16,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 25.0, top: 5),
                                child: Text(
                                  "it can be anything from buying a car, hosue to a savings you plan on to use later",
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.25,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "⚡",
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 12,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.35,
                                      child: Text(
                                        "Tell us about your current financial condition",
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 16,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 25.0, top: 5),
                                child: Text(
                                  "describe you current financial condition such as your monthly expenses, your debits and credits sources",
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.25,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "⚡",
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 12,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      "That's it!",
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 18,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 25.0, top: 5),
                                child: Text(
                                  "eclipse will build you a personalized plan for helping you achieve your finances. Also it will recommend assets to invest in",
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // TELL US ABOUT YOUR FINANCIAL GOALS
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  // decoration: BoxDecoration(
                  //     color: Color.fromRGBO(186, 201, 255, 0.05),
                  //     borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Text(
                        "Here we go 💨",
                        style: GoogleFonts.exo(
                            fontSize: 18, color: Colors.white70),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              _createRoute(AdvisePage(
                                question: "",
                              )));
                          HapticFeedback.heavyImpact();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10),
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 18,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(186, 201, 255, 0.2),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      "start now",
                                      style: GoogleFonts.ubuntu(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.grey,
                                      size: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(186, 201, 255, 0.07),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Text(
                            "Disclaimer\n\nThe AI is still in its beta version and this is just a demonstration of the working model.\nAny investment suggested by model is risky and user is soley responsible for any investment he makes using this!",
                            style: GoogleFonts.exo(
                              color: Colors.grey.shade300,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  widgetReturn() {
    return SizedBox(
      height: 20.0,
      child: DecoratedLineConnector(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Colors.lightBlueAccent.shade100,
              ]),
        ),
      ),
    );
  }
}
