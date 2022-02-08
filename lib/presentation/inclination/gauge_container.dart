import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class GaugeContainer extends StatelessWidget {
  final Artboard? artboard;

  const GaugeContainer({Key? key, this.artboard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(artboard == null) {
      return const SizedBox();
    }

    final width = MediaQuery.of(context).size.height - 50;

    return SizedBox(
      width: width,
      height: width,
      child: Rive(
        artboard: artboard!
      )
    );
  }

}