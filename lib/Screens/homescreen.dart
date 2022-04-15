// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unnecessary_new
import 'package:arzenafees/Components/Export/custom_import.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = 'Islamabad';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.coloroffWhite,
      drawer: Padding(
        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
        child: Drawer(
          child: Column(
            children: [
              Container(
                color: Color.fromARGB(255, 240, 214, 214),
                child: ListTile(
                  leading: Icon(Icons.home_sharp, color: Constants.colorMain),
                  title: Text(
                    'Home',
                    style: TextStyle(color: Constants.colorMain),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.local_fire_department,
                    color: Constants.colorMain),
                title: Text('Listening'),
              ),
              ListTile(
                leading: Icon(Icons.phone_callback, color: Constants.colorMain),
                title: Text('Contact Us'),
              ),
              ListTile(
                leading: Icon(Icons.feedback_sharp, color: Constants.colorMain),
                title: Text('Feedback'),
              ),
              GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                    Transitions(
                        transitionType: TransitionType.fade,
                        curve: Curves.bounceInOut,
                        duration: const Duration(milliseconds: 500),
                        reverseCurve: Curves.bounceOut,
                        widget: LoginScreen()),
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.logout, color: Constants.colorMain),
                  title: Text('Logout'),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "ARZ E NAFEES",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Constants.colorMain),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text('All rights reserved Copyright @ 2021 2022',
                  style: TextStyle(color: Colors.grey, fontSize: 6))
            ],
          ),
        ),
      ),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Constants.colorMain),
          elevation: 0,
          backgroundColor: Constants.coloroffWhite,
          title: Padding(
            padding: EdgeInsets.only(left: 43.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "ARZ E NAFEES",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Constants.colorMain),
                  ),
                ),
              ],
            ),
          ),
          //automaticallyImplyLeading: false,
          leading: Builder(
            builder: (context) => IconButton(
              icon: new Icon(Icons.list_sharp),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                    size: 26.0,
                  )),
            )
          ]),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Text("Find a Home",
            textScaleFactor: 1.5,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        SizedBox(
          height: 10,
        ),
        Text(
          "More then 10,000 ads \n for sale and rental of\n         real estate  ",
          style: TextStyle(color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: ToggleSwitch(
              fontSize: 18,
              minWidth: 150.0,
              minHeight: 60,
              cornerRadius: 12.0,
              activeBgColors: [
                [Constants.colorMain],
                [Constants.colorMain]
              ],
              inactiveBgColor: Constants.colorSecond,
              activeFgColor: Constants.colorSecond,
              inactiveFgColor: Colors.black54,
              initialLabelIndex: 0,
              totalSwitches: 2,
              labels: ['Buy', 'Rent'],
              customTextStyles: [
                TextStyle(fontWeight: FontWeight.bold),
                TextStyle(fontWeight: FontWeight.bold)
              ],
              radiusStyle: true,
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 120,
                width: 100,
                child: Card(
                  elevation: 10,
                  color: Constants.colorSecond,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        color: Constants.colorMain,
                        size: 80,
                      ),
                      Text(
                        'Add Property',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 120,
                width: 100,
                child: Card(
                  elevation: 10,
                  color: Constants.colorSecond,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/home.png',
                        fit: BoxFit.contain,
                        height: 82,
                      ),
                      Text(
                        'Sell Property',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 120,
                width: 100,
                child: Card(
                  elevation: 10,
                  color: Constants.colorSecond,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Image.asset(
                          'assets/images/progress.png',
                          fit: BoxFit.contain,
                          height: 82,
                        ),
                      ),
                      Text(
                        'Investment',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 16,
          style: const TextStyle(color: Colors.grey),
          underline: Container(
            height: 2,
            color: Colors.grey,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Islamabad', 'RawalPindi', 'Mangla', 'Mirpur']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Area Guide",
                style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
              ),
              Text(
                'See All',
                style:
                    TextStyle(fontFamily: 'Roboto', color: Constants.colorMain),
              )
            ],
          ),
        ),
        Container(
          //margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 150.0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  height: 120,
                  width: 120,
                  child: Card(
                    elevation: 10,
                    color: Constants.colorSecond,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(),
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  child: Card(
                    elevation: 10,
                    color: Constants.colorSecond,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(),
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  child: Card(
                    elevation: 10,
                    color: Constants.colorSecond,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(),
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  child: Card(
                    elevation: 10,
                    color: Constants.colorSecond,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(),
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  child: Card(
                    elevation: 10,
                    color: Constants.colorSecond,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Wanted',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )))
      ]),
    );
  }
}
