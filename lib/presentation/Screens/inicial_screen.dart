import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinder_videogames_app/presentation/provider/game_provider.dart';
import 'package:tinder_videogames_app/presentation/widgets/game_vertical_listview.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: InitialView());
  }
}

class InitialView extends ConsumerStatefulWidget {
  const InitialView({super.key});

  @override
  InitialViewState createState() => InitialViewState();
}

class InitialViewState extends ConsumerState<InitialView> {
  @override
  void initState() {
    super.initState();
    ref.read(gameProvider.notifier).loadNextGame();
  }

  @override
  Widget build(BuildContext context) {
    final gameGames = ref.watch(gameProvider);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            SizedBox(width: 150,height: 150,child: Image.asset('assets/images/Logo.jpg')),
            const SizedBox(height: 30),
            const Text('Porfavor, elige al menos 3 juegos, esto nos ayudara a darte una mejor experiencia'),
            const SizedBox(height: 50,),
            GameVerticalListView(games: gameGames,
            loadNextPage: () => ref.read(gameProvider.notifier).loadNextGame()),
            const SizedBox(height: 50),
             SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: (){
              
            },
            style: ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff142047))), 
            child: const Text(
              'Listo',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ),
        ),
            const SizedBox(height: 60)
          ],
        ),
      ),
    );
  }
}
