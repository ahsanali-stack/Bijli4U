import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/DataProvider.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/advertisement_all_base_response.dart'
    as AD;
import 'package:testproject/Models/Response/category_all_base_reponse.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Screen();
  }
}

class Screen extends State<Home> implements ProgressDialogCodeListener {
  bool isShowing = false;
  late AD.AdvertisementAllBaseResponse baseResponse;
  List<AD.Result> allAdvertisementList = [];
  late CategoryAllBaseReponse categoryBaseRespose;
  List<Result> categoryList = [];
  int mIndex = 0;

  @override
  void initState() {
    DataProvider().getAllAdvertisement(context, this);
    DataProvider().getCategoryAll(context, this);
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: isShowing,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Container(
              decoration: BoxDecoration(color: Color(colors.color_primary)),
              width: Factory().getWidthOfScreen(context),
              height: Factory().getHeightOfScreen(context) / 11,
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CarouselSlider.builder(
                        options: CarouselOptions(
                          height: 120,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                        itemCount: allAdvertisementList.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(color: Colors.amber),
                                child: allAdvertisementList.length > 0
                                    ? Image.network(
                                        Factory().get_image_url(
                                            allAdvertisementList[itemIndex]
                                                .image!),
                                        fit: BoxFit.fill,
                                      )
                                    : Image.asset(
                                        ConstantManager.generator_img))),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: ToggleSwitch(
                        borderWidth: 1.5,
                        borderColor: [
                          Color(colors.color_primary),
                          Color(colors.color_primary)
                        ],
                        dividerColor: Color(colors.color_primary),
                        minWidth: 100.0,
                        cornerRadius: 6.0,
                        activeBgColors: [
                          [Color(colors.color_slogan)],
                          [Color(colors.color_slogan)]
                        ],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.white,
                        inactiveFgColor: Color(colors.color_primary),
                        initialLabelIndex: 1,
                        totalSwitches: 2,
                        labels: ['Rent', 'Buy'],
                        radiusStyle: true,
                        onToggle: (index) {
                          print('switched to: $index');
                        },
                      ),
                    ),
                    Flexible(
                        child: SizedBox(
                      height: 50,
                      child: Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 10),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categoryList.length,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              itemBuilder: (BuildContext contextg, int index) {
                                return Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: GestureDetector(
                                      onTap: () => setState(() {
                                        mIndex = index;
                                      }),
                                      child: Text(
                                        categoryList.length > 0
                                            ? categoryList[index].category!
                                            : "Unnown",
                                        style: TextStyle(
                                          fontFamily: 'Trebuc',
                                          fontWeight: FontWeight.bold,
                                          decoration: mIndex == index
                                              ? TextDecoration.underline
                                              : null,
                                          fontSize: 16,
                                          color: mIndex == index
                                              ? Color(colors.color_primary)
                                              : Colors.black26,
                                        ),
                                      ),
                                    ));
                              })),
                    )),
                    Flexible(
                       child: GridView.builder(
                            primary: false,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            // physics:NeverScrollableScrollPhysics(),
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 250
                            ),
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                child: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Image.asset(ConstantManager.generator_img,
                                            height: 150),
                                        Text(
                                          "Hondaa Electric Start 2.5 KW Generator (EZ65000CXS)",
                                          style: TextStyle(
                                              color: Color(colors.color_primary)),
                                        )
                                      ],
                                    ),
                                ),
                              );
                            })
                    )
                  ],
                )),
          ],
        ));
  }

  @override
  void onDismiss(String? error) {
    if (isShowing)
      setState(() {
        isShowing = false;
      });
  }

  @override
  void onHide(int code, String? message, Object data) {
    if (isShowing)
      setState(() {
        isShowing = false;
      });

    if (code == ConstantManager.ALL_AD_SUCCESS) {
      baseResponse = data as AD.AdvertisementAllBaseResponse;
      if (baseResponse.result!.length > 0) {
        allAdvertisementList.clear();
        allAdvertisementList.addAll(baseResponse.result!);
      }
    } else if (code == ConstantManager.ALL_AD_UNSUCCESS) {
      Factory().showSnackbar(context, message!);
    } else if (code == ConstantManager.ALl_CATEGORY_SUCCESS) {
      categoryBaseRespose = data as CategoryAllBaseReponse;
      if (categoryBaseRespose.result!.length > 0) {
        categoryList = [];
        categoryList.addAll(categoryBaseRespose.result!);
      }
    } else if (code == ConstantManager.ALl_CATEGORY_UNSUCCESS) {
      Factory().showSnackbar(context, message!);
    }
  }

  @override
  void onShow() {
    if (!isShowing)
      setState(() {
        isShowing = true;
      });
  }
}
