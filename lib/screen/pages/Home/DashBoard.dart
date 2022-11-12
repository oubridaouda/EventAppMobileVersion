import 'package:event_mobile_app/screen/events/EventListScreenView/EventListScreenView.dart';
import 'package:event_mobile_app/screen/events/SearchEventSection/SearchEventSection.dart';
import 'package:flutter/cupertino.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SearchEventSection(),
          EventListScreenView()
        ],
      ),
    );
  }
}
