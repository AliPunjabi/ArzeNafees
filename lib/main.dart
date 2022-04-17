// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'package:arzenafees/Components/Export/custom_import.dart';
import 'package:arzenafees/Screens/nointernetscreen.dart';

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
  late StreamSubscription<User?> user;

  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              Transitions(
                  transitionType: TransitionType.fade,
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 1000),
                  reverseCurve: Curves.easeInOut,
                  widget: FirebaseAuth.instance.currentUser == null
                      ? LoginScreen()
                      : Constants.checkNetwork() == true
                          ? NoConnectionScreen()
                          : LoginScreen()),
            ));
  }

  @override
  void dispose() {
    user.cancel();
    super.dispose();
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
