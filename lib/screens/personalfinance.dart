import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalFinPage extends StatelessWidget {
  const PersonalFinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Personal Finance 101",
            style: GoogleFonts.bangers(fontSize: 40)),
      ),
    );
  }
}
