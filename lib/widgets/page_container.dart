import 'package:flutter/material.dart';
import '../core/theme/design_token.dart';

class PageContainer extends StatelessWidget {
  final Widget child;

  const PageContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: DT.maxWidth),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: DT.hPadding),
          child: child,
        ),
      ),
    );
  }
}
