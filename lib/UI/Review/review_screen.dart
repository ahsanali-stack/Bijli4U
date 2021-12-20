

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/review_base_response.dart';
import 'package:testproject/UI/Review/Bloc/ReviewBloc.dart';
import 'package:testproject/UI/RateExperience/rate_experiance_screen.dart';

class ReviewScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Review();
  }

}

class Review extends State<ReviewScreen>{
  late ReviewBloc bloc;

  @override
  void initState() {
    bloc = ReviewBloc(context);
    bloc.getRatingByUser(2);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("To Review", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Color(colors.color_primary),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 50),
    child: StreamBuilder(
      stream: bloc.itemsList.stream, builder: (BuildContext context, AsyncSnapshot<List<Result>> itemList) {
      return GridView.builder(
          primary: true,
          padding: EdgeInsets.only(left: 10, right: 10,top: 10,bottom: 10),
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          // physics:NeverScrollableScrollPhysics(),
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2 , childAspectRatio: 2/3),
          itemCount: itemList.hasData ? itemList.data!.length : 0,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                Factory().changeScreen(context, () => RateExperienceScreen(itemList.data![index].itemsDetail!.itemID!));
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
                            itemList.data![index].itemsDetail!.imageUrl!.split(',').first),
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
                      // RatingBar.builder(
                      //   ignoreGestures: true,
                      //   glow: false,
                      //   updateOnDrag: false,
                      //   itemSize: 18,
                      //   initialRating: itemList.data!.length > 0
                      //       ? itemList.data![index]
                      //       .rating!
                      //       .toDouble()
                      //       : 0.0,
                      //   minRating: 0,
                      //   direction: Axis.horizontal,
                      //   allowHalfRating: true,
                      //   itemCount: 5,
                      //   itemPadding:
                      //   EdgeInsets.symmetric(horizontal: 0.0),
                      //   itemBuilder: (context, _) => Icon(
                      //     Icons.star,
                      //     color: Colors.amber,
                      //   ),
                      //   onRatingUpdate: (rating) {
                      //     print(rating);
                      //   },
                      // ),
                      Padding(padding: EdgeInsets.only(top: 10),
                        child: Text(
                          itemList.data!.length > 0
                              ? itemList.data![index].itemsDetail!.titleName!
                              : "",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Trebuc',
                              color: Color(colors.color_primary)),
                        ),),
                      // Text(
                      //   itemList.data!.length > 0
                      //       ? itemList.data![index].itemsDetail!.titleName!
                      //       : "",
                      //   style: TextStyle(
                      //       fontSize: 12,
                      //       fontFamily: 'Trebuc',
                      //       color: Colors.black26),
                      // ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // Text(
                          //   "${itemList.data!.length > 0 ? itemList.data![index].itemsDetail!.titleName! : 0.0}",
                          //   style: TextStyle(
                          //       fontSize: 12,
                          //       fontFamily: 'Trebuc',
                          //       color:
                          //       Color(colors.color_primary)),
                          // ),
                          Spacer(),
                          Text(
                            "${itemList.data!.length > 0 ? itemList.data![index].itemsDetail!.itemSaleTypeName! : "Unknown"}",
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
    )),
    );
  }



}