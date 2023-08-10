import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double? _deviceHeight, _deviceWidth;
  final List<String> _list = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  Color? _col = Colors.amber;
  int i = 0;
  String? _tet;
  final List<String> _locations = [
    "Jodhpur,Rajasthan",
    "Delhi, India",
    "Banglore,India",
  ];
  String? _currentlocation;

  @override
  void initState() {
    i = DateTime.now().weekday % 7;
    _currentlocation = _locations[0];
    _tet = _list[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 167, 124, 155),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: _deviceWidth!,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Group 1000002436.png"))),
                child: Column(
                  children: [
                    _titleWidget(),
                    _profileImage(),
                    _description(),
                  ],
                ),
              ),
              _containsdetail(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
      child: RichText(
        text: const TextSpan(
          children: [
            WidgetSpan(
              child: Icon(Icons.circle),
            ),
            TextSpan(
                text: " It's a Date!",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87))
          ],
        ),
      ),
    );
  }

  Widget _profileImage() {
    // return Container(
    //   height: _deviceHeight! * 0.3,
    //   width: _deviceWidth! * 0.3,
    //   decoration: const BoxDecoration(
    //     shape: BoxShape.circle,
    //     image: DecorationImage(
    //       fit: BoxFit.cover,
    //       image: AssetImage("assets/Rectangle 18565.png"),
    //     ),
    //   ),
    // );
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Image.asset("assets/Rectangle 18565.png"),
    );
  }

  Widget _description() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
      // height: _deviceHeight! * 0.05,
      child: const Column(
        children: [
          Text(
            "This meeting is accepted by",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Text(
            "Robaert Fox",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
          ),
          Text(
            "in 1 week 2 days",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _containsdetail() {
    return Expanded(
      child: Container(
        height: _deviceHeight! * 0.5,
        width: _deviceWidth!,
        decoration: const BoxDecoration(
          color: Color.fromARGB(115, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Meet Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            _daydate(),
            _buttonlog(),
          ],
        ),
      ),
    );
  }

  Widget _daydate() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      padding: EdgeInsets.fromLTRB(20, 9, 20, 9),
      width: _deviceWidth! * 0.9,
      height: _deviceHeight! * 0.13,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Color.fromARGB(161, 255, 255, 255),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${_list[i]}"),
                Text(
                  "|",
                ),
                Text(
                    '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'),
                Text("|"),
                Text("${DateTime.now().hour}:${DateTime.now().minute}"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Text("   Locations : "),
              ),
              Expanded(
                child: DropdownButton<String>(
                  icon: Icon(Icons.keyboard_arrow_right),
                  value: _currentlocation,
                  onChanged: (String? newValue) {
                    setState(() {
                      _currentlocation = newValue!;
                    });
                  },
                  items:
                      _locations.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buttonlog() {
    return Container(
      width: _deviceWidth! * 0.8,
      height: _deviceHeight! * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: _deviceWidth! * 0.8,
            height: _deviceHeight! * 0.08,
            child: FilledButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel Meet",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 215, 180, 180)),
              ),
            ),
          ),
          SizedBox(
            width: _deviceWidth! * 0.8,
            height: _deviceHeight! * 0.08,
            child: FilledButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 106, 42, 71)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Close",
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     setState(() {
          //       if (_col == Colors.amber) {
          //         _col = Colors.red;
          //       } else {
          //         _col = Colors.amber;
          //       }
          //     });
          //     print('MyButton was tapped!');
          //   },
          //   child: Container(
          //     height: 50,
          //     padding: const EdgeInsets.all(8),
          //     margin: const EdgeInsets.symmetric(horizontal: 8),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(5),
          //       color: _col,
          //     ),
          //     child: const Center(
          //       child: Text('Engage'),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
