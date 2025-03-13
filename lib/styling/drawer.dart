import 'package:flutter/material.dart';
import 'package:hp_printer_guide/data/about_us.dart';
import 'package:hp_printer_guide/data/faq.dart';
import 'package:hp_printer_guide/data/support.dart';

class DrawerFb1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xff4338CA), // Matches the app theme
        child: ListView(
          children: <Widget>[
            // Profile or Logo Section
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/logo.jpg'),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'HP Printer Guide',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(color: Colors.white70),
                ],
              ),
            ),
            // Menu Items
            MenuItem(
              text: 'About Us',
              icon: Icons.info_outline,
              onClicked: () => selectedItem(context, 0),
            ),
            MenuItem(
              text: 'FAQ',
              icon: Icons.help_outline,
              onClicked: () => selectedItem(context, 1),
            ),
            MenuItem(
              text: 'Support',
              icon: Icons.support_agent,
              onClicked: () => selectedItem(context, 2),
            ),
          ],
        ),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    Widget page;
    switch (index) {
      case 0:
        page = AboutUsPage();
        break;
      case 1:
        page = FAQPage();
        break;
      case 2:
        page = SupportPage();
        break;
      default:
        return;
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onClicked;

  const MenuItem({
    required this.text,
    required this.icon,
    this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(text, style: TextStyle(color: Colors.white)),
      hoverColor: Colors.white70,
      onTap: onClicked,
    );
  }
}
