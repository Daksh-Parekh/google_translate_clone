import 'package:flutter/material.dart';
import 'package:google_translate_clone/screens/home_page/provider/home_provider.dart';
import 'package:google_translate_clone/utils/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
      ],
      child: MaterialApp(
        routes: AppRoutes.routes,
      ),
    );
  }
}
