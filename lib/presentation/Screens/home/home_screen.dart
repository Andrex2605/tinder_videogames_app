import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinder_videogames_app/presentation/provider/card_provider.dart';
import 'package:tinder_videogames_app/presentation/widgets/tinder_card.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});
  
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Videogames recomendations'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: const Column(children: [
              Expanded(child: BuildCards()),
              Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 0)),
              ButtonsBuild()
             ]
            )
          )
        ),       
      ),
    );
  }
   
}

// Assuming you have a CardProvider class with urlImages, resetUsers, getStatus, like, dislike, and ignore methods

final cardProvider = Provider((ref) => CardProvider());

class BuildCards extends ConsumerWidget {
  const BuildCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlImages = ref.watch(cardProvider.select((value) => value.urlImages));

    return urlImages.isEmpty
        ? Center(
            child: ElevatedButton(
              child: const Text('Restart'),
              onPressed: () => ref.read(cardProvider).resetUsers(),
            ),
          )
        : SizedBox.expand(
            // child: Stack(
            //   children: urlImages
            //       .map((urlImage) => TinderCard(urlImage: urlImage, isFront: urlImages.last == urlImage))
            //       .toList(),
            // ),
          );
  }
}

class ButtonsBuild extends ConsumerWidget {
  const ButtonsBuild({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(cardProvider.select((value) => value.getStatus()));
    final isLike = status == CardStatus.like;
    final isDisLike = status == CardStatus.dislike;
    final isIgnore = status == CardStatus.ignore;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            foregroundColor: getColor(Colors.red, Colors.red, isDisLike),
            backgroundColor: getColor(Colors.red, Colors.white, isDisLike),
            side: getBorder(Colors.red, Colors.white, isDisLike),
          ),
          onPressed: () => ref.read(cardProvider).dislike(),
          child: const Icon(Icons.clear, color: Colors.white, size: 50),
        ),
        ElevatedButton(
          style: ButtonStyle(
            foregroundColor: getColor(Colors.blue, Colors.blue, isLike),
            backgroundColor: getColor(Colors.blue, Colors.white, isLike),
            side: getBorder(Colors.blue, Colors.white, isLike),
          ),
          onPressed: () => ref.read(cardProvider).ignore(),
          child: const Icon(Icons.skip_next_outlined, color: Colors.white, size: 50),
        ),
        ElevatedButton(
          style: ButtonStyle(
            foregroundColor: getColor(Colors.green, Colors.green, isIgnore),
            backgroundColor: getColor(Colors.green, Colors.white, isIgnore),
            side: getBorder(Colors.green, Colors.white, isIgnore),
          ),
          onPressed: () => ref.read(cardProvider).like(),
          child: const Icon(Icons.favorite, color: Colors.white, size: 50),
        ),
      ],
    );
  }
}

  MaterialStateProperty<Color> getColor(Color color,Color colorPressed, bool forced){
    getColor(Set<MaterialState> states){
      if (forced || states.contains(MaterialState.pressed)){
        return colorPressed;
      }else{
        return color;
      }
    }

    return MaterialStateProperty.resolveWith(getColor);
  }

  MaterialStateProperty<BorderSide> getBorder(Color color,Color colorPressed, bool forced){
    getBorder(Set<MaterialState> states){
      if (forced || states.contains(MaterialState.pressed)){
        return const BorderSide(color: Colors.transparent);
      }else{
        return BorderSide(color: color,width: 2);
      }
    }

    return MaterialStateProperty.resolveWith(getBorder);
  }



