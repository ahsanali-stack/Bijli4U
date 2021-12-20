

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Requests/product_rating_request.dart';
import 'package:testproject/Models/Response/login_response.dart';
import 'package:testproject/UI/RateExperience/Bloc/RateExperienceBloc.dart';

class RateExperienceScreen  extends StatefulWidget{



  final int item_id;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RateExperience(item_id);
  }

  RateExperienceScreen(this.item_id);
}

class RateExperience extends State<RateExperienceScreen>{
  final TextEditingController remarksCtrl = TextEditingController();

  RateExperience(this.item_id);
  final int item_id;
  double product_rating = 0.0;
  double seller_rating = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Rate Your Experience", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Color(colors.color_primary),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("How was the product?",style: TextStyle(color: Colors.black),),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.center,
                  widthFactor: double.maxFinite,
                  child: RatingBar.builder(
                    glow: true,
                    updateOnDrag: false,
                    itemSize: 40,
                    initialRating: product_rating,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding:
                    EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                    onRatingUpdate: (rating) {
                      product_rating = rating;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text("How was seller Experience?",style: TextStyle(color: Colors.black),),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                child: Align(
                  alignment: Alignment.center,
                  widthFactor: double.maxFinite,
                  child: RatingBar.builder(
                    glow: true,
                    updateOnDrag: false,
                    itemSize: 40,
                    initialRating: seller_rating,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding:
                    EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                    onRatingUpdate: (rating) {
                      seller_rating = rating;
                    },
                  ),
                ),
              ),
              Text("Remarks",style: TextStyle(color: Colors.black),),
              Padding(padding: EdgeInsets.only(top: 10),
                  child: TextField(
                    minLines: 3,
                    maxLines: 20,
                    controller: remarksCtrl,
                    enabled: true,
                    // controller: emailCtrl,
                    keyboardType: TextInputType.text,
                    textAlignVertical: TextAlignVertical.top,
                    //validate email address
                    // end here
                    decoration: InputDecoration(

                      // errorText: validateEmail
                      //     ? emailError
                      //     : null,
                        filled: true,
                        fillColor: Colors.white,
                        disabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(8)),
                            borderSide: BorderSide(
                                width: 1.0,
                                color: Color(colors
                                    .color_primary)),
                            gapPadding: 0.0),
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(8)),
                            borderSide: BorderSide(
                                width: 1.0,
                                color: Color(colors
                                    .color_primary)),
                            gapPadding: 0.0),
                        errorStyle: TextStyle(
                          color: Theme
                              .of(context)
                              .errorColor, // or any other color
                        ),
                        hintText: 'Enter your experience here'),
                    style: TextStyle(fontSize: 18),
                  )),
              Align(
                widthFactor: double.maxFinite,
                alignment: Alignment.center,
                child: Padding(padding: EdgeInsets.only(top: 20,bottom: 10),
                  child: ElevatedButton(
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        UserProfile userprofile = Factory().getUserModel(prefs);

                        RateexperienceBloc(context).addProductRating(
                          ProductRatingRequest(
                            userID: userprofile.userID,
                            itemID: item_id,
                            rating: product_rating.toInt(),
                            description: remarksCtrl.text.isNotEmpty ? remarksCtrl.text.toString() : "",
                            sellerRating: seller_rating.toInt(),
                            sellerDescription: ""
                          )
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(
                              left: 40, right: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius
                                  .all(
                                  Radius.circular(8)),
                              side: BorderSide(
                                  width: 1,
                                  color: Color(colors
                                      .color_button_stroke))),
                          fixedSize: Size(double.nan, 45),
                          primary: Color(
                              colors.color_primary)),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontFamily: 'Trebuc',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )),),
              )
            ],
          ),
        ),
      )

    );
  }


}