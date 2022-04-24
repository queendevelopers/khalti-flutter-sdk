import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: 'test_public_key_026276e8ef4e4e2580e1735501b59b68',
        builder: (context, navigatorKey) {
          return MaterialApp(
            title: 'Flutter Khalti Demo',
            navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
              // This makes the visual density adapt to the platform that you run
              // the app on. For desktop platforms, the controls will be smaller and
              // closer together (more dense) than on mobile platforms.
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
          child: TextButton(
        onPressed: () {
          KhaltiScope.of(context).pay(
            config: getPaymentConfig(),
            preferences: [
              PaymentPreference.connectIPS,
              PaymentPreference.eBanking,
              PaymentPreference.sct,
              PaymentPreference.mobileBanking,
              PaymentPreference.khalti,
            ],
            onSuccess: (onSuccess) {
              debugPrint(onSuccess.toString());
            },
            onFailure: (onFailure) {
              debugPrint(onFailure.toString());
            },
            onCancel: () {
              debugPrint('canceled payment');
            },
          );
        },
        child: Text('Launch Payment Interface'),
      )),
    ));
  }

  PaymentConfig getPaymentConfig() {
    return PaymentConfig(
      amount: 10000, // Amount should be in paisa
      productIdentity: 'dell-g5-g5510-2021',
      productName: 'Dell G5 G5510 2021',
      productUrl: 'https://www.khalti.com/#/bazaar',
      additionalData: {
        // Not mandatory; can be used for reporting purpose
        'vendor': 'Khalti Bazaar',
      },
    );
  }
}
