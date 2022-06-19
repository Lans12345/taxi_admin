import 'package:admin_web/sampleScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Sales extends StatefulWidget {
  const Sales({Key key}) : super(key: key);

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    getData1();
    getData2();
    getData3();
    super.initState();
  }

  double baseFare = 0;

  double farePerKm = 0;

  double jan = 0;
  double feb = 0;
  double mar = 0;
  double apr = 0;
  double may = 0;
  double jun = 0;
  double jul = 0;
  double aug = 0;
  double sep = 0;
  double oct = 0;
  double nov = 0;
  double dec = 0;

  getData1() async {
    var collection = FirebaseFirestore.instance
        .collection('sales')
        .where('type', isEqualTo: 'month');

    var querySnapshot = await collection.get();
    setState(() {
      for (var queryDocumentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data = queryDocumentSnapshot.data();

        jan = data['January'];
        feb = data['February'];
        mar = data['March'];
        apr = data['April'];
        may = data['May'];
        jun = data['June'];
        jul = data['July'];
        aug = data['August'];
        sep = data['September'];
        oct = data['October'];
        nov = data['November'];
        dec = data['December'];
      }
    });
  }

  double mon;
  double tue;
  double wed;
  double thu;
  double fri;
  double sat;
  double sun;

  getData2() async {
    var collection = FirebaseFirestore.instance
        .collection('sales')
        .where('type', isEqualTo: 'week');

    var querySnapshot = await collection.get();
    setState(() {
      for (var queryDocumentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data = queryDocumentSnapshot.data();

        mon = data['Monday'];
        tue = data['Tuesday'];
        wed = data['Wednesday'];
        thu = data['Thursday'];
        fri = data['Friday'];
        sat = data['Saturday'];
        sun = data['Sunday'];
      }
    });
  }

  double year1;
  double year2;
  double year3;
  double year4;
  double year5;

  getData3() async {
    var collection = FirebaseFirestore.instance
        .collection('sales')
        .where('type', isEqualTo: 'year');

    var querySnapshot = await collection.get();
    setState(() {
      for (var queryDocumentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data = queryDocumentSnapshot.data();

        year1 = data['2022'];
        year2 = data['2023'];
        year3 = data['2024'];
        year4 = data['2025'];
        year5 = data['2026'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 1100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: RaisedButton(
                            color: Colors.red,
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
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              Container(
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: "Weekly Sales Analysis"),
                  // Enable legend
                  legend: Legend(
                    isVisible: true,
                  ),
                  // Enable tooltip
                  tooltipBehavior: _tooltipBehavior,
                  series: <LineSeries<SalesData, String>>[
                    LineSeries<SalesData, String>(
                      dataSource: <SalesData>[
                        SalesData(
                          'Mon',
                          mon,
                        ),
                        SalesData('Tue', tue),
                        SalesData('Wed', wed),
                        SalesData('Thu', thu),
                        SalesData('Fri', fri),
                        SalesData('Sat', sat),
                        SalesData('Sun', sun)
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: "Monthly Sales Analysis"),
                  // Enable legend
                  legend: Legend(
                    isVisible: true,
                  ),
                  // Enable tooltip
                  tooltipBehavior: _tooltipBehavior,
                  series: <LineSeries<SalesData, String>>[
                    LineSeries<SalesData, String>(
                      dataSource: <SalesData>[
                        SalesData('Jan', jan),
                        SalesData('Feb', feb),
                        SalesData('Mar', mar),
                        SalesData('Apr', apr),
                        SalesData('May', may),
                        SalesData('Jun', jun),
                        SalesData('July', jul),
                        SalesData('Aug', aug),
                        SalesData('Sep', sep),
                        SalesData('Oct', oct),
                        SalesData('Nov', nov),
                        SalesData('Dec', dec),
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),

                  // Chart title
                  title: ChartTitle(text: "Yearly Sales Analysis"),
                  // Enable legend
                  legend: Legend(
                    isVisible: true,
                  ),
                  // Enable tooltip
                  tooltipBehavior: _tooltipBehavior,
                  series: <LineSeries<SalesData, String>>[
                    LineSeries<SalesData, String>(
                      dataSource: <SalesData>[
                        SalesData('2022', year1),
                        SalesData('2023', year2),
                        SalesData('2024', year3),
                        SalesData('2025', year4),
                        SalesData('2026', year5),
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,

                      // Enable data label
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
