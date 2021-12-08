import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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

class Screen extends State<NotificationScreen> implements ProgressDialogCodeListener{

  bool isShowing = false;
  late NotificationAllResponse response;
  List<Result> all_notifcations = [];


  @override
  void initState() {

    DataProvider().getAllNotifications(context, this);
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isShowing,
      child: ListView.builder(
          itemCount: all_notifcations.length,
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
                                  all_notifcations[index].notificationTitle!,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color(colors.color_primary)),
                                ),//
                                Text(
                                  Factory().get_string_date_from_unix(all_notifcations[index].notificationStartTimeSlot!),
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
                                    Factory().get_image_url(all_notifcations[index].notificationLogo!),
                                    height: 40,
                                    width: 50,
                                  ),
                                  Align(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 6),
                                      child: Text(
                                        all_notifcations[index].notificationDescription!,
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
          }),
    );
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

    if(code == ConstantManager.ALL_NOTIFICATION_SUCCESS)
    {
      response = data as NotificationAllResponse;
      if(response.result!.length>0)
      {
        all_notifcations =[];
        all_notifcations.addAll(response.result!);
      }
    }
    else if(code == ConstantManager.ALL_NOTIFICATION_UNSUCCESS)
    {
      Factory().showSnackbar(context, message!);
    }
  }

  @override
  void onShow() {
    if(!isShowing)
      setState(() {
        isShowing = true;
      });  }

//Card(
//           elevation: 8.0,
//           color: Colors.white,
//           child: Padding(
//             padding: EdgeInsets.all(8),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.notifications,
//                       color: Colors.amberAccent,
//                       size: 25,
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(left: 6),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               "5Kv Generator",
//                               style: TextStyle(
//                                   fontSize: 10,
//                                   color: Color(colors.color_primary)),
//                             ),
//                             Text(
//                               "12-12-2021",
//                               style: TextStyle(
//                                   fontSize: 6,
//                                   color: Color(colors.color_primary)),
//                             ),
//                           ],
//                         ))
//                   ],
//                 ),
//                 Padding(
//                     padding: EdgeInsets.only(top: 10),
//                     child: Container(
//                         width: double.maxFinite,
//                         decoration: BoxDecoration(
//                             color: Colors.black12,
//                             borderRadius: BorderRadius.all(Radius.circular(5))),
//                         child: Padding(
//                           padding: EdgeInsets.all(5),
//                           child: Row(
//                             children: [
//                               Image.asset(
//                                 ConstantManager.generator_img,
//                                 height: 40,
//                                 width: 50,
//                               ),
//                               Align(
//                                 child: Padding(
//                                   padding: EdgeInsets.only(left: 6),
//                                   child: Text(
//                                     "Gas Generator",
//                                     style: TextStyle(
//                                         fontSize: 10,
//                                         color: Color(colors.color_primary)),
//                                   ),
//                                 ),
//                                 alignment: Alignment.centerLeft,
//                               )
//                             ],
//                           ),
//                         )))
//               ],
//             ),
//           ),
//         )
}
