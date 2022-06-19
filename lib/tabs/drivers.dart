import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Drivers extends StatelessWidget {
  const Drivers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('driver')
              .where('status', isEqualTo: 'driver')
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
                    padding: const EdgeInsets.fromLTRB(350, 10, 350, 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            CircleAvatar(
                              minRadius: 60,
                              maxRadius: 60,
                              backgroundImage: NetworkImage(data.docs[index]
                                          ['profilePicture'] ==
                                      ''
                                  ? 'https://cdn-icons-png.flaticon.com/512/149/149071.png'
                                  : data.docs[index]['profilePicture']),
                            ),
                            ListTile(
                              leading: const Icon(Icons.person),
                              title: Text(data.docs[index]['firstName'] +
                                  ' ' +
                                  data.docs[index]['lastName']),
                              subtitle: const Text('Full Name'),
                            ),
                            ListTile(
                              leading: const Icon(Icons.phone),
                              title: Text(data.docs[index]['contactNumber']),
                              subtitle: const Text('Contact Number'),
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              title:
                                  Text(data.docs[index]['rating'].toString()),
                              subtitle: const Text('Rating'),
                            ),
                            ListTile(
                              leading: const Icon(Icons.location_on_rounded),
                              title: Text(data.docs[index]['address']),
                              subtitle: const Text('Address'),
                            ),
                            ListTile(
                              leading: const Icon(Icons.local_taxi),
                              title: Text(data.docs[index]['carModel']),
                              subtitle:
                                  Text(data.docs[index]['carPlateNumber']),
                            ),
                          ]),
                    ),
                  );
                });
          }),
    );
  }
}
