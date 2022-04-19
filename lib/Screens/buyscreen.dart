// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unnecessary_new
import 'package:arzenafees/Components/Export/custom_import.dart';

class buyScreen extends StatefulWidget {
  @override
  State<buyScreen> createState() => _buyScreenState();
}

class _buyScreenState extends State<buyScreen> {
  String dropdownValue = 'Islamabad';
  var items = [
    'Working a lot harder',
    'Being a lot smarter',
    'Being a self-starter',
    'Placed in charge of trading charter'
  ];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.coloroffWhite,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Constants.colorMain),
          elevation: 0,
          backgroundColor: Constants.coloroffWhite,
          title: Text(
            "ARZ E NAFEES",
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Constants.colorMain),
          ),
          centerTitle: false,
          leadingWidth: 30,
          titleSpacing: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
                child: Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.of(context).push(
                    Transitions(
                        transitionType: TransitionType.fade,
                        curve: Curves.bounceInOut,
                        duration: const Duration(milliseconds: 500),
                        reverseCurve: Curves.bounceOut,
                        widget: HomeScreen()),
                  );
                }),
          )),
      body: Column(children: [
        SizedBox(
          height: 20,
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
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('City'),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(child: TextField(controller: _controller)),
            PopupMenuButton<String>(
              icon: Icon(Icons.arrow_drop_down),
              initialValue: 'Islamabad',
              onSelected: (String value) {
                _controller.text = value;
              },
              itemBuilder: (BuildContext context) {
                return items.map<PopupMenuItem<String>>((String value) {
                  return PopupMenuItem(child: Text(value), value: value);
                }).toList();
              },
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Location'),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(child: TextField(controller: _controller)),
            PopupMenuButton<String>(
              icon: Icon(Icons.arrow_drop_down),
              initialValue: 'Islamabad',
              onSelected: (String value) {
                _controller.text = value;
              },
              itemBuilder: (BuildContext context) {
                return items.map<PopupMenuItem<String>>((String value) {
                  return PopupMenuItem(child: Text(value), value: value);
                }).toList();
              },
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Price Range'),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(child: TextField(controller: _controller)),
            PopupMenuButton<String>(
              icon: Icon(Icons.arrow_drop_down),
              initialValue: 'Islamabad',
              onSelected: (String value) {
                _controller.text = value;
              },
              itemBuilder: (BuildContext context) {
                return items.map<PopupMenuItem<String>>((String value) {
                  return PopupMenuItem(child: Text(value), value: value);
                }).toList();
              },
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Property Type'),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(child: TextField(controller: _controller)),
            PopupMenuButton<String>(
              icon: Icon(Icons.arrow_drop_down),
              initialValue: 'Islamabad',
              onSelected: (String value) {
                _controller.text = value;
              },
              itemBuilder: (BuildContext context) {
                return items.map<PopupMenuItem<String>>((String value) {
                  return PopupMenuItem(child: Text(value), value: value);
                }).toList();
              },
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Area Detail'),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(child: TextField(controller: _controller)),
            PopupMenuButton<String>(
              icon: Icon(Icons.arrow_drop_down),
              initialValue: 'Islamabad',
              onSelected: (String value) {
                _controller.text = value;
              },
              itemBuilder: (BuildContext context) {
                return items.map<PopupMenuItem<String>>((String value) {
                  return PopupMenuItem(child: Text(value), value: value);
                }).toList();
              },
            ),
          ],
        ),
        SizedBox(
          height: 20,
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
                  'View Properties',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )))
      ]),
    );
  }
}
