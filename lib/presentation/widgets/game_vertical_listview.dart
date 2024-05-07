import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tinder_videogames_app/infrastructure/game.dart';

class GameVerticalListView extends StatefulWidget {
  final List<Game> games;
  final VoidCallback? loadNextPage;

  const GameVerticalListView({
    super.key,
    required this.games,
    this.loadNextPage,
  });

  @override
  State<GameVerticalListView> createState() => _GameVerticalListViewState();
}

class _GameVerticalListViewState extends State<GameVerticalListView> {

  @override
  void initState() {
    super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.games.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {


                  return FadeInUp(
                    child: _Slide(game: widget.games[index], isSelected: true,)
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Game game;
  final bool isSelected;

  const _Slide({
    required this.game,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                game.backgroundImage,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  }
                  return FadeIn(child: child);
                },
              ),
            ),
          ),

          const SizedBox(height: 8),

          SizedBox(width: 200, child: Text(game.name, maxLines: 2, style: textStyle.titleSmall)),

          SizedBox(
            width: 200,
            child: Row(
              children: [
                const SizedBox(width: 3),
                Expanded(
                  child: Text(
                    game.genres.toString(),
                    maxLines: 2,
                    style: textStyle.bodyMedium?.copyWith(color: Colors.blue.shade900),
                  ),
                ),
                const Spacer(),
                Checkbox(
                  value: isSelected,
                  onChanged: (value) {
                    
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
