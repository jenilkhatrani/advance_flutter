import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'interfacechanger_provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  late DateTime? pickedDate;
  late DateTime dateTime;
  Timer? _timer;
  DateTime _currentTime = DateTime.now();

  final _dateController1 = TextEditingController();
  final _dateController2 = TextEditingController();
  String _result = '';

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    _startTimer();
  }
  DateTime _selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return (Provider.of<interFaceChangerProvider>(context)
        .interfacechanger_model
        .isAndroid)?
    CupertinoPageScaffold(
      navigationBar:  CupertinoNavigationBar(
        trailing :CupertinoSwitch(
          value: (Provider.of<interFaceChangerProvider>(context)
              .interfacechanger_model
              .isAndroid),
          onChanged: (value) {
            Provider.of<interFaceChangerProvider>(context,
                listen: false)
                .interfacechanger();
          }),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'Selected Date:',
              style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '${_selectedDate.year} - ${_selectedDate.month} - ${_selectedDate.day}',
              style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            CupertinoButton(
              color:Colors.black ,
              child: const Text('Open date Picker'),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 350,
                      color: CupertinoColors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: 250,
                            child: Container(
                              height: 250,
                              child: CupertinoDatePicker(
                                initialDateTime: _selectedDate,
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (val) {
                                  setState(() {
                                    _selectedDate = val;
                                  });
                                },
                              ),
                            ),
                          ),
                          CupertinoButton(
                            child: const Text('Done'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            // Container(
            //   height: 200,
            //   child: CupertinoDatePicker(
            //     initialDateTime: _selectedDate,
            //     mode: CupertinoDatePickerMode.date,
            //     onDateTimeChanged: (val) {
            //       setState(() {
            //         _selectedDate = val;
            //       });
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    ):
    Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: const Text('Date Time'),
        actions: [
          Switch(
              value: (Provider.of<interFaceChangerProvider>(context)
                  .interfacechanger_model
                  .isAndroid),
              onChanged: (value) {
                Provider.of<interFaceChangerProvider>(context,
                    listen: false)
                    .interfacechanger();
              }),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              OutlinedButton(
                  style: const ButtonStyle(
                      iconColor: WidgetStateColor.transparent),
                  onPressed: () async {
                    pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030),
                        initialDatePickerMode: DatePickerMode.day,
                        // initialEntryMode: DatePickerEntryMode.calendarOnly
                    );

                    setState(() {});
                  },
                  child: const Text('Open date picker')),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Date ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              (pickedDate == null)
                  ? Container(
                child: Text('Pick the date'),
              )
                  : Text(
                style: GoogleFonts.playfairDisplay(fontSize: 30),
                '${pickedDate!.day} / ${pickedDate!.month} / ${pickedDate!.year}',
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Time ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('${_currentTime.hour} : ${_currentTime.minute} : ${_currentTime.second}',
                style: const TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20,),
              TextField(

                controller: _dateController1,
                decoration: InputDecoration(

                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  label:Text( 'Enter first date (yyyy-MM-dd)'),
                  labelStyle: TextStyle(fontSize: 20)
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 20,),
              TextField(
                controller: _dateController2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    label:Text( 'Enter second date (yyyy-MM-dd)'),
                    labelStyle: TextStyle(fontSize: 20)
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateDifference,
                child: Text('Calculate Difference'),
              ),
              SizedBox(height: 20),
              Text(
                _result,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );

  }

  void _startTimer(){
    _timer= Timer.periodic(const Duration(seconds: 1),(Timer t) => _updateTime());
  }

  void _updateTime(){
    setState((){
      _currentTime = DateTime.now();
    });
  }

  void _calculateDifference() {
    try {
      final dateFormat = DateFormat('yyyy-MM-dd');
      final date1 = dateFormat.parse(_dateController1.text);
      final date2 = dateFormat.parse(_dateController2.text);
      final difference = date2.difference(date1).inDays;
      setState(() {
        _result = 'Difference: $difference days';
      });
    } catch (e) {
      setState(() {
        _result = 'Invalid date format. Please use yyyy-MM-dd.';
      });
    }
  }
  }