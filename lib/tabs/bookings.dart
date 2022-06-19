import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Bookings extends StatelessWidget {
  const Bookings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('driver')
              .where('book', isEqualTo: 'booking')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print('error');
              return const Center(child: Text('Error'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              print('waiting');
              return const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                )),
              );
            }

            final data = snapshot.requireData;

            return ListView.builder(
                itemCount: snapshot.data?.size ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(400, 20, 400, 20),
                    child: Container(
                      height: 320,
                      width: 275,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              data.docs[index]['date'] +
                                  " - " +
                                  data.docs[index]['time'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      minRadius: 30,
                                      maxRadius: 30,
                                      backgroundImage: NetworkImage(
                                          data.docs[index]['profilePicture']),
                                    ),
                                    const Text(
                                      'Passenger',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    Text(
                                      data.docs[index]['name'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      data.docs[index]['userContactNumber'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 9.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      minRadius: 30,
                                      maxRadius: 30,
                                      backgroundImage: NetworkImage(data
                                          .docs[index]['driverProfilePicture']),
                                    ),
                                    const Text(
                                      'Driver',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    Text(
                                      data.docs[index]['driverFirstName'] +
                                          ' ' +
                                          data.docs[index]['driverLastName'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      data.docs[index]['driverContactNumber'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 9.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Trip',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                            Text(
                              data.docs[index]['location'] ==
                                      'Your Current Location'
                                  ? 'User Current Location'
                                  : 'User Current Location',
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Starting Location',
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: Colors.black,
                                fontSize: 8.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              data.docs[index]['destination'],
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Destination Location',
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: Colors.black,
                                fontSize: 8.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              data.docs[index]['amountPaid'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Paid Amount',
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: Colors.black,
                                fontSize: 8.0,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
