import 'dart:ui';import 'package:flutter/material.dart';import '../../../../defaults.dart' as defaults;class GlassMorphism extends StatelessWidget {  final Widget child;  final double blur = 10;  final double opacity = 0.2;  final Color? color;  final List<Color>? gradientColors;  final BorderRadius? borderRadius = BorderRadius.circular(42);  GlassMorphism({    super.key,    required this.child,    this.color,    List<Color>? gradientColors,  }) : gradientColors = gradientColors ?? defaults.gradientColor;  @override  Widget build(BuildContext context) {    return Padding(      padding: const EdgeInsets.all(defaults.standardPadding),      child: ClipRRect(        child: BackdropFilter(          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),          child: Container(            decoration: _useBoxDecoration(),            child: Padding(padding: const EdgeInsets.all(defaults.mediumPadding), child: child),          ),        ),      ),    );  }  BoxDecoration _useBoxDecoration() {    if (color != null) {      return BoxDecoration(        color: color!.withOpacity(opacity),        borderRadius: borderRadius,      );    } else {      return BoxDecoration(        gradient: LinearGradient(          begin: Alignment.topLeft,          end: Alignment.bottomRight,          colors: gradientColors!,        ),        color: Colors.transparent.withOpacity(opacity),        borderRadius: borderRadius,      );    }  }}