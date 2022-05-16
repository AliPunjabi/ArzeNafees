// ignore_for_file: prefer_const_constructors, prefer_if_null_operators

import 'package:arzenafees/Components/Export/custom_import.dart';

class listeningscreen extends StatefulWidget {
  listeningscreen({Key? key}) : super(key: key);

  @override
  State<listeningscreen> createState() => _listeningscreenState();
}

class _listeningscreenState extends State<listeningscreen> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Constants.colorMain),
          elevation: 1,
          backgroundColor: Constants.coloroffWhite,
          title: Text(
            "Fresh Listening",
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
                  Navigator.of(context).maybePop();
                }),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Fresh Listening',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              FormField<String>(builder: (FormFieldState<String> state) {
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
            ],
          ),
        ),
      ),
    );
  }
}
