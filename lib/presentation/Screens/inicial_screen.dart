import 'package:flutter/material.dart';


class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _InitialView()
    );
  }
}


class _InitialView extends StatefulWidget {
  const _InitialView();

  @override
  State<_InitialView> createState() => __InitialViewState();
}

class __InitialViewState extends State<_InitialView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}