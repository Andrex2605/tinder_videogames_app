// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:tinder_videogames_app/presentation/provider/card_provider.dart';

// // Assuming CardProvider holds state and methods for card interactions

// final cardProvider = Provider((ref) => CardProvider());

// class TinderCard extends ConsumerWidget {
//   final String urlImage;
//   final bool isFront;

//   const TinderCard({
//     super.key,
//     required this.urlImage,
//     required this.isFront,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return SizedBox.expand(
//       child: widget.isFront
//           ? BuildFrontCard(ref: ref, widget: widget)
//           : BuildCard(widget: widget),
//     );
//   }
// }

// class BuildFrontCard extends ConsumerWidget {
//   final TinderCard widget;
//   final WidgetRef ref;

//   const BuildFrontCard({
//     super.key,
//     required this.widget,
//     required this.ref,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final position = ref.watch(cardProvider.select((value) => value.position));
//     final milliseconds = ref.watch(cardProvider.select((value) => value.isDragging ? 0 : 400));
//     final center = ref.watch(cardProvider.select((value) => ref.read(cardProvider).screenSize?.center(Offset.zero)));

//     if (center == null) return Container(); // Handle potential null case

//     final angle = ref.watch(cardProvider.select((value) => value.angle * math.pi / 180));
//     final rotatedMatrix = Matrix4.identity()
//       ..translate(center.dx, center.dy)
//       ..rotateZ(angle)
//       ..translate(-center.dx, -center.dy);

//     return AnimatedContainer(
//       duration: Duration(milliseconds: milliseconds),
//       curve: Curves.easeInOut,
//       transform: rotatedMatrix.translate(position.dx, position.dy),
//       child: Stack(
//         children: [
//           BuildCard(widget: widget),
//           const BuildStamps(),
//         ],
//       ),
//     );
//   }
// }

// class BuildStamps extends ConsumerWidget {
//   const BuildStamps({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final status = ref.watch(cardProvider.select((value) => value.getStatus()));
//     final opacity = ref.watch(cardProvider.select((value) => value.getStatusOacity()));

//     switch (status) {
//       case CardStatus.like:
//         final child = buildStamp(angle: -0.5, color: Colors.green, text: 'Like', opacity: opacity);
//         return Positioned(top: 64, left: 50, child: child);
//       case CardStatus.dislike:
//         final child = buildStamp(angle: 0.5, color: Colors.red, text: 'Dislike', opacity: opacity);
//         return Positioned(top: 64, right: 50, child: child);
//       case CardStatus.ignore:
//         final child = Center(
//           child: buildStamp(angle: 0, color: Colors.blue, text: 'Ignore', opacity: opacity),
//         );
//         return Positioned(bottom: 128, right: 0, left: 0, child: child);
//       default:
//         return Container();
//     }
//   }
// }

// Widget buildStamp({
//   required double angle,
//   required MaterialColor color,
//   required String text,
//   required double opacity,
// }) {
//   return Opacity(
//     opacity: opacity,
//     child: Transform.rotate(
//       angle: angle,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         decoration: BoxDecoration(
//           border: Border.all(color: color, width: 4),
//           borderRadius: BorderRadius.circular(22),
//         ),
//         child: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: color,
//             fontSize: 48,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     ),
//   );
// }


// class BuildCard extends StatelessWidget {
//   const BuildCard({
//     super.key,
//     required this.widget,
//   });

//   final TinderCard widget;

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: Container(
//         decoration: BoxDecoration(
//           image:DecorationImage(
//             image: NetworkImage(widget.urlImage),
//             fit: BoxFit.cover,
//             alignment: Alignment.center
//           ),
//         ),
//         child: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.transparent, Colors.black],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               stops: [0.6,1]
//             )
//           ),
//           padding: const EdgeInsets.all(20),
//           child:  const Column(
//             children: [
//               Spacer(),
//               // BuildName(widget: widget),
//               SizedBox(height: 8),
//             ],),
//         ),
//       ),
//     );
//   }

// }



// // class BuildName extends StatelessWidget {
// //   const BuildName({
// //     super.key,
// //     required this.widget,
// //   });

// //   final TinderCard widget;

// //   @override
// //   Widget build(BuildContext context) {
// //     return  Row(
// //       children: [
// //         Text(widget.name,style: const TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),),
// //         const SizedBox(width: 10),
// //         Text(widget.gender,style: const TextStyle(fontSize: 26,color: Colors.white),)
// //       ],);
// //   }
// // }


