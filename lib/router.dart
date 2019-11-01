import 'package:flutter/material.dart';
import 'package:ui_challenge/widgets/dialog_page.dart';
import 'package:ui_challenge/widgets/image_page.dart';
import 'package:ui_challenge/widgets/input_page.dart';
import 'package:ui_challenge/widgets/snackbar_page.dart';
import 'package:ui_challenge/widgets/text_page.dart';
import 'package:ui_challenge/webview_page.dart';

import 'widgets/button_page.dart';

class Router{
  static const homePage = 'app://';
  static const textPage = 'app://TextPage';
  static const buttonPage = 'app://ButtonPage';
  static const imageIconPage = 'app://ImageIconPage';
  static const inputPage = 'app://InputPage';
  static const snackBar = 'app://SnackBar';
  static const dialogPage = 'app://DialogPage';
  static const listViewPage = 'app://ListViewPage';

  Widget _getPage(String url, dynamic params) {
    if (url.startsWith('https://') || url.startsWith('http://')) {
      return WebViewPage(url, params: params);
    } else {
      switch (url) {
        case textPage:
          return TextPage();
        case buttonPage:
          return ButtonPage();
        case imageIconPage:
          return ImagePage();
        case inputPage:
          return InputPage();
        case snackBar:
          return SnackBarPage();
        case dialogPage:
          return DialogPage();
        case listViewPage:
          return ImagePage();
      }
    }
    return null;
  }

  Router.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null);
    }));
  }

  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }
}