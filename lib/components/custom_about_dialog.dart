import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAboutDialog extends StatelessWidget {
  const CustomAboutDialog({super.key});

  void _launchURL() async {
    final Uri url = Uri.parse("https://rithikzoysa.vercel.app");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      icon: SvgPicture.asset('assets/images/logo.svg'),
      title: Text("SpaceX Explorer™️", style: TextStyle(color: Colors.black)),
      backgroundColor: colorScheme.secondary,

      content: DefaultTextStyle(
        style: TextStyle(color: Colors.grey[800]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Developed by: Rithik Zoysa",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Email: rithikzoysa@gmail.com",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text('Wbsite: ', style: TextStyle(fontSize: 14)),
                GestureDetector(
                  onTap: _launchURL,
                  child: Text(
                    "rithikzoysa.vercel.app",
                    style: TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Text(
              "A SpaceX Explorer app to track rockets, launch pads, and landing pads.",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),

      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Close",
            style: TextStyle(
              color: Colors.grey[800],
            ), // Custom close button color
          ),
        ),
      ],
    );
  }
}
