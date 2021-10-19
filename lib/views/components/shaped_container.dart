import 'package:flutter/material.dart';

class ShapedContainer extends StatelessWidget {
  ShapedContainer({
    this.child,
    Key? key,
  }) : super(key: key);
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      child: child,
    );
  }
}
