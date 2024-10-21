import 'package:fetch_bloc_cubit/cubits/users_cubits.dart';
import 'package:fetch_bloc_cubit/screens/users_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fetch Use Cubit',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (context) => UsersCubits(),
          child: const UsersPage(),
        ));
  }
}
