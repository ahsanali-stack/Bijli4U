import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/DataProvider/DataProvider.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/advertisement_all_base_response.dart'
    as AD;
import 'package:testproject/Models/Response/all_item_base_response.dart' as ALL_ITEM;
import 'package:testproject/Models/Response/category_all_base_reponse.dart'
    as CAT;
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'Bloc/HomeBloc.dart';

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
  late CAT.CategoryAllBaseReponse categoryBaseRespose;
  List<CAT.Result> categoryList = [];
  int mIndex = 0;
  late ALL_ITEM.AllItemBaseResponse allItemBaseResponse_;
  List<ALL_ITEM.Result> allItemsList = [];
  int item_sale_type_id = 2; // Default sale type is "Rent" which id = 2
  int category_id = 0;
  int labelIndex = 0;
  late HomeBloc bloc = HomeBloc(context);

  @override
  void initState() {
    bloc = HomeBloc(context);
    bloc.mIndex.sink.add(0);
    bloc.toggleIndex.sink.add(0);
    bloc.getAllAdvertisement();
    bloc.getAllCategory();
    bloc.getAllItems(item_sale_type_id);
    // DataProvider().getAllAdvertisement(context, this);
    // DataProvider().getCategoryAll(context, this);
    // DataProvider().getAllItems(context, this, item_sale_type_id);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: bloc.showingStream,
      builder: (BuildContext context, AsyncSnapshot<bool> isShowing) {
      return ModalProgressHUD(
          inAsyncCall: isShowing.hasData ? isShowing.data! : false,
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
                      StreamBuilder(stream: bloc.advertisementList.stream, builder: (BuildContext context, AsyncSnapshot<List<AD.Result>> ad_list) {
                        return CarouselSlider.builder(
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
                            itemCount: ad_list.hasData ? ad_list.data!.length : 0,
                            itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration:
                                    BoxDecoration(color: Colors.transparent),
                                    child: ad_list.hasData && ad_list.data!.length > 0
                                        ? Image.network(
                                      Factory().get_image_url(
                                          ad_list.data![itemIndex]
                                              .image!),
                                      fit: BoxFit.fill,
                                    )
                                        : Image.asset(ConstantManager.no_preview)));
                      },),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: StreamBuilder(
                          stream: bloc.toggleIndex.stream,
                          builder: (BuildContext context, AsyncSnapshot<int> labeIndex) {
                            return ToggleSwitch(
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
                              initialLabelIndex: labeIndex.data,
                              totalSwitches: 2,
                              labels: ['Rent', 'Buy'],
                              radiusStyle: true,
                              onToggle: (index) {
                                bloc.toggleIndex.sink.add(index);
                                if (index == 0) {
                                  item_sale_type_id = 2; // Rent id = 2
                                  bloc.getItemByCategory(item_sale_type_id, category_id);
                                  // DataProvider().getAllItemsByCategory(context, this, item_sale_type_id, category_id);
                                } else if (index == 1) {
                                  item_sale_type_id = 1; // Buy id = 1
                                  bloc.getItemByCategory(item_sale_type_id, category_id);
                                  // DataProvider().getAllItemsByCategory(context, this, item_sale_type_id, category_id);
                                }
                              },
                            );
                          },
                        ),
                      ),
                      Flexible(
                          child: SizedBox(
                            height: 50,
                            child: Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 10),
                                child: StreamBuilder(stream: bloc.categoryList.stream,
                                  builder: (BuildContext context, AsyncSnapshot<List<CAT.Result>> catList) {
                                  return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: catList.hasData ? catList.data!.length : 0,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      itemBuilder: (BuildContext context, int index) {
                                        return Padding(
                                            padding:
                                            EdgeInsets.only(left: 10, right: 10),
                                            child: StreamBuilder(stream: bloc.mIndex.stream, builder: (BuildContext context, AsyncSnapshot<int> mIndex) {
                                              return GestureDetector(
                                                onTap: (){
                                                  bloc.mIndex.sink.add(index) ;
                                                  category_id = catList.data![index].categoryID!;
                                                  bloc.getItemByCategory(item_sale_type_id,category_id);
                                                  // DataProvider().getAllItemsByCategory(context, this, item_sale_type_id, category_id);
                                                },
                                                child: Text(
                                                  catList.data!.length > 0
                                                      ? catList.data![index].category!
                                                      : "Unknown",
                                                  style: TextStyle(
                                                    fontFamily: 'Trebuc',
                                                    fontWeight: FontWeight.bold,
                                                    decoration: mIndex.data == index
                                                        ? TextDecoration.underline
                                                        : null,
                                                    fontSize: 16,
                                                    color: mIndex.data == index
                                                        ? Color(colors.color_primary)
                                                        : Colors.black26,
                                                  ),
                                                ),
                                              );
                                            },
                                            ));
                                      });
                                },)),
                          )),
                      Container(
                        height: 370,
                        child: StreamBuilder(
                          stream: bloc.itemsList.stream, builder: (BuildContext context, AsyncSnapshot<List<ALL_ITEM.Result>> itemList) {
                            return GridView.builder(
                                primary: false,
                                padding: EdgeInsets.only(left: 10, right: 10),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                // physics:NeverScrollableScrollPhysics(),
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, mainAxisExtent: 270),
                                itemCount: itemList.hasData ? itemList.data!.length : 0,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: EdgeInsets.all(6),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          itemList.data!.length > 0
                                              ? Image.network(
                                            Factory().get_image_url(
                                                itemList.data![index].imageUrl!),
                                            fit: BoxFit.fill,
                                            height: 150,
                                          )
                                              : Image.asset(
                                              ConstantManager.no_preview,
                                              height: 150),
                                          RatingBar.builder(
                                            itemSize: 18,
                                            initialRating: itemList.data!.length > 0
                                                ? itemList.data![index]
                                                .rating!
                                                .toDouble()
                                                : 0.0,
                                            minRating: 0,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                            EdgeInsets.symmetric(horizontal: 0.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.black26,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          Text(
                                            itemList.data!.length > 0
                                                ? itemList.data![index].titleName!
                                                : "",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Trebuc',
                                                color: Color(colors.color_primary)),
                                          ),
                                          Text(
                                            itemList.data!.length > 0
                                                ? itemList.data![index].brandName!
                                                : "",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Trebuc',
                                                color: Colors.black26),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                "${itemList.data!.length > 0 ? itemList.data![index].amount! : 0.0}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'Trebuc',
                                                    color:
                                                    Color(colors.color_primary)),
                                              ),
                                              Spacer(),
                                              Text(
                                                "${itemList.data!.length > 0 ? itemList.data![index].itemSaleTypeName! : "Unknown"}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'Trebuc',
                                                    color: Colors.black26),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                        },
                        ),
                      )
                    ],
                  )),
            ],
          ));
      },);
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
      categoryBaseRespose = data as CAT.CategoryAllBaseReponse;
      if (categoryBaseRespose.result!.length > 0) {
        categoryList = [];
        categoryList.add(CAT.Result(categoryID:0,category:"All",createdBy:null,createdDate:"",active:true,deleted:false,lastUpdatedDate: "",lastUpdatedBy: ""));
        categoryList.addAll(categoryBaseRespose.result!);
      }
    } else if (code == ConstantManager.ALl_CATEGORY_UNSUCCESS) {
      Factory().showSnackbar(context, message!);
    } else if (code == ConstantManager.ALL_ITEM_SUCCESS) {
      allItemBaseResponse_ = data as ALL_ITEM.AllItemBaseResponse;
      if (allItemBaseResponse_.result!.length > 0) {
        allItemsList = [];
        allItemsList.addAll(allItemBaseResponse_.result!);
      }
    } else if (code == ConstantManager.ALL_ITEM_UNSUCCESS) {
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