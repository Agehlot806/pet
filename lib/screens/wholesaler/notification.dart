import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/notification_controller.dart';
import 'package:pet/screens/wholesaler/widget/wholeAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import '../../controllers/wholesaler_controller/notification_controller.dart';

class NotificationWhole extends StatefulWidget {
  const NotificationWhole({super.key});

  @override
  State<NotificationWhole> createState() => _NotificationWholeState();
}

class _NotificationWholeState extends State<NotificationWhole> {
  WholeNotificationController wholenotificationcontroller =
      Get.put(WholeNotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWholeback(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            primary: true,
            shrinkWrap: true,
            // scrollDirection: Axis.vertical,
            children: [
              GetBuilder<WholeNotificationController>(
                  init: wholenotificationcontroller,
                  builder: (_) {
                    return wholenotificationcontroller.wholeNotificationModel ==
                            null
                        ? SizedBox()
                        : ListView.builder(
                            primary: false,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: wholenotificationcontroller
                                .wholeNotificationModel!.state!.length,
                            itemBuilder: (context, index) {
                              var item = wholenotificationcontroller
                                  .wholeNotificationModel!.state![index];
                              // print(item.name!);
                              var imagePath =
                                  "${Constants.BASE_URL}${Constants.NOTIFICATION_IMAGE_PATH}${item.image ?? ""}";
                              return Column(
                                children: [
                                  Container(
                                      width: 335,
                                      height: 71,
                                      decoration: BoxDecoration(
                                          color: MyColors.lightpurple,
                                          borderRadius:
                                              BorderRadius.circular(16.567)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                // Image.asset(item["image"],
                                                //     height: 30),
                                                CachedNetworkImage(
                                                  imageUrl: imagePath,
                                                  width: 50,
                                                  height: 50,
                                                  placeholder: (context, url) =>
                                                      Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ), // Replace with your own placeholder widget
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Icon(Icons
                                                          .error), // Replace with your own error widget
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      // width:
                                                      //     MediaQuery.of(context)
                                                      //             .size
                                                      //             .width *
                                                      //         0.58,
                                                      child: Text(
                                                        item.title!,
                                                        style: CustomTextStyle
                                                            .popinssmall014,
                                                      ),
                                                    ),
                                                    Text(
                                                      item.description!.length >
                                                              36
                                                          ? item.description!
                                                              .substring(0, 35)
                                                          : item.description!,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: CustomTextStyle
                                                          .popinssmall01,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            // Column(
                                            //   // mainAxisAlignment:
                                            //   // MainAxisAlignment.end,
                                            //   children: [
                                            //     Text(
                                            //       item.description!,
                                            //       textAlign: TextAlign.center,
                                            //       style:
                                            //           CustomTextStyle.popinssmall01,
                                            //     )
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                      )),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              );
                              //  ,SizedBox(height:15 ,),
                            },
                          );
                  }),
            ],
          ),
        ));
  }
}
