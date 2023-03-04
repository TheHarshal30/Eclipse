// ignore_for_file: prefer_const_constructors
import 'package:eclipsis/Screens/homepage.dart';
import 'package:eclipsis/pf/chap2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chap1 extends StatelessWidget {
  const Chap1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Eclipse Learning",
            style: GoogleFonts.ubuntu(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.yellow.shade50),
            child: Center(
              child: Text(
                "Overview",
                style: GoogleFonts.ubuntu(fontSize: 21),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.45,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Most people in this country live on a tight budget. They don’t have a large savings corpus. They don’t have an emergency fund. They don’t have a lot to fall back on. Even those with better financial security are wholly unprepared to deal with the odd curveball life throws at you",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, wordSpacing: 2.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "But this isn’t their fault per se. If anything, this isn’t a fault at all. People shouldn’t spend every waking minute of their life thinking of all the possible things that could go wrong. And they shouldn’t be living in a constant state of worry and panic. It would be a sorry way to live. However, throwing all caution to the wind wouldn’t be prudent. As any good driver would argue — “Eyes firmly planted on the street but for the occasional glance at the rearview mirror.”",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, wordSpacing: 2.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Consider, for instance, a trip to the hospital. It can drain you physically. It can drain you mentally. And it can drain you financially. The prospect of healing from physical and mental trauma is already daunting. But to deal with a massive financial burden as you’re recovering from a debilitating illness can be crippling. Some would argue that this is an isolated experience. That the government aids individuals who genuinely need the money. However, reality tells a very different story. Individuals in their capacity bear two-thirds of all medical costs. In some areas, it can be as high as 90%. You don’t get much help from outside, and even when you do, you have to work hard for it..",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, wordSpacing: 2.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "In most cases, a single hospitalization can wipe out years of savings. In other cases, it can push people into a debt trap. And it’s not just the hospitalization you have to worry about. You’ll often have to contend with various diagnostic exams before doctors can determine what’s wrong. Post-hospitalization, you’ll have to contend with medication costs. Modern treatments are costly, and medical inflation usually peaks at 7–8% yearly.",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, wordSpacing: 2.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "To put it simply, falling sick can be an expensive affair. And it also has the potential to upend your life altogether. It can prevent achieving true financial independence and strike havoc at any point in your life.Unless that is, you have a comprehensive health insurance plan.",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, wordSpacing: 2.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "This nifty insurance product can take care of all your pesky medical bills, and you won’t have to pay a bomb. It can stave off a crisis and help you achieve financial independence. It is a lifesaver; you’d expect most people to spend good money on a comprehensive health policy. However, that isn’t happening. Most people don’t consider these things worthwhile, and even those who do, penny-pinch when buying a health insurance plan.",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, wordSpacing: 2.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomePage()));
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration:
                                BoxDecoration(color: Colors.red.shade50),
                                child: Text(
                                  "< Prev",
                                  style: GoogleFonts.ubuntu(),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Chap2()));
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration:
                                BoxDecoration(color: Colors.green.shade50),
                                child: Text(
                                  "Next >",
                                  style: GoogleFonts.ubuntu(),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}