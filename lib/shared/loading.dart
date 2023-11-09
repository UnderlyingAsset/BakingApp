import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

///This is a class which displays a loading image when the app is retrieving
///data from the database or otherwise preoccupied with a process.  It can be
///used freely throughout the app when data fetching may take a few seconds.

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[100],
      child: const Center(
        child: SpinKitPouringHourGlass(
          color: Colors.brown,
          size: 50.0,
        ),
      ),
    );
  }
}