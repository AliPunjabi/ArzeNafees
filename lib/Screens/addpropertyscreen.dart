// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_if_null_operators
import 'package:arzenafees/Components/Export/custom_import.dart';

enum SingingCharacter { Residential, Plot, Commercial }

class addPropertyScreen extends StatefulWidget {
  @override
  State<addPropertyScreen> createState() => _addPropertyScreenState();
}

TextEditingController _textarea = TextEditingController();
TextEditingController _textaddress = TextEditingController();
TextEditingController _textprice = TextEditingController();

class _addPropertyScreenState extends State<addPropertyScreen> {
  final TextEditingController _controller = TextEditingController();
  SingingCharacter? _character = SingingCharacter.Residential;
  bool _editMode = false;
  bool isChecked = false;

  String? dropdownValue;
  String? dropdownValue2;
  String? dropdownValue3;
  String? dropdownValue4;
  String? dropdownValue5;
  bool bold = false;

  bool italic = false;

  bool underline = false;

  bool align = false;

  bool centerAlign = false;

  bool leftAlign = false;

  bool rightAlign = false;

  bool color = false;
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
      body: SingleChildScrollView(
        child: Column(children: [
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
                child:
                    FormField<String>(builder: (FormFieldState<String> state) {
                  return InputDecorator(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(12, 10, 20, 20),
                          // labelText: "hi",
                          // labelStyle: textStyle,
                          // labelText: _dropdownValue == null
                          //     ? 'Where are you from'
                          //     : 'From',

                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 16.0),
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
                child: Text(
                  'Where is your place located?',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    FormField<String>(builder: (FormFieldState<String> state) {
                  return InputDecorator(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(12, 10, 20, 20),
                          // labelText: "hi",
                          // labelStyle: textStyle,
                          // labelText: _dropdownValue == null
                          //     ? 'Where are you from'
                          //     : 'From',

                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 16.0),
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    FormField<String>(builder: (FormFieldState<String> state) {
                  return InputDecorator(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(12, 10, 20, 20),
                          // labelText: "hi",
                          // labelStyle: textStyle,
                          // labelText: _dropdownValue == null
                          //     ? 'Where are you from'
                          //     : 'From',

                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 16.0),
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
                            "Select Area",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: "verdana_regular",
                            ),
                          ),
                          value: dropdownValue3 == null ? null : dropdownValue3,
                          isExpanded: true,
                          isDense: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue3 = newValue;
                            });
                          },
                          items: <String>[
                            'Blue Area',
                            'H9',
                            'Bani Gaala',
                            'Chak Shehzad',
                            'Shahzad Town',
                            'Sector I9'
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
                child: Text(
                  'OR',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).nextFocus();
                  },
                  textInputAction: TextInputAction.next,
                  hintText: 'Enter New Area',
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _textarea,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 10),
                            child: Text(
                              'Address',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 180,
                            height: 65,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FormField<String>(
                                  builder: (FormFieldState<String> state) {
                                return InputDecorator(
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.fromLTRB(12, 10, 20, 20),
                                        // labelText: "hi",
                                        // labelStyle: textStyle,
                                        // labelText: _dropdownValue == null
                                        //     ? 'Where are you from'
                                        //     : 'From',

                                        errorStyle: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 16.0),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0))),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          fontFamily: "verdana_regular",
                                        ),
                                        hint: Text(
                                          "Sub-Sector",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontFamily: "verdana_regular",
                                          ),
                                        ),
                                        value: dropdownValue4 == null
                                            ? null
                                            : dropdownValue4,
                                        isExpanded: true,
                                        isDense: true,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue4 = newValue;
                                          });
                                        },
                                        items: <String>[
                                          'Mohalla 1',
                                          'Mohalla 2',
                                          'Mohalla 3'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ));
                              }),
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: CustomTextField(
                                onFieldSubmitted: (v) {
                                  FocusScope.of(context).nextFocus();
                                },
                                textInputAction: TextInputAction.next,
                                hintText: 'Enter Address here',
                                textInputType: TextInputType.text,
                                textEditingController: _textaddress,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    checkColor: Constants.colorMain,
                    activeColor: Constants.colorMain,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text(
                    'Display Address on Listing',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add more info for better results',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CustomTextField(
                          onFieldSubmitted: (v) {
                            FocusScope.of(context).nextFocus();
                          },
                          textInputAction: TextInputAction.next,
                          hintText: 'Number of Marlas',
                          textInputType: TextInputType.number,
                          textEditingController: _textaddress,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      height: 65,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                          return InputDecorator(
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(12, 10, 20, 20),
                                  // labelText: "hi",
                                  // labelStyle: textStyle,
                                  // labelText: _dropdownValue == null
                                  //     ? 'Where are you from'
                                  //     : 'From',

                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 16.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontFamily: "verdana_regular",
                                  ),
                                  hint: Text(
                                    "Marla",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: "verdana_regular",
                                    ),
                                  ),
                                  value: dropdownValue5 == null
                                      ? null
                                      : dropdownValue5,
                                  isExpanded: true,
                                  isDense: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue5 = newValue;
                                    });
                                  },
                                  items: <String>['Marla', 'Kanal']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ));
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).nextFocus();
                  },
                  textInputAction: TextInputAction.next,
                  hintText: 'Price in (PKR)',
                  textInputType: TextInputType.number,
                  textEditingController: _textprice,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    height: 170,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.text,
                          textAlign: align
                              ? TextAlign.justify
                              : centerAlign
                                  ? TextAlign.center
                                  : leftAlign
                                      ? TextAlign.left
                                      : rightAlign
                                          ? TextAlign.right
                                          : TextAlign.start,
                          decoration: InputDecoration(
                            hintText: 'Description',
                            errorStyle: TextStyle(color: Colors.red),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                          maxLines: 6,
                          style: TextStyle(
                            decoration:
                                underline ? TextDecoration.underline : null,
                            fontSize: 16,
                            color: color ? Colors.blue : Colors.black,
                            fontWeight: bold ? FontWeight.bold : null,
                            fontStyle:
                                italic ? FontStyle.italic : FontStyle.normal,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            color: Color.fromARGB(255, 203, 197, 197),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        bold = bold ? false : true;
                                      });
                                    },
                                    child: Icon(Icons.format_bold)),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        italic = italic ? false : true;
                                      });
                                    },
                                    child: Icon(Icons.format_italic)),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        underline = underline ? false : true;
                                      });
                                    },
                                    child: Icon(Icons.format_underline)),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        align = align ? false : true;
                                        centerAlign = false;
                                        leftAlign = false;
                                        rightAlign = false;
                                      });
                                    },
                                    child: Icon(Icons.menu)),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        centerAlign =
                                            centerAlign ? false : true;
                                        align = false;
                                        leftAlign = false;
                                        rightAlign = false;
                                      });
                                    },
                                    child: Icon(Icons.filter_list)),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        leftAlign = leftAlign ? false : true;
                                        align = false;
                                        centerAlign = false;
                                        rightAlign = false;
                                      });
                                    },
                                    child: Icon(Icons.sort)),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        rightAlign = rightAlign ? false : true;
                                        align = false;
                                        centerAlign = false;
                                        leftAlign = false;
                                      });
                                    },
                                    child: Icon(Icons.segment)),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        color = color ? false : true;
                                      });
                                    },
                                    child: Icon(Icons.format_color_fill))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // margin: EdgeInsets.only(left: 15, top: 10, right: 15),
        ]),
      ),
    );
  }
}
