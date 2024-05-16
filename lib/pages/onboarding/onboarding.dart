import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:greenvilllage/global/constants/functions.dart';
import 'package:greenvilllage/global/widgets/page_view.dart';
import 'package:greenvilllage/global/widgets/text_with_button_and_indicator/text_with_button_and_indicator.dart';
import 'package:greenvilllage/pages/tabs/tabs.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    super.key,
  });

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late final PageController _controller = PageController();

  int _currentIndex = 0;
  Color _currentColor = Colors.red;

  @override
  void initState() {
    _controller.addListener(_onUpdatedIndex);
    super.initState();
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onUpdatedIndex)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(context.height * 0.2),
            Expanded(
              flex: 2,
              child: PageViewBuilder(
                currentColor: _currentColor,
                controller: _controller,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: TextWithButtonAndIndicator(
                currentIndex: _currentIndex,
                currentColor: _currentColor,
                controller: _controller,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  void _onUpdatedIndex() {
    final currentIndex = _controller.page?.round() ?? 0;

    if (currentIndex != _currentIndex) {
      _currentIndex = currentIndex;
      _currentColor = getColorFromIndex(currentIndex);
      setState(() {});
    }
  }
}
