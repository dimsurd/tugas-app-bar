import 'package:flutter/material.dart';
import 'package:tugas_tabbar_2/scanner_page.dart';
import 'package:tugas_tabbar_2/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Super App"),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.qr_code_scanner),
                text: "Scan",
              )
            ]),
          ),
          body: TabBarView(children: [
            MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Container(
                  child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  TextButton(
                      onPressed: (() async {
                        const url = "https://github.com/dimsurd";
                        if (await canLaunch(url)) {
                          await launch(url, forceWebView: true);
                        } else {
                          throw "Couldn't launch $url";
                        }
                      }),
                      child: CustomButton(
                        labelButton: "My Website",
                        iconButton: Icons.language,
                      )),
                  TextButton(
                      onPressed: () async {
                        String email = "kitsudeveloper@gmail.com";
                        String subject = "This is test email from app";
                        String body = "Hello World !";
                        String emailUrl =
                            "mailto:$email?subject=$subject&body=$body";
                        if (await canLaunch(emailUrl)) {
                          await launch(emailUrl);
                        } else {
                          throw "Failed send mail to: $emailUrl";
                        }
                      },
                      child: CustomButton(
                        labelButton: "Email Me",
                        iconButton: Icons.forward_to_inbox,
                      )),
                  TextButton(
                      onPressed: () async {
                        String telephoneNumber = '+628374625143';
                        String telephoneUrl = "tel:$telephoneNumber";

                        if (await canLaunch(telephoneUrl)) {
                          await launch(telephoneUrl);
                        } else {
                          throw "Error occured trying to call $telephoneNumber";
                        }
                      },
                      child: CustomButton(
                        labelButton: "Call Me",
                        iconButton: Icons.call,
                      )),
                  TextButton(
                      onPressed: () async {
                        String telephoneNumber = '+628374625143';
                        String smsUrl = "sms:$telephoneNumber";

                        if (await canLaunch(smsUrl)) {
                          await launch(smsUrl);
                        } else {
                          throw "Error occured trying to send a message";
                        }
                      },
                      child: CustomButton(
                        labelButton: "Message Me",
                        iconButton: Icons.textsms,
                      )),
                  TextButton(
                      onPressed: () async {
                        const String latLocation = '35.6762';
                        const String langLocation = "139.6503";

                        const String mapUrl = "geo:$latLocation,$langLocation";

                        if (await canLaunch(mapUrl)) {
                          await launch(mapUrl);
                        } else {
                          throw "Couldn't launch map";
                        }
                      },
                      child: CustomButton(
                        labelButton: "My Location",
                        iconButton: Icons.location_history,
                      )),
                ],
              )),
            ),
            MaterialApp(
              home: QRViewExample(),
            )
          ]),
        ),
      ),
    );
  }
}
