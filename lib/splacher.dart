// ignore_for_file: must_be_immutable

library splacher;

import 'package:flutter/material.dart';

class Splacher extends StatefulWidget {
  final List<Widget> pages;
  Color backgroundColor, activeColor, inActiveColor;
  final VoidCallback onIntroCompleted;
  Alignment buttonDirection;
  String nextTitle, skipTitle, doneTitle;

  Splacher({
    super.key,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inActiveColor = Colors.blueGrey,
    this.buttonDirection = Alignment.bottomCenter,
    this.doneTitle = "Done",
    this.nextTitle = "Next",
    this.skipTitle = "Skip",
    required this.pages,
    required this.onIntroCompleted,
  });

  @override
  State<Splacher> createState() => _SplacherState();
}

class _SplacherState extends State<Splacher> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: _currentPage,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        NotificationListener<ScrollEndNotification>(
          onNotification: (x) {
            setState(() {
              _currentPage = _pageController.page!.round();
            });
            return false;
          },
          child: Scaffold(
            backgroundColor: widget.backgroundColor,
            body: PageView(
              controller: _pageController,
              children: widget.pages,
            ),
          ),
        ),
        Align(
          alignment: widget.buttonDirection,
          child: _buildBottomButtons(),
        ),
      ],
    );
  }

  bool get _isFinalPage => _currentPage == widget.pages.length - 1;

  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Opacity(
            opacity: _isFinalPage ? 0.0 : 1.0,
            child: _buildButton(widget.skipTitle, _gotoLastPage),
          ),
          _buildNavIndicator(),
          _isFinalPage
              ? _buildButton(widget.doneTitle, widget.onIntroCompleted)
              : _buildButton(widget.nextTitle, _gotoNextPage),
        ],
      ),
    );
  }

  Widget _buildButton(String title, VoidCallback callback) {
    // ignore: deprecated_member_use
    return ElevatedButton(
      onPressed: callback,
      child: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  void _gotoLastPage() {
    _pageController.animateToPage(
      widget.pages.length - 1,
      duration: const Duration(milliseconds: 600),
      curve: Curves.ease,
    );
  }

  void _gotoNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildNavIndicator() {
    final indicatorList = <Widget>[];
    for (int i = 0; i < widget.pages.length; i++) {
      indicatorList.add(_buildIndicator(i == _currentPage));
    }
    return Row(children: indicatorList);
  }

  Widget _buildIndicator(bool isActive) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? widget.activeColor : widget.inActiveColor,
        ),
        child: const SizedBox(width: 8, height: 8),
      ),
    );
  }
}
