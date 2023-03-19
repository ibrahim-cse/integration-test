import 'package:expansion_panal/src_package/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';

class ConfigurableExpansionTilePackage extends StatefulWidget {
  const ConfigurableExpansionTilePackage({Key? key}) : super(key: key);

  @override
  _ConfigurableExpansionTilePackageState createState() => _ConfigurableExpansionTilePackageState();
}

class _ConfigurableExpansionTilePackageState extends State<ConfigurableExpansionTilePackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurable Expansion Tile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(238, 238, 238, 1),
                border: Border.all(color: Colors.grey),
              ),
              child: ConfigurableExpansionTile(
                animatedWidgetFollowingHeader: const Icon(Icons.keyboard_arrow_down),
                header: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Header Tile',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                childrenBody: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width * .94,
                          color: Colors.white,
                          child: Column(
                            children: const [
                              Text("Child 1"),
                              SizedBox(height: 20),
                              Text("Child 2"),
                              SizedBox(height: 20),
                              Text("Child 3"),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
