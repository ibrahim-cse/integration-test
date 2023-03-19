import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpandablePackagePage extends StatefulWidget {
  const ExpandablePackagePage({Key? key}) : super(key: key);

  @override
  State createState() {
    return ExpandablePackagePageState();
  }
}

class ExpandablePackagePageState extends State<ExpandablePackagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expandable Demo"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Card1(),
          ],
        ),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "ExpandablePanel",
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                collapsed: Text(''),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            ListTile(
                              leading: Icon(Icons.album, size: 45),
                              title: Text('Rahad'),
                              subtitle: Text('Mr. Md Ibrahim Hossen Rahad'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
