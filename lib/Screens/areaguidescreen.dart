import 'package:arzenafees/Components/Export/custom_import.dart';
import 'package:arzenafees/services/areaguideapi.dart';

class areaguide extends StatelessWidget {
  const areaguide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: fetchareaguide(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(child: Text("done"));
        }
      },
    ));
  }
}
