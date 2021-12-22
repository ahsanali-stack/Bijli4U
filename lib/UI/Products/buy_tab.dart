import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/all_item_base_response.dart';
import 'package:testproject/UI/ProductDetails/product_details_screen.dart';
import 'package:testproject/UI/Products/Bloc/BuyBloc.dart';
import 'package:testproject/UI/Products/tab_screen.dart';

class Buy extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BuyTab();
  }
}

class BuyTab extends State<Buy>{


  @override
  void initState() {
    // bloc = BuyBloc(context);
    // bloc.getAllItems(2, 2);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder(
      stream: TabScreen.buyBloc.itemsList.stream, builder: (BuildContext context, AsyncSnapshot<List<Result>> itemList) {
      return GridView.builder(
          primary: true,
          padding: EdgeInsets.only(left: 10, right: 10,top: 10,bottom: 10),
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          // physics:NeverScrollableScrollPhysics(),
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2 ,mainAxisExtent: 270),
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
    );
  }
}