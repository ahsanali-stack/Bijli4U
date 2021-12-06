import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ConstantManager {
  static final String splashScrnName = "assets/images/grocery-cart.svg";
  static final double widthSplashImg = 200;
  static final double heightSplashImg = 200;
  static final double heightButton = 40;
  static final double widthButton = double.infinity;
  static final double fontSize = 20;
  static final double buttonRadiud = 8;
  static final String emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';


  static final String bijli4UNameImg = "assets/images/bijli4uname.jpg";
  static const String bijli4ULogoGif = "assets/images/bijli4ulogogif.gif";
  static const String arrow_right = "assets/icons/arrow_right.png";
  static const String generator_img = "assets/images/generator.jpg";

  static const String slogan =
      "Explore million's of Energy & Power Equipment's";
  static const String base_url =
      'http://203.170.74.138:83/api/';
  static const String image_base_url = "http://203.170.74.138:83/";
  static const String no_image_url = "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg";
  static var maskCnicFormatter = MaskTextInputFormatter(
      mask: '#####-#######-#', filter: {"#": RegExp(r'[0-9]')});

  //
  static const int SIGN_UP_SUCCESS = 101;
  static const int SIGN_UP_UNSUCCESS = 102;
  static int SIGN_IN_SUCCESS = 103;
  static int SIGN_IN_UNSUCCESS = 104;
  static int ALL_NOTIFICATION_SUCCESS = 105;
  static int ALL_NOTIFICATION_UNSUCCESS = 106;
  static int ALL_AD_SUCCESS = 107;
  static int ALL_AD_UNSUCCESS = 108;
  static int ALl_CATEGORY_SUCCESS = 109;
  static int ALl_CATEGORY_UNSUCCESS = 110;




  static String USER_MODEL = "USER_MODEL";



}
