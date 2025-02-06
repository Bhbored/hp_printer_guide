import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hp_printer_guide/styling/background.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBody: true,
      body: BackgroundImageFb1(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'FAQs',
                    style: GoogleFonts.poppins(
                      textStyle: textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    _faqCard("How do I install my HP printer?",
                        "Download the official drivers from HP's website and follow the setup instructions."),
                    _faqCard("Why is my printer not connecting to WiFi?",
                        "Ensure your printer is within range, restart your router, and check for firmware updates."),
                    _faqCard("How do I fix a paper jam?",
                        "Turn off the printer, remove any stuck paper carefully, and restart the printer."),
                    _faqCard("Why is my print quality poor?",
                        "Check ink levels, clean the printhead, and use high-quality paper."),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _faqCard(String question, String answer) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 4),
            Text(
              answer,
              style: GoogleFonts.poppins(color: Colors.black54, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
