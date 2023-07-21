import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  // Wrap with StatefulWidget
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // State class to access 'context'

  Future<bool> launchUrl(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error launching URL: $e');
      return false;
    }
  }

  void sendWhatsApp() async {
    String msg = 'type something';
    String phoneWithCountryCode = '+918095128426';

    String mobile =
        Platform.isIOS ? phoneWithCountryCode : phoneWithCountryCode;

    if (mobile.isNotEmpty) {
      if (msg.isNotEmpty) {
        String url;
        if (Platform.isIOS) {
          url = 'whatsapp://wa.me/$mobile/?text=${Uri.parse(msg)}';
        } else {
          url = 'whatsapp://send?phone=$mobile&text=${Uri.parse(msg)}';
        }

        if (!await launchUrl(url)) {
          throw 'Could not launch $url';
        } else {
          print('WhatsApp Opened');
        }
      } else {
        // Message is empty
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Please insert a message to send'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } else {
      // Mobile number is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please insert a mobile number'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SuperApp"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Open WhatsApp"),
          onPressed: sendWhatsApp,
        ),
      ),
      drawer: Drawer(),
    );
  }
}
