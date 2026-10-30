import  'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import '../models/user_model.dart';
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

  @override
  void dispose() {
    userC.dispose();
    passC.dispose();
    super.dispose();
  }

  Future<void> prosesLogin() async {
    UserModel? user;
    try {
      user = await auth.login(userC.text.trim() , passC.text.trim());
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memuat data user: $e'))
      );
      return;
    }
    if (!mounted) return;

    if (user != null) {
      final userLogin = user;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardView(user: userLogin)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username atau password salah!'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                obscureText: true,
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