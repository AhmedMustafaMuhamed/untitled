import 'package:flutter/material.dart';

class Archived extends StatefulWidget {
  const Archived({Key? key}) : super(key: key);

  @override
  _ArchivedState createState() => _ArchivedState();
}

class _ArchivedState extends State<Archived> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Center(child: Text('Archived'),),
      ),
    );
  }
}
