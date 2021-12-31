import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/all_item_base_response.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Result product_details_model;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductDetails(product_details_model);
  }

  ProductDetailsScreen(this.product_details_model);
}

class ProductDetails extends State<ProductDetailsScreen> {
  final Result product_details_model;
  final tab_index = BehaviorSubject<int>();
  final index = BehaviorSubject<int>();
  late List<String> imageList;



  ProductDetails(this.product_details_model);

  @override
  void initState() {
    tab_index.sink.add(0);
    index.sink.add(0);
    imageList = product_details_model.imageUrl!.split(',').toList();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 160.0,
                floating: false,
                pinned: false,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                    background:  StreamBuilder(
                      stream: this.index.stream,
                      builder: (BuildContext context, AsyncSnapshot<int> image_index) {
                        return Image.network(
                          Factory().get_image_url(
                              imageList[image_index.hasData ? image_index.data! : 0]),
                          fit: BoxFit.contain,
                          height: 150,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                                ConstantManager.no_preview,
                                height: 150);
                          },
                        );
                      },
                    )),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            this.index.sink.add(index);
                          },
                          child: Padding(
                            padding:
                            EdgeInsets.only(left: 2, right: 2, bottom: 4),
                            child: StreamBuilder(
                              stream: this.index.stream,
                              builder: (BuildContext context, AsyncSnapshot<int> image_index) {
                                return Container(
                                    decoration: image_index.data == index
                                        ? BoxDecoration(
                                        border: Border.all(
                                            color: Color(
                                                colors.color_button_stroke)))
                                        : null,
                                    child:  Image.network(
                                      Factory().get_image_url(
                                          imageList[index]),
                                      fit: BoxFit.fill,
                                      height: 150,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Image.asset(
                                            ConstantManager.no_preview,
                                            height: 150);
                                      },
                                    ));
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "${product_details_model.category}",
                        style: TextStyle(
                            fontFamily: "Trebuc",
                            color: Color(colors.color_primary), fontSize: 16),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        "${product_details_model.titleName}",
                        style: TextStyle(
                            fontFamily: "Trebuc",
                            color: Color(colors.color_primary),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        "${product_details_model.itemDescription}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: "Trebuc",
                            color: Color(colors.color_primary), fontSize: 16),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "${product_details_model.brandName}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: "Trebuc",
                            color: Color(colors.color_primary),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        "PKR${product_details_model.amount}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: "Trebuc",
                            color: Color.fromRGBO(colors.color_price.red, colors.color_price.green, colors.color_price.blue, 100),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Divider(
                      color: Color(colors.color_primary),
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      decoration:
                      BoxDecoration(color: Color.fromRGBO(colors.color_highlight.red, colors.color_highlight.green, colors.color_highlight.blue, 100)),
                      width: double.maxFinite,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Service Provider",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: "Trebuc",
                                    color: Color(colors.color_primary),
                                    fontSize: 16)),
                            Text("ALLIED ENGINEERING",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: "Trebuc",
                                    color: Color(colors.color_primary),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:40),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder(stream: this.tab_index.stream,
                          builder: (BuildContext context, AsyncSnapshot<int> tab_index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child:InkWell(
                                      onTap: (){
                                        this.tab_index.sink.add(0);
                                      },
                                      child:  Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                top: tab_index.data == 0 ? BorderSide(
                                                    width: 6,
                                                    color: Color(colors.color_button_stroke)
                                                ) : BorderSide(
                                                    width: 6,
                                                    color: Color(colors.color_primary)
                                                ),
                                                left: BorderSide(
                                                    width: 1,
                                                    color: Color(colors.color_primary)
                                                ),
                                                bottom: tab_index.data == 0 ? BorderSide(
                                                    width: 0,
                                                    color: Colors.transparent
                                                ) : BorderSide(
                                                    width: 1,
                                                    color: Color(colors.color_primary)
                                                ),
                                                right: BorderSide(
                                                    width: 1,
                                                    color: Color(colors.color_primary)
                                                )
                                            )
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(6),
                                          child: Align(alignment: Alignment.center,child: Text("Description",style: TextStyle(fontSize: 16,color: Color(colors.color_primary),fontWeight: FontWeight.bold,fontFamily: 'Trebuc')),),
                                        ),
                                      )),
                                ),
                                Expanded(flex: 1,child: InkWell(
                                    onTap: (){
                                      this.tab_index.sink.add(1);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              top: tab_index.data == 1 ? BorderSide(
                                                  width: 6,
                                                  color: Color(colors.color_button_stroke)
                                              ) : BorderSide(
                                                  width: 6,
                                                  color: Color(colors.color_primary)
                                              ),
                                              left: BorderSide(
                                                  width: 1,
                                                  color: Color(colors.color_primary)
                                              ),
                                              bottom: tab_index.data == 1 ? BorderSide(
                                                  width: 0,
                                                  color: Colors.transparent
                                              ) : BorderSide(
                                                  width: 1,
                                                  color: Color(colors.color_primary)
                                              ),
                                              right: BorderSide(
                                                  width: 1,
                                                  color: Color(colors.color_primary)
                                              )
                                          )
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Align(alignment: Alignment.center,child: Text("Specification",style: TextStyle(fontSize: 16,color: Color(colors.color_primary),fontWeight: FontWeight.bold,fontFamily: 'Trebuc'),)),
                                      ),
                                    )),
                                ),
                                Expanded(flex: 1,child:InkWell(
                                    onTap: (){
                                      this.tab_index.sink.add(2);
                                    },
                                    child:  Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              top: tab_index.data == 2 ? BorderSide(
                                                  width: 6,
                                                  color: Color(colors.color_button_stroke)
                                              ) : BorderSide(
                                                  width: 6,
                                                  color: Color(colors.color_primary)
                                              ),
                                              left: BorderSide(
                                                  width: 1,
                                                  color: Color(colors.color_primary)
                                              ),
                                              bottom: tab_index.data == 2 ? BorderSide(
                                                  width: 0,
                                                  color: Colors.transparent
                                              ) : BorderSide(
                                                  width: 1,
                                                  color: Color(colors.color_primary)
                                              ),
                                              right: BorderSide(
                                                  width: 1,
                                                  color: Color(colors.color_primary)
                                              )
                                          )                                    ),
                                      child: Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Align(alignment: Alignment.center,child: Text("Reviews",style: TextStyle(fontSize: 16,color: Color(colors.color_primary),fontWeight: FontWeight.bold,fontFamily: 'Trebuc'))),
                                      ),
                                    )),
                                )
                              ],
                            );
                          },),
                        StreamBuilder(stream: this.tab_index.stream,
                          builder: (BuildContext context, AsyncSnapshot<int> tab_index) {
                            return Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(border: Border(
                                left: BorderSide(
                                    width: 1,
                                    color: Color(colors.color_primary)
                                ),
                                right: BorderSide(
                                    width: 1,
                                    color: Color(colors.color_primary)
                                ),
                                bottom: BorderSide(
                                    width: 1,
                                    color: Color(colors.color_primary)
                                ),
                              )),
                              child: Padding(
                                padding: EdgeInsets.all(30),
                                child: buildWidget(tab_index.hasData ? tab_index.data! : 0),
                              ),
                            );
                          },)
                      ],
                    ),)
                ],
              ),
            ),
          )),
    );
  }

  Widget buildWidget(int index) {
    if(index == 0){
      return Text("${product_details_model.itemDescription}",
          style: TextStyle(fontSize: 16,color: Color(colors.color_primary),fontFamily: 'Trebuc'));
    }
    else if(index == 1)
      {
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: 0),child:Text("SUB CATEGORY:",style: TextStyle(fontFamily: 'Trebuc',fontSize: 16,fontWeight: FontWeight.bold,color: Color(colors.color_primary)),)),
                Padding(padding: EdgeInsets.only(top: 10),child:Text("BRAND:",style: TextStyle(fontFamily: 'Trebuc',fontSize: 16,fontWeight: FontWeight.bold,color: Color(colors.color_primary)),)),
                Padding(padding: EdgeInsets.only(top: 10),child:Text("CAPACITY:",style: TextStyle(fontFamily: 'Trebuc',fontSize: 16,fontWeight: FontWeight.bold,color: Color(colors.color_primary)),)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: 0,left: 10),child:Text("${product_details_model.subCategoryName}",style: TextStyle(fontFamily: 'Trebuc',fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black26),)),
                Padding(padding: EdgeInsets.only(top: 10,left: 10),child:Text("${product_details_model.brandName}",style: TextStyle(fontFamily: 'Trebuc',fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black26),)),
                Padding(padding: EdgeInsets.only(top: 10,left: 10),child:Text("${product_details_model.capacity} ${product_details_model.unitType}",style: TextStyle(fontFamily: 'Trebuc',fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black26),)),
              ],
            ),
          ],
        );
      }
    else if(index == 2)
      {
        return Container(
            height: 120,
          child:  ListView.builder(
            itemExtent: 300,
            padding: EdgeInsets.only(left: 10, right: 10,bottom: 0),
            itemCount: product_details_model.reviews != null && product_details_model.reviews!.length > 0 ? product_details_model.reviews!.length : 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text("${product_details_model.reviews![index].userName}",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16,color: Color(colors.color_primary),fontFamily: 'Trebuc'),),
                          Padding(padding: EdgeInsets.only(left: 20),child: RatingBar.builder(
                            ignoreGestures: true,
                            glow: false,
                            updateOnDrag: false,
                            itemSize: 12,
                            initialRating: 0.0,
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
                          ),),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 10),child: Text("Comments Comments Comments Comments Comments dsadsa ${product_details_model.reviews![index].comments}",style: TextStyle(fontSize: 14,color: Color(colors.color_primary),fontFamily: 'Trebuc'),overflow: TextOverflow.ellipsis,maxLines: 3,),)
                    ],
                  ),
                ),
              );
            },

          ),
        );
      }

    return Text("No Widget");
  }

}
