import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:testproject/UI/Notification/Bloc/NotificationBloc.dart';
import 'package:testproject/Colors/Colors.dart';
import 'package:testproject/ConstantManager/ConstantManager.dart';
import 'package:testproject/DataProvider/DataProvider.dart';
import 'package:testproject/Factory/Factory.dart';
import 'package:testproject/Models/Response/notification_all_response.dart';
import 'package:testproject/ProgressDialogCodeListener/ProgressDialogCodeListener.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Screen();
  }
}

class Screen extends State<NotificationScreen>
    with AutomaticKeepAliveClientMixin<NotificationScreen> {
  late NotificationBloc bloc;
  late RefreshController _refreshController = RefreshController(initialRefresh: false);
  // bool isShowing = false;
  // late NotificationAllResponse response;
  // List<Result> all_notifcations = [];

  @override
  void initState() {
    super.initState();
      bloc = NotificationBloc(context);
      bloc.getAllNofication();
    _refreshController = RefreshController(initialRefresh: false);

    // DataProvider().getAllNotifications(context, this);
  }




  @override
  Widget build(BuildContext context) {
    super.build(context); // need to call super method.

    return StreamBuilder(
      stream: bloc.showingStream,
      builder: (BuildContext context, AsyncSnapshot<bool> isShowing) {
        return ModalProgressHUD(
            inAsyncCall: isShowing.hasData ? isShowing.data! : false,
            child: StreamBuilder(
              stream: bloc.allNoficationStream,
              builder: (BuildContext context,
                  AsyncSnapshot<NotificationAllResponse> baseResponse) {
                return ListView.builder(
                    itemCount: baseResponse.hasData
                        ? baseResponse.data!.result!.length
                        : 0,
                    padding: const EdgeInsets.all(5),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 8.0,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    color: Colors.amberAccent,
                                    size: 25,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 6),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            baseResponse.data!.result![index]
                                                .notificationTitle!,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color(
                                                    colors.color_primary)),
                                          ), //
                                          Text(
                                            Factory().get_string_date_from_unix(
                                                baseResponse
                                                    .data!
                                                    .result![index]
                                                    .notificationStartTimeSlot!),
                                            style: TextStyle(
                                                fontSize: 6,
                                                color: Color(
                                                    colors.color_primary)),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Container(
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Row(
                                          children: [
                                            Image.network(
                                              Factory().get_image_url(
                                                  baseResponse
                                                      .data!
                                                      .result![index]
                                                      .notificationLogo!),
                                              height: 40,
                                              width: 50,
                                            ),
                                            Align(
                                              child: Padding(
                                                padding:
                                                EdgeInsets.only(left: 6),
                                                child: Text(
                                                  baseResponse
                                                      .data!
                                                      .result![index]
                                                      .notificationDescription!,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Color(colors
                                                          .color_primary)),
                                                ),
                                              ),
                                              alignment: Alignment.centerLeft,
                                            )
                                          ],
                                        ),
                                      )))
                            ],
                          ),
                        ),
                      );
                    });
              },
            ));
      },
    );
  }

  Widget buildList(AsyncSnapshot<NotificationAllResponse> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data!.result!.length,
        padding: const EdgeInsets.all(5),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 8.0,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Colors.amberAccent,
                        size: 25,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                snapshot
                                    .data!.result![index].notificationTitle!,
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color(colors.color_primary)),
                              ), //
                              Text(
                                Factory().get_string_date_from_unix(snapshot
                                    .data!
                                    .result![index]
                                    .notificationStartTimeSlot!),
                                style: TextStyle(
                                    fontSize: 6,
                                    color: Color(colors.color_primary)),
                              ),
                            ],
                          ))
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Image.network(
                                  Factory().get_image_url(snapshot
                                      .data!.result![index].notificationLogo!),
                                  height: 40,
                                  width: 50,
                                ),
                                Align(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 6),
                                    child: Text(
                                      snapshot.data!.result![index]
                                          .notificationDescription!,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(colors.color_primary)),
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                )
                              ],
                            ),
                          )))
                ],
              ),
            ),
          );
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
