import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:mesh_gradient/src/mesh_gradient_painter.dart';
import 'package:mesh_gradient/src/mesh_gradient_point.dart';

class MeshGradient extends StatefulWidget {
  const MeshGradient({
    super.key,
    required this.points,
    this.child,
  });

  final List<MeshGradientPoint> points;
  final Widget? child;

  @override
  State<MeshGradient> createState() => _MeshGradientState();
}

class _MeshGradientState extends State<MeshGradient> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      assetKey: 'packages/mesh_gradient/shaders/point_mesh_gradient.frag',
      (context, shader, child) {
        return CustomPaint(
          painter: MeshGradientPainter(
            shader: shader,
            points: widget.points,
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
