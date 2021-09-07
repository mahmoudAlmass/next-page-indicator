import 'package:flutter/material.dart';
import 'package:flutter_challenge_ripple/next_page_button.dart';
import 'dart:math';

import 'package:flutter_challenge_ripple/onboarding_page_indicator.dart';
class PageIndIcator extends StatefulWidget {

  @override
  _PageIndIcatorState createState() => _PageIndIcatorState();
}

class _PageIndIcatorState extends State<PageIndIcator> with TickerProviderStateMixin{
  late Animation<double> _pageIndicatorAnimation;
  late final AnimationController _pageIndicatorAnimationController;
    int _currentPage = 1;
    IconData icon=Icons.add;

  @override
  void initState() {
    super.initState();

      _pageIndicatorAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _setPageIndicatorAnimation();
  }

  @override
  void dispose() {
    _pageIndicatorAnimationController.dispose();
    super.dispose();
  }
  void _setPageIndicatorAnimation({bool isClockwiseAnimation = true}) {
    final multiplicator = isClockwiseAnimation ? 2 : -2;

    setState(() {
      _pageIndicatorAnimation = Tween(
        begin: 0.0,
        end: multiplicator * pi,
      ).animate(
        CurvedAnimation(
          parent: _pageIndicatorAnimationController,
          curve: Curves.easeIn,
        ),
      );
      _pageIndicatorAnimationController.reset();
    });
  }
  void _setNextPage(int nextPageNumber) {
    setState(() {
      _currentPage = nextPageNumber;
    });
  }
  void callback(){

  }

    Future<void> _nextPage() async {
    switch (_currentPage) {
      case 1:
        if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
          _pageIndicatorAnimationController.forward();
          _setNextPage(2);
          _setPageIndicatorAnimation(isClockwiseAnimation: false);
        }
        break;
      case 2:
        if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
          _pageIndicatorAnimationController.forward();
          _setNextPage(3);
          setState(() {
            icon =Icons.done;
          });
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page indicator'),
        ),
        body: Stack(
          
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                    AnimatedBuilder(
                    animation: _pageIndicatorAnimation,
                    builder: (_, Widget? child) {
                      return OnboardingPageIndicator(
                        angle: _pageIndicatorAnimation.value,
                        currentPage: _currentPage,
                        child: child!,
                      );
                    },
                    child: NextPageButton(onPressed: _nextPage,icon:icon),
                  ),
                  ],),
                ),
              ),
            )
          ],
        ),
    );
  }
}