import 'package:flutter/cupertino.dart';
import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/main.dart';
import 'package:provider/provider.dart';

class OnlineEventDetailView extends StatelessWidget {
  const OnlineEventDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    darkMode = Provider.of<AllChangeNotifier>(context).screenMode;
    return Container(
      child: const Center(
        child: Text("Online Event Detail View"),
      ),
    );
  }
}
