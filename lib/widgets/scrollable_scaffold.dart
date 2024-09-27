import 'package:flutter/material.dart';

class ScrollableScaffold extends StatelessWidget {
  const ScrollableScaffold({
    super.key,
    required this.appBar,
    required this.children,
    this.floatingActionButton,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
  });

  final PreferredSizeWidget appBar;
  final List<Widget> children;

  final Widget? floatingActionButton;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: _getScreenHeight(context),
            ),
            child: Column(
              crossAxisAlignment: _crossAxisAlignment,
              mainAxisAlignment: _mainAxisAlignment,
              children: children,
            ),
          ),
        ),
      ),
    );
  }

  // Ensures full screen height.
  double _getScreenHeight(final BuildContext context) {
    return MediaQuery.of(context).size.height - kToolbarHeight;
  }

  CrossAxisAlignment get _crossAxisAlignment {
    return crossAxisAlignment ?? CrossAxisAlignment.center;
  }

  MainAxisAlignment get _mainAxisAlignment {
    return mainAxisAlignment ?? MainAxisAlignment.start;
  }
}
