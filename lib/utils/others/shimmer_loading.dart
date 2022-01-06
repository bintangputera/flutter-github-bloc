import 'package:flutter/material.dart';
import 'package:github_bloc/constant/theme.dart';

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  _ShimmerLoadingState createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return shimmerGradient.createShader(bounds);
      },
      child: widget.child,
    );
  }
}
