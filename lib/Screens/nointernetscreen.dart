import 'package:arzenafees/Components/Export/custom_import.dart';

class NoConnectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/1_No Connection.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 100,
            left: 30,
            child: CustomElevatedButton(
              onPressed: () {},
              child: Text("Retry".toUpperCase()),
            ),
          )
        ],
      ),
    );
  }
}
