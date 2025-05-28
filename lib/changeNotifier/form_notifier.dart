import 'package:flutter/cupertino.dart';

class FormNotifier with ChangeNotifier {
  // The controller that is Register ⇆ SignIn (Left to Rigth)
  final PageController _controller1 = new PageController(initialPage: 0);
  // The controller that is RegisterPart1 and Register part2 ⇵ (Top to Bottom)
  final PageController _controller2 = new PageController(initialPage: 0);

  PageController get getFormPageController2 => _controller2;
  PageController get getFormPageController1 => _controller1;

  void changeToRegisterPart2() {
    _controller2.animateToPage(1,
        duration: Duration(milliseconds: 950), curve: Curves.easeIn);
    notifyListeners();
  }

  void changeToSignInPagePageView() {
    _controller1.animateToPage(2,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    notifyListeners();
  }

  Future<PageController> changeToRegisterPart1() async {
    return _controller2;
    // notifyListeners();
  }
}
