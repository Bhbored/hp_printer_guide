import 'package:flutter/material.dart';
import 'package:hp_printer_guide/data/printers.dart';
import 'printer_item.dart'; // Import PrinterItem screen

class PrinterListScreen extends StatelessWidget {
  const PrinterListScreen({super.key});

  // Method to generate list summary with dynamic image paths and extensions
  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < printers.length; i++) {
      // Determine the correct extension for each printer image
      String imageExtension = 'jpg'; // Default to jpg
      if (i == 0 || i == 6) {
        // Adjust based on actual PNGs
        imageExtension = 'png';
      }

      summary.add({
        'index': i,
        'title': printers[i].title,
        'overview': printers[i].overview,
        'features': printers[i].features,
        'pros': printers[i].pros,
        'cons': printers[i].cons,
        'manualOverview': printers[i].manualOverview,
        'tip': printers[i].tip,
        'imagePath':
            'assets/images/printer_${i + 1}.$imageExtension', // Dynamically setting image path
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummary();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', // Your background image
              fit: BoxFit.cover,
            ),
          ),
          // Content Grid
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  // Adjusting the childAspectRatio to make images taller
                  childAspectRatio:
                      screenWidth / (screenHeight / 2.2), // Makes images taller
                ),
                itemCount: summary.length, // Dynamic length from the list
                itemBuilder: (context, index) {
                  var item = summary[index];
                  print(
                      'Loading image: ${item['imagePath']}'); // Log the image path

                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {
                      print('${item['title']} clicked!');
                      // Navigate to PrinterItem screen with the clicked printer's data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrinterItem(printer: item),
                        ),
                      );
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          // Image
                          Expanded(
                            child: Image.asset(
                              item['imagePath'] as String,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          // Title position on top of the image
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(
                                  0.6), // Semi-transparent background
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              item['title'] as String,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
