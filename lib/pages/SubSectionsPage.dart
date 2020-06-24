import 'package:flutter/material.dart';
import 'package:flutterapp/models/ReadMoreText.dart';
import 'package:flutterapp/models/WebViewPage.dart';
import 'package:flutterapp/models/sections.dart';
import 'package:flutterapp/util/util.dart';

class SubSectionsPage extends StatelessWidget {
  final Section section;

  const SubSectionsPage({Key key, @required this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(section.title),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReadMoreText(
                section.descriptionSection??"",
                textDirection: TextDirection.rtl,
                style: TextStyle(),
                trimLines: 3,
                textAlign: TextAlign.center,
                trimMode: TrimMode.Line,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: section.listSection.length,
                itemBuilder: (_, pos) {
                  return Card(
                    margin: EdgeInsets.only(
                        top: 4.0, left: 8.0, right: 8.0, bottom: 4.0),
                    elevation: 8.0,
                    color: Theme.of(context).primaryColorDark,
                    child: ListTile(
                      title: ReadMoreText(
                        section.listSection[pos].title,
                        trimLines: 2,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        trimMode: TrimMode.Line,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.navigate_next),
                        color: Colors.white,
                        iconSize: 32,
                        onPressed: () {
                          openSectionPage(context, section.listSection[pos]);
                        },
                      ),
                      onTap: () => {
                        openSectionPage(context, section.listSection[pos]),
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  openSectionPage(BuildContext context, Section section) {
    if (section.type == SectionType.WebView)
      openNewPage(
          context,
          WebViewPage(
            section: section,
          ));
  }
}
