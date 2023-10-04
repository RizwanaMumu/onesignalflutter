import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String notif="No Notification Yet!";
  String title="";
  String body="";
  String image="";
  bool isNotifClicked = false;

  @override
  void initState(){
    super.initState();

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      //event.preventDefault();
      setState(() {
        notif = 'You have received a new Notification!';
      });
      event.notification.display();
    });

    OneSignal.Notifications.addClickListener((event) {
      setState(() {
        title = event.notification.title!;
        body = event.notification.body!;
        image = event.notification.bigPicture!;
        isNotifClicked = true;
      });
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: isNotifClicked?
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200,
              child: Image.network(image, fit: BoxFit.fitHeight),
            ),
            SizedBox(height: 15,),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              body,
              style: TextStyle(
                  fontSize: 20
              )
            ),

          ],
        ),
      ):Center(
        child: Text(
          notif,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.red
          ),
        ),
      ),
    );
  }
}
