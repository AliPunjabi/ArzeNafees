// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:arzenafees/Components/Export/custom_import.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({Key? key}) : super(key: key);
  final _textname = TextEditingController();
  final _textemail = TextEditingController();
  final _textphone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'Need Some Help?',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Reach out to us with your issue, question or feedback\nWe Love Hearing From You',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 244, 239, 239),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 24, 24, 24),
                  child: Column(children: [
                    CustomTextField(
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).nextFocus();
                      },
                      textInputAction: TextInputAction.next,
                      hintText: 'Name',
                      textInputType: TextInputType.emailAddress,
                      textEditingController: _textname,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).nextFocus();
                      },
                      textInputAction: TextInputAction.next,
                      hintText: 'Email',
                      textInputType: TextInputType.emailAddress,
                      textEditingController: _textemail,
                      validator: validateEmail,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).nextFocus();
                      },
                      textInputAction: TextInputAction.next,
                      hintText: 'Phone',
                      textInputType: TextInputType.emailAddress,
                      textEditingController: _textphone,
                      validator: validateMobile,
                    ),
                    const SizedBox(height: 25),
                    TextField(
                      maxLines: 5,
                      expands: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              const BorderSide(width: 0.5, color: Colors.grey),
                        ),
                        hintText: "Message",
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Constants.colorSecond,
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                        width: 330,
                        child: CustomElevatedButton(
                            onPressed: (() {}), child: Text('Send')))
                  ]),
                )),
          ],
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern as String);
    if (value!.isEmpty) {
      return 'Email Required';
    } else if (!regex.hasMatch(value)) {
      return 'Enter valid email';
    } else {
      return null;
    }
  }

  String? validateMobile(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}
