import 'package:flutter/material.dart';
import 'package:servicezz_clone/shared/colors.dart';

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);
  final serviceList = [
    'No Power',
    'Booting Slow',
    'Restart Computers',
    'Software Issue',
    'Virus Removal',
    'Monitor issue',
    'Others',
  ];

  final _checkedOptions = ['ds', 'svsd'];
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final List<bool> _isChecked = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.serviceList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: card_background,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: ListTile(
                leading: Text(
                  widget.serviceList[index],
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5),
                ),
                trailing: Checkbox(
                  activeColor: orangeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  value: _isChecked[index],
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked[index] = value!;
                    });
                    if (_isChecked[index]) {
                      widget._checkedOptions.add(widget.serviceList[index]);
                    } else {
                      if (widget._checkedOptions
                          .contains(widget.serviceList[index])) {
                        widget._checkedOptions
                            .remove(widget.serviceList[index]);
                      }
                    }
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
