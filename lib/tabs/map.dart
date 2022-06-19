import 'package:admin_web/sampleScreen.dart';
import 'package:flutter/material.dart';

import '../get_map_widget.dart';

class Map extends StatelessWidget {
  const Map({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Stack(
          children: [
            getMap(),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 100),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                width: 120,
                height: 75,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_on, color: Colors.red),
                        Text(
                          ' - Driver',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5, right: 5, top: 10),
                      child: Text(
                        "   Hover the marker with your mouse cursor to view Driver's name",
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 8.0,
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SampleScreen()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text('Refresh',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.red,
                            )),
                      ),
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
