import 'package:flutter/material.dart';

class DetailButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final Widget icon;
  final bool isOutlined;
  const DetailButton({
    Key? key,
    required this.onPressed,
    this.isOutlined = false,
    required this.child,
    required this.icon,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.gradient = const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(20);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: isOutlined ? null : gradient,
        borderRadius: borderRadius,
      ),
      child: isOutlined
          ? OutlinedButton.icon(
              onPressed: onPressed,
              icon: icon,
              label: child,
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius,
                ),
                side: const BorderSide(
                  width: 2,
                  color: Colors.white,
                ),
              ),
            )
          : ElevatedButton.icon(
              icon: icon,
              onPressed: onPressed,
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: borderRadius)),
              ),
              label: child,
            ),
    );
  }
}
