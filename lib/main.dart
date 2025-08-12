//import 'package:first_practice/view/on_boarding/startup_view.dart';
import 'package:flutter/material.dart';
import 'view/on_boarding/startup_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://nrwkduhiipvymrrxirth.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5yd2tkdWhpaXB2eW1ycnhpcnRoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQ5NzIwMzIsImV4cCI6MjA3MDU0ODAzMn0.bZ0uPZyQj6D_t0pTSE0urNkihypCeTxs8rtd_A-Lt7s';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'poppins'),
      home: const StartupView(),
    );
  }
}
