import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/models/sections.dart';
import 'package:flutterapp/util/theme.dart';
import 'package:flutterapp/util/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogPage extends StatefulWidget {
  final Section section;

  const BlogPage({Key key, this.section}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BlogPage();
}

class _BlogPage extends State<BlogPage> {
  String blog = "";

  List<String> list = List();

  var _darkTheme = false;

  @override
  void initState() {
    super.initState();

    loadString().then((value) async {
      RegExp exp =
          new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
      Iterable<RegExpMatch> matches = exp.allMatches(value);

      int fromIndex = 0;

      matches.forEach((element) {
        list.add(value.substring(fromIndex, element.start).trim());
        list.add(value.substring(element.start, element.end).trim());

        fromIndex = element.end;
      });

      if (list.isEmpty) list.add(value);

      setState(() {
        blog = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.section.title),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(12.0),
        child: blog.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
                  children: list.map((e) {
                    bool isLink = isURL(e);
                    return InkWell(
                      onTap: isLink ? () => openUrl(e) : null,
                      child: Text(
                        e,
                        textDirection: TextDirection.rtl,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isLink
                              ? Colors.lightBlue
                              : _darkTheme ? Colors.white : Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Future<String> loadString() async =>
      await rootBundle.loadString(widget.section.blogPathFile);

  void openUrl(String e) {
    if (!e.startsWith("http://") && !e.startsWith("https://"))
      e = "https://" + e;

    launch(e);
  }
}
