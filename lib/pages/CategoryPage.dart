import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/models/WebViewPage.dart';
import 'package:flutterapp/models/sections.dart';
import 'package:flutterapp/pages/BlogerPage.dart';
import 'package:flutterapp/pages/NotificationPage.dart';
import 'package:flutterapp/pages/PdfNewPage.dart';

import 'package:flutterapp/pages/SubSectionsPage.dart';
import 'package:flutterapp/util/util.dart';

import 'settings_page.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("بنزين الفرح"),
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: openNotificationPage,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: openSettingPage,
            )
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1,
          children: mainSectionList.map((section) {
            return Container(
              margin: EdgeInsets.all(1),
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Image.asset(
                      section.imagePath,
                      fit: BoxFit.fill,
                    )),
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        section.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned.fill(
                        child: InkWell(
                      onTap: () => openPage(section),
                    ))
                  ],
                ),
              ),
            );
          }).toList(),
        ));
  }

  void openPage(Section section) {
    if (section.type == SectionType.Pdf)
      openNewPage(
          context,
          PdfPage(
            title: section.title,
            pathPDF: "assets/pdf/fish_cant_swim.pdf",
          ));
    else if (section.type == SectionType.Page)
      openNewPage(
        context,
        SubSectionsPage(
          section: section,
        ),
      );
    else if (section.type == SectionType.WebView)
      openNewPage(
          context,
          WebViewPage(
            section: section,
          ));
    else if (section.type == SectionType.Blog)
      openNewPage(
          context,
          BlogPage(
            section: section,
          ));
  }

  void openSettingPage() {
    openNewPage(context, SettingsPage());
  }

  void openNotificationPage() {
    openNewPage(context, NotificationPage());
  }
}
