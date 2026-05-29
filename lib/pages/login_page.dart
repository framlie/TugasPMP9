import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'beranda_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final usernameController = TextEditingController();
final passwordController = TextEditingController();

Future<void> login() async {
  final username = usernameController.text.trim();
  final password = passwordController.text.trim();
  if(username == '2411500048' && password == '12345'){
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('isLogin', true);
    await pref.setString('username', username);

    if (!mounted) return;

    // pindah beranda

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BerandaPage()),
    );

  }else{
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login Gagal')),
    );
  }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children:[
              const SizedBox(height: 100),

              // TITLE
              const Text(
                'Login Page',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 100),

              SizedBox(
                height: 44,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan usernname',
                    hintStyle: const TextStyle(
                      color: Color(0xAAAAAAAA),
                      fontSize: 16,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14),
                    
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xAAAAAAAA)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF000000)),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

               SizedBox(
                height: 44,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan password',
                    hintStyle: const TextStyle(
                      color: Color(0xAAAAAAAA),
                      fontSize: 16,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14),
                    
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xAAAAAAAA)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF000000)),
                    ),
                  ),
                ),
              ),
            

              const SizedBox(height: 20),

              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                value: true,
                onChanged: (value) {},
                title: const Text('Remember me'),
              ),

              const SizedBox(height: 20),

              // button login
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4444FF),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Login', 
                  style: TextStyle(
                    fontSize: 16, 
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]

          )
        )
        )
    );
  }
}