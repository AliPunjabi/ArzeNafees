// ignore_for_file: prefer_const_constructors

import 'package:arzenafees/Components/Export/custom_import.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Constants.colorMain,
          secondary: Constants.colorSecond,
        ),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              Transitions(
                transitionType: TransitionType.fade,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 1000),
                reverseCurve: Curves.easeInOut,
                widget: LoginScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
      fit: BoxFit.fill,
      image: AssetImage('assets/images/Splash screen.jpg'),
    )));
  }
}
