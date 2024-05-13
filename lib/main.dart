import 'package:flutter/material.dart';
import 'package:flutter_nexoft/core/contants/string.dart';
import 'package:flutter_nexoft/core/theme/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'features/contacts/view/contacts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: AppStringConst.appName,
          debugShowCheckedModeBanner: false,
          theme: appTheme(context),
          home: const ContactsView(),
        );
      },
    );
  }
}
