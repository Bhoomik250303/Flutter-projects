import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:servicezz_clone/shared/colors.dart';
import 'package:intl/intl.dart';

class TimeSlot extends StatefulWidget {
  TimeSlot({Key? key}) : super(key: key);

  final ButtonStyle _buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(buttonColorBrands),
      elevation: MaterialStateProperty.all(0.0));
  @override
  _TimeSlotState createState() => _TimeSlotState();
}

class _TimeSlotState extends State<TimeSlot> {
  String future = 'Future';
  List<String> services = [];
  List<String> timings = [
    '09.00 am',
    '10.00 am',
    '11.00 am',
    '12.00 am',
    '01.00 pm',
    '02.00 pm',
    '03.00 pm',
    '04.00 pm',
    '05.00 pm',
    '06.00 pm',
    '07.00 pm',
    '08.00 pm'
  ];

  // DateTime now = DateTime.now();

  List _isTapped = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    var nowNew = DateFormat('hh:mm a').format(DateTime.now());
    print('hour :- ${nowNew}');
    AppBar appBar = AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      titleSpacing: 0.0,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: navColor,
      ),
      title: const Text('Select Date / Time',
          style: TextStyle(color: Colors.black)),
      backgroundColor: card_background,
    );
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    ScrollPhysics _toScroll = BouncingScrollPhysics();

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        physics: _toScroll,
        child: Container(
          constraints: BoxConstraints(
            minHeight: heightScreen - 50,
            maxHeight: heightScreen + 150,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 32.0, bottom: 16.0),
                child: const Text(
                  'Select Day / Date',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 12.0),
                      child: const Text(
                        'Today',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 12.0),
                      child: Text(
                        'Tomorrow',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 12.0,
                      ),
                      child: Text(
                        future,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: const Text(
                  'Select Time',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 12,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 48,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => setState(() {
                        if (_isTapped[index] == false) {
                          for (int i = 0; i < _isTapped.length; i++) {
                            _isTapped[i] = false;
                          }
                          _isTapped[index] = !_isTapped[index];
                        } else {
                          _isTapped[index] = !_isTapped[index];
                        }
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: _isTapped[index]
                              ? orangeColorBackground
                              : Colors.transparent,
                          border: Border.all(
                            color: _isTapped[index]
                                ? Colors.transparent
                                : Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            timings[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color:
                                  _isTapped[index] ? orangeColor : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: card_background,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TextButton(
              style: widget._buttonStyle, //Condition to be coded next.
              // style: _checkedOptions.isNotEmpty
              //     ? widget._buttonStyle.copyWith(
              //         backgroundColor: MaterialStateProperty.all(Colors.black),
              //         elevation: MaterialStateProperty.all(0.0),
              //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //             RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(12.0))))
              //     : widget._buttonStyle.copyWith(
              //         elevation: MaterialStateProperty.all(0.0),
              //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //             RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(12.0)))),
              child: const Text(
                "Proceed",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => Container()));
              }),
        ),
      ),
    );
  }
}
