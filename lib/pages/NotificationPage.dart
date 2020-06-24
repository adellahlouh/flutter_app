import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/Notification.dart' as model;
import 'package:flutterapp/models/ReadMoreText.dart';
import 'package:flutterapp/util/util.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPAgeState createState() => _NotificationPAgeState();
}

class _NotificationPAgeState extends State<NotificationPage> {
  List<model.Notification> notificationList;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الاشعارات"),
      ),
      body: Container(
        child: notificationList != null
            ? ListView.builder(
                itemCount: notificationList.length,
                itemBuilder: (_, pos) => getCard(notificationList[pos]),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  void loadData() async {
    DatabaseReference reference =
        FirebaseDatabase.instance.reference().child("Notification");

    Map data = (await reference.once()).value;

    notificationList = List();

    if (data != null)
      data.forEach((key, value) {
        notificationList.add(model.Notification.getFromSnapshot(value));
      });

    setState(() {});
  }

  Widget getCard(model.Notification notification) {
    return Card(
      margin: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              notification.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 4, right: 8, left: 8, bottom: 8),
            child: ReadMoreText(
              notification.body,
              trimLines: 2,
              trimMode: TrimMode.Line,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding:
                const EdgeInsets.only(top: 4, right: 8, left: 8, bottom: 8),
            child: Text(
              getTimeFromTimestamp(notification.time),
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 9, color: Colors.grey),
            ),
          ),
          Visibility(
            visible: notification.imageUrl.isNotEmpty,
            child: Image.network(
              notification.imageUrl,
              height: 128,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
