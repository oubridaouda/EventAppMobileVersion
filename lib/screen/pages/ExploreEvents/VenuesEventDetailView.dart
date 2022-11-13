import 'package:flutter/cupertino.dart';
import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/main.dart';
import 'package:provider/provider.dart';

class VenuesEventDetailView extends StatelessWidget {
  const VenuesEventDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    darkMode = Provider.of<AllChangeNotifier>(context).screenMode;
    return Container(
      child: const Center(
        child: Text("Venues Event Detail View"),
      ),
    );
  }
}
