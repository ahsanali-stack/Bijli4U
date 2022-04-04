
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/all_item_base_response.dart' as ITEMS;
import 'package:testproject/Models/Response/login_response.dart';
import 'package:testproject/UI/ProductDetails/product_details_screen.dart';
import 'package:testproject/UI/Products/Bloc/RentBloc.dart';
import 'package:testproject/UI/Products/tab_screen.dart';

class Rent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RentTab();
  }
}

class RentTab extends State<Rent>{
  final RefreshController controller = RefreshController();
  static late RentBloc rentBloc;



  @override
  void initState() {
    rentBloc = RentBloc(context);
    setData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SmartRefresher(
      onRefresh: (){
        rentBloc.getAllItems(2, 2);
        controller.refreshCompleted();
      },
      controller: controller,
      child: StreamBuilder(
      stream: rentBloc.itemsList.stream,
        builder: (BuildContext context, AsyncSnapshot<List<ITEMS.Result>> itemList) {
      return GridView.builder(
          primary: true,
          padding: EdgeInsets.only(left: 10, right: 10,top: 10,bottom: 10),
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          // physics:NeverScrollableScrollPhysics(),
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2 , childAspectRatio: 2/3.1),
          itemCount: itemList.hasData ? itemList.data!.length : 0,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                Factory().changeScreen(context, () => ProductDetailsScreen(itemList.data![index]));
              },
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      itemList.data!.length > 0
                          ? Image.network(
                        Factory().get_image_url(
                            itemList.data![index].imageUrl!.split(',').first),
                        fit: BoxFit.fill,
                        height: 150,
                        width: double.maxFinite,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            ConstantManager.no_preview,
                            height: 150,width: double.maxFinite,
                          );
                        },
                      )
                          : Image.asset(
                        ConstantManager.no_preview,
                        height: 150,
                        width: double.maxFinite,
                      ),
                      RatingBar.builder(
                        ignoreGestures: true,
                        glow: false,
                        updateOnDrag: false,
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
                          color: Colors.amber,
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
              ),
            );
          });
    },
    ),);
  }

  void setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserProfile userprofile = Factory().getUserModel(prefs);
    //
    rentBloc.getAllItems(2, userprofile.userID!);
    // buyBloc = BuyBloc(context);
    // buyBloc.getAllItems(2, userprofile.userID!);
  }



}