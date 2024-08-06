import 'package:adv_timer/interfacechanger_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

 late TimeOfDay? pickedTime;
  TimeOfDay? pickedTime2;

 DateTime? pickedCupertinoTime;
 String period ="";
 String _validationMessage = '';
 
 @override
  void initState() {
    super.initState();
    
    pickedTime = TimeOfDay.now();
    pickedTime2 = TimeOfDay(hour: 9, minute: 0);

    pickedCupertinoTime =DateTime.now();
    
    if(pickedCupertinoTime!.hour>=12){
      period ='pm';
    }
    else{
      period ='am';
    }

    if(pickedCupertinoTime!.hour>=12){
     pickedCupertinoTime!.hour - 12 ;
    }

  }


  @override
  Widget build(BuildContext context) {
    if ((Provider.of<interFaceChangerProvider>(context)
        .interfacechanger_model
        .isAndroid == false)) {
      return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: Colors.black,

          middle: Text('Time Picker' ,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
                  children: [
            Row(
              children: [
                Text('Android Mode',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
               const Spacer(),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CupertinoSwitch(
                    activeColor: Colors.black,
                      thumbColor: Colors.black,
                      trackColor: Colors.cyan,
                      value: (Provider.of<interFaceChangerProvider>(context)
                          .interfacechanger_model
                          .isAndroid),
                      onChanged: (value) {
                        Provider.of<interFaceChangerProvider>(context, listen: false).interfacechanger();
                      }),
                ),
              ],
            ),
                    (pickedCupertinoTime==null)?
                    Container():
                        Text('${pickedCupertinoTime!.hour} : ${pickedCupertinoTime!.minute}  $period'),
                        SizedBox(height: 50,),
            CupertinoButton(
              color:Colors.black ,
              child: const Text('Open Time Picker'),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 300,
                      color: CupertinoColors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: 200,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.time,
                              initialDateTime: DateTime.now(),
                              onDateTimeChanged: (DateTime val) {
                                pickedCupertinoTime = val;

                                if(pickedCupertinoTime!.hour>=12){
                                  period ='pm';
                                }
                                else{
                                  period ='am';
                                }
                                if(pickedCupertinoTime!.hour >= 12){
                                  pickedCupertinoTime!.hour - 12 ;
                                }

                                setState(() {});
                              },
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
                  ],
                ),
          ),
        ));
    } else {
      return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
              value: (Provider.of<interFaceChangerProvider>(context)
                  .interfacechanger_model
                  .isAndroid == false),
              
              onChanged: (value) {
                Provider.of<interFaceChangerProvider>(context, listen: false).interfacechanger();
              }),
        ],
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Time Picker',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            (pickedTime == null) ?
            Text('${TimeOfDay.fromDateTime(DateTime.now())}',style: const TextStyle(fontSize: 20),) :
            Text('${pickedTime!.hour} :'
                ' ${pickedTime!.minute}  '
                '${pickedTime!.period.name}',
              style: const TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold
              ),),

            OutlinedButton.icon(

              icon: const Icon(Icons.watch_later_outlined),
              label: const Text('Open Time picker', style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
              ),),
              onPressed: () async {
                pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                setState(() {});
              },

            ),
            
            
            
            Divider(height: 10,thickness: 2,),
            (pickedTime2 == null) ?
            Text('select  a time',style: const TextStyle(fontSize: 20),)
                :
            Text('${pickedTime2!.hour} :'
                ' ${pickedTime2!.minute}  '
                '${pickedTime2!.period.name}',
              style: const TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold
              ),),

            OutlinedButton.icon(

              icon: const Icon(Icons.watch_later_outlined),
              label: const Text('Open Time picker', style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
              ),),
              onPressed: () async {
                pickedTime2 = await showTimePicker(
                  context: context,
                  initialTime:TimeOfDay(hour: 9, minute: 0),
                );
                setState(() {});
              },

            ),

            Divider(thickness: 2,),
            (pickedTime == null) ?
            Text('${TimeOfDay.fromDateTime(DateTime.now())}',style: const TextStyle(fontSize: 20),) :
            Text('${pickedTime!.hour} '
                '${pickedTime!.period.name}',
              style: const TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold
              ),),

            OutlinedButton.icon(

              icon: const Icon(Icons.watch_later_outlined),
              label: const Text('Open Time picker', style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
              ),),
              onPressed: () async {
                pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                setState(() {});
              },

            ),

          ],
        ),
      ),
    );
    }
  }
}
