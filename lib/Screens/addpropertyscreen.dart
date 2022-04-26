// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_if_null_operators
import 'package:arzenafees/Components/Export/custom_import.dart';

enum SingingCharacter { Residential, Plot, Commercial }

class addPropertyScreen extends StatefulWidget {
  @override
  State<addPropertyScreen> createState() => _addPropertyScreenState();
}

class _addPropertyScreenState extends State<addPropertyScreen> {
  final TextEditingController _controller = TextEditingController();
  SingingCharacter? _character = SingingCharacter.Residential;
  bool _editMode = false;

  String? dropdownValue;
  String? dropdownValue2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.coloroffWhite,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Constants.colorMain),
          elevation: 0,
          backgroundColor: Constants.coloroffWhite,
          title: Text(
            "Add Property",
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black),
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
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Add Property',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      'Enter Property details to get it listed on Arz e Nafees',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: ToggleSwitch(
              fontSize: 18,
              minWidth: 200.0,
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
        Column(
          children: [
            _editMode
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLabelWidget(
                          title: 'Custom Title',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          onFieldSubmitted: (v) {
                            FocusScope.of(context).nextFocus();
                          },
                          textInputAction: TextInputAction.next,
                          hintText: 'Enter Custom Title',
                          textInputType: TextInputType.text,
                          textEditingController: _controller,
                        ),
                      ],
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        _editMode = !_editMode;
                      });
                    },
                    child: ListTile(
                      minLeadingWidth: 0,
                      leading: Icon(
                        Icons.add,
                        color: Constants.colorMain,
                      ),
                      title: Text(
                        'Add Custom Title',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Constants.colorMain),
                      ),
                    ),
                  ),
            RadioListTile<SingingCharacter>(
              title: const Text('Residential'),
              value: SingingCharacter.Residential,
              activeColor: Constants.colorMain,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Plot'),
              activeColor: Constants.colorMain,
              value: SingingCharacter.Plot,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Commercial'),
              activeColor: Constants.colorMain,
              value: SingingCharacter.Commercial,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormField<String>(builder: (FormFieldState<String> state) {
                return InputDecorator(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(12, 10, 20, 20),
                        // labelText: "hi",
                        // labelStyle: textStyle,
                        // labelText: _dropdownValue == null
                        //     ? 'Where are you from'
                        //     : 'From',

                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 16.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontFamily: "verdana_regular",
                        ),
                        hint: Text(
                          "Select Subtype",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontFamily: "verdana_regular",
                          ),
                        ),
                        value: dropdownValue2 == null ? null : dropdownValue2,
                        isExpanded: true,
                        isDense: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue2 = newValue;
                          });
                        },
                        items: <String>[
                          'House',
                          'Apartment',
                          'Guest House',
                          'Upper Portion',
                          'Lower Portion',
                          'Farm House',
                          'Room',
                          'Penthouse',
                          'Hotel Suites',
                          'Basement',
                          'Annexe',
                          'Hostel'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ));
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormField<String>(builder: (FormFieldState<String> state) {
                return InputDecorator(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(12, 10, 20, 20),
                        // labelText: "hi",
                        // labelStyle: textStyle,
                        // labelText: _dropdownValue == null
                        //     ? 'Where are you from'
                        //     : 'From',

                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 16.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontFamily: "verdana_regular",
                        ),
                        hint: Text(
                          "Select City",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontFamily: "verdana_regular",
                          ),
                        ),
                        value: dropdownValue == null ? null : dropdownValue,
                        isExpanded: true,
                        isDense: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>[
                          'Islamabad',
                          'RawalPindi',
                          'Mangla',
                          'Mirpur'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ));
              }),
            )
          ],
        ),

        // margin: EdgeInsets.only(left: 15, top: 10, right: 15),
      ]),
    );
  }
}
