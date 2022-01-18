import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:servicezz_clone/models/time_container.dart';
import 'package:servicezz_clone/screens/address_screen_aftercheckout.dart';
import 'package:servicezz_clone/shared/colors.dart';

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

  List<TimingClass> timings = [
    TimingClass(time: '09:00 am', diffFromNow: "", timeInHour: "09"),
    TimingClass(time: '10:00 am', diffFromNow: "", timeInHour: "10"),
    TimingClass(time: '11:00 am', diffFromNow: "", timeInHour: "11"),
    TimingClass(time: '12:00 am', diffFromNow: "", timeInHour: "12"),
    TimingClass(time: '01:00 pm', diffFromNow: "", timeInHour: "13"),
    TimingClass(time: '02:00 pm', diffFromNow: "", timeInHour: "14"),
    TimingClass(time: '03:00 pm', diffFromNow: "", timeInHour: "15"),
    TimingClass(time: '04:00 pm', diffFromNow: "", timeInHour: "16"),
    TimingClass(time: '05:00 pm', diffFromNow: "", timeInHour: "17"),
    TimingClass(time: '06:00 pm', diffFromNow: "", timeInHour: "18"),
    TimingClass(time: '07:00 pm', diffFromNow: "", timeInHour: "19"),
    TimingClass(time: '08:00 pm', diffFromNow: "", timeInHour: "20"),
  ];

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

  String _daySelection = "";
  String? _timeSelected;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2023));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        future =
            "${picked.toString().substring(8, 10)} - ${picked.toString().substring(5, 7)}";
      });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int nowInt = int.parse(now.toString().substring(11, 13));

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
    ScrollPhysics _toScroll = const BouncingScrollPhysics();

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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() {
                      _daySelection = "Today";
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _daySelection == "Today"
                            ? orangeColorBackground
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: _daySelection == "Today"
                              ? Colors.transparent
                              : Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 12.0),
                        child: Text(
                          'Today',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: _daySelection == "Today"
                                ? orangeColor
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      _daySelection = "Tomorrow";
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _daySelection == "Tomorrow"
                            ? orangeColorBackground
                            : transparent,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: _daySelection == "Tomorrow"
                              ? transparent
                              : Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 12.0),
                        child: Text(
                          'Tomorrow',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: _daySelection == "Tomorrow"
                                  ? orangeColor
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      _daySelection = future;
                      _selectDate(context);
                    }),
                    child: Container(
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
                          _timeSelected = "";
                        }

                        _isTapped[index]
                            ? _timeSelected = timings[index].time
                            : null;
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: _daySelection == "Today"
                              ? int.parse(timings[index].timeInHour) > nowInt
                                  ? _isTapped[index]
                                      ? orangeColorBackground
                                      : Colors.transparent
                                  : grey_light
                              : _isTapped[index]
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
                            timings[index].time,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color:
                                  int.parse(timings[index].timeInHour) > nowInt
                                      ? _isTapped[index]
                                          ? orangeColor
                                          : Colors.black
                                      : _isTapped[index]
                                          ? orangeColor
                                          : Colors.black,
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
              style: _timeSelected != null
                  ? widget._buttonStyle.copyWith(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      elevation: MaterialStateProperty.all(0.0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0))))
                  : widget._buttonStyle.copyWith(
                      elevation: MaterialStateProperty.all(0.0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)))),
              child: const Text(
                "Proceed",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddressAfterCheckout()));
              }),
        ),
      ),
    );
  }
}
