// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_if_null_operators
import 'dart:convert';
import 'dart:io';

import 'package:arzenafees/Components/Export/custom_import.dart';
import 'package:arzenafees/model/addproperty.dart';
import 'package:arzenafees/model/areasubtype.dart';
import 'package:arzenafees/services/addpropertyapi.dart';
import 'package:arzenafees/services/areaguideapi.dart';
import 'package:arzenafees/services/areasubtypeapi.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

enum SingingCharacter { Residential, Plot, Commercial }

class addPropertyScreen extends StatefulWidget {
  @override
  State<addPropertyScreen> createState() => _addPropertyScreenState();
}

TextEditingController _textarea = TextEditingController();
TextEditingController _textaddress = TextEditingController();
TextEditingController _textprice = TextEditingController();
String? strCountryCode = '+92';
var groupValue;

class _addPropertyScreenState extends State<addPropertyScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController _controller7 = TextEditingController();
  final TextEditingController _controller8 = TextEditingController();
  final TextEditingController _controller9 = TextEditingController();
  final TextEditingController _controller10 = TextEditingController();
  Future<Addproperty>? _futureproperty;
  SingingCharacter? _character = SingingCharacter.Residential;
  bool _editMode = false;
  bool isChecked = false;
  String category = 'buy';
  String? radio = "Residential";
  File? image;
  File? uploadimage;
  String? baseimage;

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
  initState() {
    super.initState();

    initialSubtype().whenComplete(() => print("complete"));
  }

  initialSubtype() async {
    await fetchareasubtype(radio);
  }

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
                  if (index == 0) {
                    setState(() {
                      category = "buy";
                    });
                  } else {
                    setState(() {
                      category = "rent";
                    });
                  }
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
                onChanged: (SingingCharacter? value) async {
                  _character = value;
                  radio = 'Residential';
                  await fetchareasubtype(radio);
                  setState(() {});
                },
              ),
              RadioListTile<SingingCharacter>(
                title: const Text('Plot'),
                value: SingingCharacter.Plot,
                activeColor: Constants.colorMain,
                groupValue: _character,
                onChanged: (SingingCharacter? value) async {
                  _character = value;
                  radio = 'Plots';
                  await fetchareasubtype(radio);
                  setState(() {});
                },
              ),
              RadioListTile<SingingCharacter>(
                title: const Text('Commercial'),
                value: SingingCharacter.Commercial,
                activeColor: Constants.colorMain,
                groupValue: _character,
                onChanged: (SingingCharacter? value) async {
                  _character = value;
                  radio = 'Commercial';
                  await fetchareasubtype(radio);
                  setState(() {});
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
                          items:
                              subtypes?.map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              child: Text(value.name),
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
                    //height: 170,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextFormField(
                          controller: _controller1,
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 370,
                    padding: const EdgeInsets.all(15),
                    //constraints: const BoxConstraints(minHeight: 70),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 50,
                            width: 250,
                            child: ElevatedButton(
                                onPressed: () {
                                  pickImage();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: image != null
                                    ? Image.file(image!)
                                    : Text(
                                        'Select from gallery',
                                        style: TextStyle(
                                            fontFamily: 'Roboto', fontSize: 20),
                                      ))),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'OR',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            height: 50,
                            width: 250,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: Text(
                                  'Take Photo',
                                  style: TextStyle(
                                      fontFamily: 'Roboto', fontSize: 20),
                                ))),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '*Max size should be 5mb',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(width: 0.5, color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 15),
                      Text(strCountryCode!),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: _controller2,
                          textInputAction: TextInputAction.next,
                          maxLength: 10,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          buildCounter: (context,
                                  {required currentLength,
                                  required isFocused,
                                  maxLength}) =>
                              null,
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (v) {
                            FocusScope.of(context).nextFocus();
                          },
                          decoration: const InputDecoration.collapsed(
                              hintText: '3123456789'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _futureproperty = addproperty(
                            category,
                            _controller.text,
                            radio,
                            dropdownValue2,
                            dropdownValue,
                            dropdownValue3,
                            _textaddress.text,
                            dropdownValue5,
                            _textprice.text,
                            _controller1.text,
                            baseimage,
                            _controller2.text,
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
                      ))),
            ],
          ),

          // margin: EdgeInsets.only(left: 15, top: 10, right: 15),
        ]),
      ),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        uploadimage = File(image!.path);
      });
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
      List<int> imageBytes = uploadimage!.readAsBytesSync();
      baseimage = base64Encode(imageBytes);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
