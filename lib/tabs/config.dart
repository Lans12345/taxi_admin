import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Configurations extends StatelessWidget {
  const Configurations({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int baseFare = 0;

    int farePerKm = 0;
    return Expanded(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Base Fare',
            style: TextStyle(
              fontWeight: FontWeight.w100,
              color: Colors.black,
              fontSize: 12.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(500, 10, 500, 0),
            child: TextFormField(
              onChanged: (_input) {
                baseFare = int.parse(_input);
              },
              keyboardType: TextInputType.number,
              style:
                  const TextStyle(color: Colors.black, fontFamily: 'Quicksand'),
              decoration: InputDecoration(
                prefix: const Text('₱ '),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(500, 10, 500, 0),
            child: ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('rate')
                    .doc('taxiRate')
                    .update({
                  'startingFare': baseFare + 0.1,
                });
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(
                            'Update',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold),
                          ),
                          content: const Text(
                            'Updated Succesfully!',
                            style: TextStyle(fontFamily: 'Quicksand'),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ));
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  'Update',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Fare per kilometer',
            style: TextStyle(
              fontWeight: FontWeight.w100,
              color: Colors.black,
              fontSize: 12.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(500, 10, 500, 0),
            child: TextFormField(
              onChanged: (_input) {
                farePerKm = int.parse(_input);
              },
              keyboardType: TextInputType.number,
              style:
                  const TextStyle(color: Colors.black, fontFamily: 'Quicksand'),
              decoration: InputDecoration(
                prefix: const Text('₱ '),
                suffix: const Text(' /km'),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('rate')
                    .doc('taxiRate')
                    .update({
                  'farePerKm': farePerKm + 0.1,
                });
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(
                            'Update',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold),
                          ),
                          content: const Text(
                            'Updated Succesfully!',
                            style: TextStyle(fontFamily: 'Quicksand'),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ));
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  'Update',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
