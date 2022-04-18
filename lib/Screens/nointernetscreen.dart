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
              onPressed: () async {
                await Constants.checkNetwork() == true
                    ? Navigator.of(context).push(
                        Transitions(
                            transitionType: TransitionType.fade,
                            curve: Curves.bounceInOut,
                            duration: const Duration(milliseconds: 500),
                            reverseCurve: Curves.bounceOut,
                            widget: HomeScreen()),
                      )
                    : Constants.checkNetwork();
              },
              child: Text("Retry".toUpperCase()),
            ),
          )
        ],
      ),
    );
  }
}
