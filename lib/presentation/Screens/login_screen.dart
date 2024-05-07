import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tinder_videogames_app/main.dart'; // Importa el paquete Dio

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Dio _dio = Dio(); // Crea una instancia de Dio

  Future<void> _login() async {
    // Obtiene los valores de los campos de texto
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      // Realiza la solicitud POST al backend
      final response = await _dio.post(
        'http://10.12.23.34:3000/users/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      final responseData = response.data;
        userId = responseData['userId']; 
      // Verifica la respuesta del backend
      if (response.statusCode == 201) {
        
        // Éxito: los datos de inicio de sesión son válidos
        // Puedes manejar la respuesta del backend aquí
        print('Inicio de sesión exitoso');
        
        Navigator.pushNamed(context, '/home');
      } else {
        // Error: los datos de inicio de sesión no son válidos
        // Puedes manejar el error aquí
        print('Error al iniciar sesión');
      }
    } catch (e) {
      // Error al realizar la solicitud HTTP
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Fondo(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 5),
                Datos(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  onPressed: _login,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Datos extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onPressed;

  const Datos({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Email',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'email@email.com',
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Password',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Password here',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove_red_eye_outlined),
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xff142047)),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Center(child: Text('or')),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/register');
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 255, 255)),
              ),
              child: const Text(
                'Sing Up',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Fondo extends StatelessWidget {
  const Fondo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purpleAccent,
            Colors.purple.shade300,
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
    );
  }
}
