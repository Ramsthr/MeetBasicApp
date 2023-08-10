import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocateScreen extends StatefulWidget {
  const LocateScreen({super.key});

  @override
  State<LocateScreen> createState() => _LocateScreenState();
}

class _LocateScreenState extends State<LocateScreen> {
  List<String> _list = ["sdfds", "sdsd", "ssdf"];
  bool _value = false;
  double? _deviceWidth, _deviceHeight;
  String _selectedCountryCode = '+91';
  TextEditingController _phoneNumberController = TextEditingController();
  List<String> _countryCodes = [
    '+1',
    '+44',
    '+91',
    '+86',
  ];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 226, 218, 218),
      body: Column(
        children: [
          _upImage(),
          Container(
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _welcome(),
                _mobileNo(),
                _checkboxAndAgreement(),
                _buttonlogin(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _upImage() {
    return SizedBox(
      height: _deviceHeight! * 0.5,
      child: Image.asset(
        'assets/Group 1000002119.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _welcome() {
    return Container(
      margin: const EdgeInsets.fromLTRB(31, 0, 0, 5),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget _mobileNo() {
    return Container(
      width: _deviceWidth! * 0.8,
      margin: const EdgeInsets.fromLTRB(20, 0, 0, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(17, 0, 0, 6),
            child: Text(
              "Mobile number",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            // decoration: BoxDecoration(
            //   borderRadius: const BorderRadius.all(
            //     Radius.circular(8),
            //   ),
            //   border: Border.all(
            //     color: const Color.fromARGB(221, 50, 48, 48),
            //   ),
            //   color: Color.fromARGB(221, 213, 203, 203),
            // ),
            width: _deviceWidth! * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: _deviceHeight! * 0.07,
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    border: Border.all(
                      color: const Color.fromARGB(221, 50, 48, 48),
                    ),
                    color: Color.fromARGB(221, 213, 203, 203),
                  ),
                  child: DropdownButton<String>(
                    value: _selectedCountryCode,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCountryCode = newValue!;
                      });
                    },
                    items: _countryCodes
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                // Container(
                //   width: 2,
                //   color: Color.fromARGB(255, 54, 53, 51),
                //   height: 55,
                // ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 100, 0),
                      height: _deviceHeight! * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        border: Border.all(
                          color: const Color.fromARGB(221, 50, 48, 48),
                        ),
                        color: Color.fromARGB(221, 213, 203, 203),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value.length != 10) {
                            return "";
                          }
                          return null;
                        },
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            hintText: 'Phone Number',
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.all(10.0),
                            errorStyle: TextStyle(height: 0)),
                        textAlignVertical: TextAlignVertical.bottom,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _checkboxAndAgreement() {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 0, 0, 15),
      width: _deviceWidth! * 0.7,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Checkbox(
              value: _value,
              onChanged: (bool? newvalue) {
                setState(() {
                  _value = newvalue ?? false;
                });
              }),
          Expanded(
            child: RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 15, color: Colors.black54),
                children: [
                  TextSpan(text: "I agreee to the "),
                  TextSpan(
                    text: "Terms & Conditions",
                    style: TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(text: " and "),
                  TextSpan(
                    text: "Privacy Statement",
                    style: TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonlogin() {
    return SizedBox(
      width: _deviceHeight! * 0.5,
      height: _deviceHeight! * 0.08,
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color.fromARGB(228, 118, 23, 53)),
        ),
        onPressed: _value
            ? () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, 'login');
                  // Validation passed, continue with further logic
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content:
                            Text('Please enter a valid 10-digit phone number.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              }
            : null,
        child: Text(
          "Get OTP",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
