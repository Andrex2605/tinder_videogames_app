import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinder_videogames_app/presentation/provider/game_provider.dart';
import 'package:tinder_videogames_app/presentation/widgets/game_vertical_listview.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: InitialView());
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
    return CustomScrollView(slivers: [
      SliverList(delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
    
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            GameVerticalListView(
              games: gameGames,
              loadNextPage: () => ref.read(gameProvider.notifier).loadNextGame(),
            ),
          ],
        );
      }))
    ]);
  }
}
