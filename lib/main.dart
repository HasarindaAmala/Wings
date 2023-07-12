


import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
// For performing some operations asynchronously
import 'dart:async';


// For using PlatformException
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

import 'package:flutter_app/signIn.dart';

import 'package:permission_handler/permission_handler.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async{


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  // Initialize the FirebaseRealtime Database
  FirebaseDatabase database = FirebaseDatabase.instance;
  await Permission.bluetooth.request();
  await Permission.location.request();

  // Write data to the database
  database.ref().child('message').set('Hello, World!');

  // Read data from the database
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('users/uid').get();
  if (snapshot.exists) {
  print(snapshot.value);
  } else {
  print('No data available.');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get conferenceID => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BluetoothApp(),
    );
  }
}

class BluetoothApp extends StatefulWidget {
  const BluetoothApp({super.key});

  @override
  BluetoothAppState createState() => BluetoothAppState();
}

class BluetoothAppState extends State<BluetoothApp> {
  // Initializing the Bluetooth connection state to be unknown
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  // Initializing a global key, as it would help us in showing a SnackBar later
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // Get the instance of the Bluetooth
  final FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
  // Track the Bluetooth connection with the remote device
  BluetoothConnection? connection;

  late int _deviceState;

  bool isDisconnecting = false;

  Map<String, Color> colors = {
    'onBorderColor': Colors.green,
    'offBorderColor': Colors.red,
    'neutralBorderColor': Colors.transparent,
    'onTextColor': Colors.green,
    'offTextColor': Colors.red,
    'neutralTextColor': Colors.blue,
  };

  // To track whether the device is still connected to Bluetooth
  // bool? get isConnected => connection?.isConnected;
  bool? get isConnected => connection != null && connection!.isConnected;

  // Define some variables, which will be required later
  List<BluetoothDevice> _devicesList = [];
  BluetoothDevice? _device;
  bool _connected = false;
  bool _isButtonUnavailable = false;

  @override
  void initState() {
    super.initState();

    // Get current state
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    _deviceState = 0; // neutral

    // If the bluetooth of the device is not enabled,
    // then request permission to turn on bluetooth
    // as the app starts up
    enableBluetooth();

    // Listen for further state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;
        if (_bluetoothState == BluetoothState.STATE_OFF) {
          _isButtonUnavailable = true;
        }
        getPairedDevices();
      });
    });
  }

  @override
  void dispose() {
    // Avoid memory leak and disconnect
    if (isConnected!) {
      isDisconnecting = true;
      connection?.dispose();
      // connection = null;
    }

    super.dispose();
  }

 // Request Bluetooth permission from the user
  Future<void> enableBluetooth() async {
    // Retrieving the current Bluetooth state
    _bluetoothState = await FlutterBluetoothSerial.instance.state;

    // If the bluetooth is off, then turn it on first
    // and then retrieve the devices that are paired.
    if (_bluetoothState == BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
      await getPairedDevices();
      // return true;
    } else {
      await getPairedDevices();
    }
    // return false;
  }

  // Future<void> enableBluetooth() async {
  //   _bluetoothState = await _bluetooth.state;
  //   if (_bluetoothState == BluetoothState.STATE_OFF) {
  //     await _bluetooth.requestEnable();
  //   }
  //   final status = await Permission.bluetooth.request();
  //   if (status != PermissionStatus.granted) {
  //     // Permission denied
  //     // Handle denied permission scenario
  //     return;
  //   }
  // }

  // For retrieving and storing the paired devices
  // in a list.
  Future<void> getPairedDevices() async {
    List<BluetoothDevice> devices = [];

    // To get the list of paired devices
    try {
      devices = await _bluetooth.getBondedDevices();
    } on PlatformException {
      debugPrint("Error");
    }

    // It is an error to call [setState] unless [mounted] is true.
    if (!mounted) {
      return;
    }

    // Store the [devices] list in the [_devicesList] for accessing
    // the list outside this class
    setState(() {
      _devicesList = devices;
    });
  }

  // Now, its time to build the UI
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return MaterialApp(

      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("WIIINGS"),
          backgroundColor: Colors.indigo,
          actions: <Widget>[
            ElevatedButton.icon(
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: const Text(
                "Refresh",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(30),
              // ),
              // splashColor: Colors.deepPurple,
              onPressed: () async {
                // So, that when new devices are paired
                // while the app is running, user can refresh
                // the paired devices list.
                await getPairedDevices().then((_) {
                  //show('Device list refreshed');
                });
              },
            ),
          ],
        ),
        body: Container(
          height: _height,
          width: _width,
          color: Color(0xFF1A193B),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Visibility(
                visible: _isButtonUnavailable &&
                    _bluetoothState == BluetoothState.STATE_ON,
                child: const LinearProgressIndicator(
                  backgroundColor: Colors.yellow,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Expanded(
                      child: Text(
                        'Enable Bluetooth',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Switch(
                      value: _bluetoothState.isEnabled,
                      onChanged: (bool value) {
                        future() async {
                          if (value) {
                            await FlutterBluetoothSerial.instance
                                .requestEnable();
                          } else {
                            await FlutterBluetoothSerial.instance
                                .requestDisable();
                          }

                          await getPairedDevices();
                          _isButtonUnavailable = false;

                          if (_connected) {
                            _disconnect();
                          }
                        }

                        future().then((_) {
                          setState(() {});
                        });
                      },
                    )
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "PAIRED DEVICES",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              'Device:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            DropdownButton(
                              items: _getDeviceItems(),
                              onChanged: (value) =>
                                  setState(() => _device = value!),
                              value: _devicesList.isNotEmpty ? _device : null,
                            ),
                            ElevatedButton(
                              onPressed: _isButtonUnavailable
                                  ? null
                                  : _connected ? _disconnect : _connect,
                              child:
                              Text(_connected ? 'Disconnect' : 'Connect'),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          onPressed: _connected
                              ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => signIn(connection: connection)),
                            );
                          } : null,
                          child: Text("Lets fly",),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(_width*0.3, _height*0.07),
                            side: BorderSide(color: Colors.white.withOpacity(0.3),width: 2.0),
                            elevation: 10.0,
                          ),
                        ),
                      ),

                    ],
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "NOTE: If you cannot find the device in the list, please pair the device by going to the bluetooth settings",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          // elevation: 2,
                          child: const Text("Bluetooth Settings"),
                          onPressed: () {
                            FlutterBluetoothSerial.instance.openSettings();
                          },
                        ),
                        ElevatedButton(onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => signIn(connection: connection)),
                          );
                        }, child: Text("Signin"),)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Create the List of devices to be shown in Dropdown Menu
  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devicesList.isEmpty) {
      items.add(const DropdownMenuItem(
        child: Text('NONE',style: TextStyle(color: Colors.white),),
      ));
    } else {
      for (var device in _devicesList) {
        items.add(DropdownMenuItem(
          value: device,
          child: Text(device.name!,style: TextStyle(color: Colors.black,),),
        ));
      }
    }
    return items;
  }

  // Method to connect to bluetooth
  // void _connect() async {
  //   setState(() {
  //     _isButtonUnavailable = true;
  //   });
  //   if (_device == null) {
  //    // show('No device selected');
  //   } else {
  //     // if (connection == null || (connection != null && !isConnected!)) {
  //     if (!isConnected!) {
  //       await BluetoothConnection.toAddress(_device?.address).then((conn) {
  //         debugPrint('Connected to the device');
  //         connection = conn;
  //         setState(() {
  //           _connected = true;
  //         });
  //
  //         connection?.input?.listen(null).onDone(() {
  //           if (isDisconnecting) {
  //             debugPrint('Disconnecting locally!');
  //           } else {
  //             debugPrint('Disconnected remotely!');
  //           }
  //           if (mounted) {
  //             setState(() {});
  //           }
  //         });
  //       }).catchError((error) {
  //         debugPrint('Cannot connect, exception occurred');
  //         debugPrint(error);
  //       });
  //       //show('Device connected');
  //
  //       setState(() => _isButtonUnavailable = false);
  //     }
  //   }
  // }
  void _connect() async {
    setState(() {
      _isButtonUnavailable = true;
    });

    if (_device == null) {
      // show('No device selected');
    } else {
      if (!isConnected!) {
        try {
          BluetoothConnection connection = await BluetoothConnection.toAddress(_device!.address);
          debugPrint('Connected to the device');
          setState(() {
            _connected = true;
            _isButtonUnavailable = false;
            this.connection = connection;
          });

          connection.input?.listen(null).onDone(() {
            if (isDisconnecting) {
              debugPrint('Disconnecting locally!');
            } else {
              debugPrint('Disconnected remotely!');
            }
            if (mounted) {
              setState(() {});
            }
          });
        } catch (e) {
          debugPrint('Cannot connect, exception occurred');
          debugPrint(e.toString());
          // Handle the error and show appropriate messages or take any necessary actions.
        }
      } else {
        debugPrint('Already connected');
      }
    }
  }




  // Method to disconnect bluetooth
  void _disconnect() async {
    setState(() {
      _isButtonUnavailable = true;
      _deviceState = 0;
    });

    await connection?.close();
   // show('Device disconnected');
    if (!connection!.isConnected) {
      setState(() {
        _connected = false;
        _isButtonUnavailable = false;
      });
    }
  }

  // Method to send message,
  // for turning the Bluetooth device on
  // void _sendOnMessageToBluetooth() async {
  //   Uint8List data = utf8.encode("1" "\r\n") as Uint8List;
  //   connection?.output.add(data);
  //   await connection?.output.allSent;
  //   show('Device Turned On');
  //   setState(() {
  //     _deviceState = 1; // device on
  //   });
  // }

  // Method to send message,
  // // for turning the Bluetooth device off
  // void _sendOffMessageToBluetooth() async {
  //   Uint8List data = utf8.encode("0" "\r\n") as Uint8List;
  //   connection?.output.add(data);
  //   await connection?.output.allSent;
  //   //show('Device Turned Off');
  //   setState(() {
  //     _deviceState = -1; // device off
  //   });
  // }

  // Method to show a Snackbar,
  // taking message as the text
  // Future show(
  //     String message, {
  //       Duration duration = const Duration(seconds: 1),
  //     }) async {
  //   await Future.delayed(const Duration(milliseconds: 100));
  //   // _scaffoldKey.currentState.showSnackBar(
  //   //   SnackBar(
  //   //     content: Text(
  //   //       message,
  //   //     ),
  //   //     duration: duration,
  //   //   ),
  //   // );
  //   ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
  //     SnackBar(
  //       content: Text(
  //         message,
  //       ),
  //       duration: duration,
  //     ),
  //   );
  // }
}