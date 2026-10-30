import  'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import 'dashboard_view.dart';

class LoginView extends StatefulWidget {
  const LoginView ({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController userC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  final AuthController auth = AuthController();

  Future<void> prosesLogin() async {
    final user = await auth.login(userC.text.trim() , passC.text.trim());
    if (!mounted) return;

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardView(user: user)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username atau password salah!'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Icon(Icons.store, size: 90, color: Colors.blue),
              const SizedBox(height: 8,),
              const Text ('Login Toko',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              const SizedBox(height: 24),
              TextField(
                controller: userC,
                decoration: const InputDecoration(
                  labelText: 'Username', border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 12,),
               TextField(
                controller: passC,
                decoration: const InputDecoration(
                  labelText: 'Password', border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: prosesLogin,
                  child: const Text('MASUK'),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}