import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/DataProvider.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/adevertisement_all_base_reponse.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Screen();
  }
}

class Screen extends State<Home> implements ProgressDialogCodeListener{

  bool isShowing = false;
  late AdevertisementAllBaseReponse baseResponse;
  late List<Result> allAdvertisementList = [];

  @override
  void initState() {
    DataProvider().getAllAdvertisement(context, this);
  }

  @override
  Widget build(BuildContext context) {


    return ModalProgressHUD(inAsyncCall: isShowing, child: Padding(padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          CarouselSlider.builder(
              options: CarouselOptions(
                height: 150,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              itemCount: allAdvertisementList.length,
              itemBuilder: (BuildContext context, int itemIndex,
                  int pageViewIndex) =>
                  Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.amber
                      ),
                      child: allAdvertisementList.length > 0 ? Image.network(Factory().get_image_url(allAdvertisementList[itemIndex].image!),fit: BoxFit.fill,) : Image.asset(ConstantManager.generator_img)
                  )
          )
        ],
      ),));
  }

  @override
  void onDismiss(String? error) {
    if(isShowing)
      setState(() {
        isShowing = false;
      });
  }

  @override
  void onHide(int code, String? message, Object data) {
    if(isShowing)
      setState(() {
        isShowing = false;
      });

    if(code == ConstantManager.ALL_AD_SUCCESS){
      baseResponse = data as AdevertisementAllBaseReponse;
      if(baseResponse.result!.length>0){

          allAdvertisementList.clear();
          allAdvertisementList.addAll(baseResponse.result!);
      }
    }else if(code == ConstantManager.ALL_AD_UNSUCCESS)
      {
        Factory().showSnackbar(context, message!);
      }

  }

  @override
  void onShow() {
    if(!isShowing)
      setState(() {
        isShowing = true;
      });
  }
}
