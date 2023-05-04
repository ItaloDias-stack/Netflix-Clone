import 'package:flutter/material.dart';

class CustomExpandedWithScroll extends StatelessWidget {
  final List<Widget> children;
  const CustomExpandedWithScroll({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: children,
              ),
            ),
          ),
        );
      }),
    );
  }
}
