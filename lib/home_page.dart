import 'package:expansion_panal/package_views/configurable_expansion_tile_package.dart';
import 'package:expansion_panal/package_views/expandable_package.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('R&D on Expansion Tile')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: 270,
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                  key: const Key('button1'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExpandablePackagePage()),
                    );
                  },
                  child: const Text('Expandable Package')),
            ),
            // ElevatedButton(
            //     key: const Key('button2'),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => ExpansionTileCardPackage()),
            //       );
            //     },
            //     child: const Text('Expansion Tile Card Package')),
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: 270,
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                  key: const Key('button2'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConfigurableExpansionTilePackage()),
                    );
                  },
                  child: const Text('Configurable Expansion Tile Package')),
            ),
          ],
        ),
      ),
    );
  }
}
