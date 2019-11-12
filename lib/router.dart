import 'package:flutter/material.dart';
import 'package:ui_challenge/animations/animation_curves_page.dart';
import 'package:ui_challenge/animations/animation_tween_page.dart';
import 'package:ui_challenge/animations/standard_hero_page.dart';
import 'package:ui_challenge/animations/opacity_page.dart';
import 'package:ui_challenge/layout/expanded_sizedbox_page.dart';
import 'package:ui_challenge/layout/grid_page.dart';
import 'package:ui_challenge/layout/row_column_page.dart';
import 'package:ui_challenge/layout/stack_page.dart';
import 'package:ui_challenge/layout/wrap_page.dart';
import 'package:ui_challenge/widgets/card_page.dart';
import 'package:ui_challenge/widgets/dialog_page.dart';
import 'package:ui_challenge/widgets/image_page.dart';
import 'package:ui_challenge/widgets/input_page.dart';
import 'package:ui_challenge/widgets/snackbar_page.dart';
import 'package:ui_challenge/widgets/text_page.dart';

import 'animations/animated_builder_page.dart';
import 'animations/animated_widget_page.dart';
import 'animations/radial_hero_page.dart';
import 'layout/container_page.dart';
import 'widgets/button_page.dart';

class Router{
  static const homePage = 'app://';
  static const textPage = 'app://TextPage';
  static const buttonPage = 'app://ButtonPage';
  static const imageIconPage = 'app://ImageIconPage';
  static const inputPage = 'app://InputPage';
  static const snackBar = 'app://SnackBar';
  static const dialogPage = 'app://DialogPage';
  static const cardPage = 'app://CardPage';
  static const listViewPage = 'app://ListViewPage';

  static const containerPage = "Container";
  static const expandedPage = "Expanded & Sizedbox";
  static const rowPage = "Row & Column";
  static const stackPage = "Stack";
  static const wrapPage = "Wrap";
  static const gridPage = "Grid";

  static const animationTween = "Animation & Tween";
  static const animatedWidget = "AnimatedWidget";
  static const animatedBuilder = "AnimatedBuilder";
  static const curvedAnimation = "CurvedAnimation";
  static const opacity = "Opacity";
  static const hero = "Hero";
  static const radialExpansion = "RadialExpansion";
  static const staggered = "Staggered";
  static const animatedContainer = "AnimatedContainer";

  Widget _getPage(String url, dynamic params) {
    if (url.startsWith('https://') || url.startsWith('http://')) {
//      return WebViewPage(url, params: params);
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
        case cardPage:
          return CardPage();
        case listViewPage:
          return ImagePage();
        case containerPage:
          return ContainerPage();
        case expandedPage:
          return ExpandedPage();
        case rowPage:
          return RowPage();
        case stackPage:
          return StackPage();
        case wrapPage:
          return WrapPage();
        case gridPage:
          return GridPage();
        case animationTween:
          return AnimationTweenPage();
        case animatedWidget:
          return AnimatedWidgetPage();
        case animatedBuilder:
          return AnimatedBuilderPage();
        case curvedAnimation:
          return AnimatedCurvesPage();
        case opacity:
          return OpacityPage();
        case hero:
          return HeroPage();
        case radialExpansion:
          return RadialExpansionDemo();
        case staggered:
          return GridPage();
        case animatedContainer:
          return GridPage();
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