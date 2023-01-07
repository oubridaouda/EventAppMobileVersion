import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ExploreEvents extends StatelessWidget {
  const ExploreEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    darkMode = Provider.of<AllChangeNotifier>(context).screenMode;
    return const Center(child: Text("Explore Event"),);
  }
}
