import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swipe_to_achieve/swipe_to_achieve.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.amber,
        ),
        backgroundColor: Colors.amber,
        elevation: 0.0,
        title: const Text('Swipe to Achive'),
      ),
      body: Center(
        child: SwipeToAchieve(
          width: 250.0,
          title: 'Swipe To ...',
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
          achievedBackgroundColor: Colors.red,
          startBackgroundColor: Colors.blue.withOpacity(0.5),
          startCircleColor: Colors.deepOrangeAccent,
          circleRadius: 100.0,
          achievedCircleColor: Colors.cyanAccent,
          onWhenEnd: (v) {
            showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.success(
                  message: 'YorqinBek Yuldashev',
                ),
                displayDuration: const Duration(milliseconds: 500));
          },
          onWhenReverse: (value) => showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.error(
              message: 'YorqinBek Yuldashev',
            ),
            displayDuration: const Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }
}
