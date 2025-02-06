import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrinterItem extends StatelessWidget {
  const PrinterItem({super.key, required this.printer});

  final Map<String, Object> printer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white), // Modern back icon
          onPressed: () {
            Navigator.pop(context); // Pop the current screen from the stack
          },
        ),
        title: Text(
          'Printer Details',
          style: GoogleFonts.roboto(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 118, 0, 254),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Add this to allow scrolling
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and image of the printer
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(printer['imagePath'] as String),
                    radius: 30,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      printer['title'] as String,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Overview Section
              _buildExpandableSection(
                title: "Overview",
                content: Text(
                  printer['overview'] as String,
                  style: TextStyle(fontSize: 16),
                ),
                icon: Icons.description,
              ),
              // Features Section
              _buildExpandableList(
                title: "Features",
                items: printer['features'] as List<String>,
                icon: Icons.star_outline,
              ),
              // Pros Section
              _buildExpandableList(
                title: "Pros",
                items: printer['pros'] as List<String>,
                icon: Icons.thumb_up,
                color: Colors.green,
              ),
              // Cons Section
              _buildExpandableList(
                title: "Cons",
                items: printer['cons'] as List<String>,
                icon: Icons.thumb_down,
                color: Colors.red,
              ),
              // Manual Overview Section
              _buildExpandableList(
                title: "Manual Overview",
                items: printer['manualOverview'] as List<String>,
                icon: Icons.book,
              ),
              // Tip Section
              _buildExpandableSection(
                title: "Tip",
                content: Row(
                  children: [
                    const Icon(Icons.lightbulb, color: Colors.amber),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        printer['tip'] as String,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                icon: Icons.lightbulb,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build expandable section for simple text content
  Widget _buildExpandableSection({
    required String title,
    required Widget content,
    IconData icon = Icons.info,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          title,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: content,
          ),
        ],
      ),
    );
  }

  // Build expandable list for list items (features, pros, cons, etc.)
  Widget _buildExpandableList({
    required String title,
    required List<String> items,
    required IconData icon,
    Color color = Colors.black,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ExpansionTile(
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        children: items
            .map((item) => ListTile(
                  leading: Icon(icon, color: color),
                  title: Text(
                    item,
                    style: GoogleFonts.roboto(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
