import 'package:flutter/cupertino.dart';
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
  static const String no_preview = "assets/images/no_preview.jpg";

  static const String slogan =
      "Explore million's of Energy & Power Equipment's";
  static const String base_url =
      'http://203.170.74.138:83/api/';
  static const String image_base_url = "http://203.170.74.138:83/";
  static const String no_image_url = "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg";
  static var maskCnicFormatter = MaskTextInputFormatter(
      mask: '#####-#######-#', filter: {"#": RegExp(r'[0-9]')});
  static String USER_MODEL = "USER_MODEL";
  //
  static bool isShowing = false;
  //lists here
  static const applications_list = ["Leisure","Domestic","Construction/Site","Stand Generator","Prime Power"];
  static const frequncy_list = ["Daily","Weekly","Monthly","Continuously"];
  static const hours_list = ["Upto to 2 hours on each run","2-5 hours on each run","5+ hours on each run"];
  static const fuel_type_list = ["Petrol","Diesel","LPG","Natural Gas"];
  static const starting_method_list = ["Recoil Start","Local Ket Start","Remote Start","Automatic"];
  static const sound_level_list = ["Standard Open Frame","Canopied/Silenced","Super Silenced"];
  static const voltage_list = ["110V 50Hz Single Phase","230V 50Hz Single Phase","110V/230V 50Hz Single Phase","400V 50Hz Three Phase","230V/400V 50Hz Multi Phase"];
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
  static int ALL_ITEM_SUCCESS = 111;
  static int ALL_ITEM_UNSUCCESS = 112;
  static int IMAGE_SUCCESS = 113;
  static int IMAGE_UNSUCCESS = 114;
  static int IMAGE_LIST_SUCCESS = 115;
  static int IMAGE_LIST_UNSUCCESS = 116;
  static int SALE_TYPE_SUCCESS = 117;
  static int SALE_TYPE_UNSUCCESS = 118;
  static int SUB_CAT_SUCCESS = 119;
  static int SUB_CAT_UNSUCCESS = 120;
  static int BRAND_ALL_SUCCESS = 121;
  static int BRAND_ALL_UNSUCCESS = 122;
  static int UNIT_SUCCESS = 123;
  static int UNIT_UNSUCCESS = 123;
  static int ADD_ITEM_SUCCESS = 124;
  static int ADD_ITEM_UNSUCCESS = 124;
  static int RATING_SUCCESS = 125;
  static int RATING_UNSUCCESS = 125;
  static int APPLIANCES_SUCCESS = 126;
  static int APPLIANCES_UNSUCCESS = 127;
  static int ENQUIRY_SUCCESS = 128;
  static int ENQUIRY_UNSUCCESS = 128;
  static int PROFILE_SUCCESS = 129;
  static int PROFILE_UNSUCCESS = 129;









}
