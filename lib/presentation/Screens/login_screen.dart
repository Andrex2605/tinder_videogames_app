import "package:flutter/material.dart";


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Fondo(),
          Contenido()],
      )
    );
  }
}

class Contenido extends StatefulWidget {
  const Contenido({super.key});

  @override
  State<Contenido> createState() => _ContenidoState();
}

class _ContenidoState extends State<Contenido> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              letterSpacing: 1.5
            ),
          ),
          SizedBox(height: 5),
          Datos(),
        ],
      ),
    );
  }
}

class Datos extends StatefulWidget {
  const Datos({super.key});

  @override
  State<Datos> createState() => _DatosState();
}

class _DatosState extends State<Datos> {
  bool obs=true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Email', 
            style: TextStyle(
              color:Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'email@email.com'
              ),
            ),
          const SizedBox(height: 5),
          const Text(
            'Password',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            obscureText: obs,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Password here',
              suffixIcon: IconButton(
                onPressed: (){
                  setState(() {
                    obs==true ? obs = true : obs = false;
                  });
                }, 
                icon: const Icon(Icons.remove_red_eye_outlined)
              )
            ),
          ),
          const Remember(),
          const SizedBox(height: 30,),
          const Buttons()
        ],
      ),
    );
  }
}

class Remember extends StatefulWidget {
  const Remember({super.key});

  @override
  State<Remember> createState() => _RememberState();
}

class _RememberState extends State<Remember> {
  bool valor = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value:valor,
          onChanged: (valor){
            setState(() {
              valor == false ? valor = true : valor =false;
            });
          },
        ),
        const Text('Remember me'),
        const Spacer(flex: 1),
        Expanded(
          child: TextButton(onPressed: (){}, 
          child: const Text('Forgot password?')),
        )
      ],);
  }
}

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/initial');
            },
            style: ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff142047))), 
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ),
        ),
        const SizedBox(height: 25,width: double.infinity,),
        const Text(
          'or',
          style: TextStyle(
            color:Colors.grey
          ),
        ),
        const SizedBox(height: 25,width: double.infinity,),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: (){
              Navigator.popAndPushNamed(context,'/register');
            }, 
            child: const Text(
              'Sing up',
              style: TextStyle(
                color: Color(0xff142047),
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
              )
            ),
        ),
        
      ],
    );
  }
}

class Fondo extends StatelessWidget {
  const Fondo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:[
            Colors.purpleAccent,
            Colors.purple.shade300
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft
        ),
      ),
    );
  }
}
