import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet/controllers/wholesaler_controller/addtocartcontroller.dart';
import 'package:pet/controllers/wholesaler_controller/home_controller.dart';
import 'package:pet/controllers/wholesaler_controller/productdetails_controller.dart';
import 'package:pet/controllers/wholesaler_controller/subcateogries_controller.dart';
import 'package:pet/controllers/wholesaler_controller/wholesalerFilterController.dart';
import 'package:pet/others/Filter.dart';
import 'package:pet/screens/wholesaler/WholeAllbrandPage.dart';
import 'package:pet/screens/wholesaler/ordersummary.dart';
import 'package:pet/screens/wholesaler/wholeSalerFilterUI.dart';
import 'package:pet/screens/wholesaler/wholeallcategory.dart';
import 'package:pet/screens/wholesaler/wholesalerSearchScreen.dart';
import 'package:pet/screens/wholesaler/wholesalerdrawer.dart';
import 'package:pet/screens/wholesaler/ProductAlllistPage.dart';

import 'package:pet/screens/wholesaler/productdetails.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/ourbrand.dart';

import 'package:pet/screens/wholesaler/notification.dart';

class HomeWhole extends StatefulWidget {
  HomeWhole({super.key});

  @override
  State<HomeWhole> createState() => _HomeWholeState();
}

class _HomeWholeState extends State<HomeWhole> {
  TextEditingController _searchcontroller = TextEditingController();
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  WholeHomeController wholehomecontroller = Get.put(WholeHomeController());
  WholeProductDetailsController wholeproductdetailsController =
      Get.put(WholeProductDetailsController());
  MyCartWholeController mycartwholeController =
      Get.put(MyCartWholeController());
  WholeSubCategoryController wholesubcategorycontroller =
      Get.put(WholeSubCategoryController());

  @override
  Widget build(BuildContext context) {
    //  homeusercontroller.getWishList();
    print("WholeSaler Id: ${GetStorage().read('wholesalerid').toString()}");
    print("WholeSaler Data: ${GetStorage().read('wholesalerData').toString()}");
    return Scaffold(
      key: _drawerkey,
      drawer: drawerWholeSaler(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0, top: 15, bottom: 15),
          child: GestureDetector(
            onTap: () {
              _drawerkey.currentState!.openDrawer();
            },
            child: Image.asset(
              "assets/image/menu2.png",
            ),
          ),
        ),
//           title: Center(
// //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// //
//             child:Text("")
//           ),

        actions: [
          Stack(
            children: [
              InkWell(
                  onTap: () {
                    Get.to(NotificationWhole());
                  },
                  child: Center(
                    child: Icon(Icons.notifications, color: MyColors.black),
                  )),
              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      Positioned(
                          top: 3.0,
                          right: 4.0,
                          child: Center(
                            child: Text(
                              ("5").toString(),
                              // list.length.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ],
                  )),
            ],
          ),
          SizedBox(width: 20),
          Stack(
            children: [
              InkWell(
                  onTap: () {
                    // mycartwholeController.init();
                    Get.to(AddToCardwhole());
                    // Get.to(AddToCardUser());
                  },
                  child:
                      Center(child: SvgPicture.asset("assets/image/bag.svg"))),

// (getCardModel!.data!.isEmpty)?
// SizedBox():

              Positioned(
                  top: 10.0,
                  right: 0,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1, size: 15.0, color: MyColors.red),
                      GetBuilder<MyCartWholeController>(
                          init: mycartwholeController,
                          builder: (_) {
                            return Positioned(
                                top: 3.0,
                                right: 4.0,
                                child: Center(
                                  child: Text(
                                    "5",
                                    // (mycartwholeController.wholemycartmodel!.data!.length).toString(),
                                    // list.length.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ));
                          }),
                    ],
                  )),
            ],
          ),
          SizedBox(
            width: 20,
          )
        ],
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(20),
        //   ),
        // ),
      ),

//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 5.0, top: 15, bottom: 15),
//           child: GestureDetector(
//             onTap: () {
//               _drawerkey.currentState!.openDrawer();
//             },
//             child: Image.asset(
//               "assets/image/menu2.png",
//             ),
//           ),
//         ),
// //           title: Center(
// // //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// // //
// //             child:Text("")
// //           ),
//         actions: [
//           InkWell(
//               onTap: () {
//                 Get.to(NotificationWhole());
//               },
//               child: SvgPicture.asset("assets/image/notification.svg")),
//           // Image.asset("assets/image/cartimg.png"),
//           SizedBox(width: 20),
//           InkWell(
//             onTap: () {
//               Get.to(OrderSummarywhole());
//             },
//             child: Padding(
//               padding: EdgeInsets.only(right: 20.0),
//               child: SvgPicture.asset("assets/image/bag.svg"),
//             ),
//           ),
//         ],
//         // shape: RoundedRectangleBorder(
//         //   borderRadius: BorderRadius.vertical(
//         //     bottom: Radius.circular(20),
//         //   ),
//         // ),
//       ),
//       // backgroundcolor:MyColors.white,

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              primary: true,
              shrinkWrap: true,
              children: [
                // SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          "Find the pet you love on around you easily",
                          style: CustomTextStyle.popinstext,
                        )),

                    GestureDetector(child: Image.asset("assets/image/girl.png"))
                    //  SvgPicture.asset("assets/image/girl.svg"),
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                GetBuilder<WholeHomeController>(
                  init: wholehomecontroller,
                  builder: (_) {
                    return wholehomecontroller.wholeBannerModel == null
                        ? SizedBox()
                        : CarouselSlider.builder(
                            itemCount: wholehomecontroller
                                .wholeBannerModel!.data!.length,
                            options: CarouselOptions(
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.9,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                            ),
                            itemBuilder: (context, index, realIdx) {
                              var item = wholehomecontroller
                                  .wholeBannerModel!.data![index];

                              var imagePath =
                                  "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${item.image ?? ""}";
                              print("=====>>>>>> Banners: $imagePath");
                              return Stack(
                                children: [
                                  // Image.asset(item["image"]),
                                  Container(
                                    // width: 335,
                                    height: 140,
                                    //  decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(25)
                                    //  ),
                                    child: CachedNetworkImage(
                                      imageUrl: imagePath, fit: BoxFit.cover,
                                      // width: 61,
                                      // height: 75,
                                      placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator(),
                                      ), // Replace with your own placeholder widget
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons
                                              .error), // Replace with your own error widget
                                    ),
                                  ),
                                  // Positioned(
                                  //   top: 30,
                                  //   left: 10,
                                  //   child: Column(
                                  //     crossAxisAlignment:
                                  //         CrossAxisAlignment.start,
                                  //     children: [
                                  //       Text(
                                  //         item.title!,
                                  //         style:
                                  //             CustomTextStyle.popinstextsmall12,
                                  //       ),
                                  //       SizedBox(
                                  //           width: MediaQuery.of(context)
                                  //                   .size
                                  //                   .width *
                                  //               0.37,
                                  //           child: Text(
                                  //             item.data!,
                                  //             style: CustomTextStyle
                                  //                 .popinstextsmall12,
                                  //           )),

                                  //       SizedBox(
                                  //         height:
                                  //             MediaQuery.of(context).size.height *
                                  //                 0.02,
                                  //       ),
                                  //       Padding(
                                  //         padding: const EdgeInsets.only(
                                  //             right: 10, bottom: 10),
                                  //         child: Container(
                                  //             width: 80,
                                  //             height: 30,
                                  //             decoration: BoxDecoration(
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(15),
                                  //                 color: Color(0xffffcc00)),
                                  //             child: Center(
                                  //                 child: Text(
                                  //               "Shop  Now",
                                  //               style:
                                  //                   CustomTextStyle.popinssmall1,
                                  //             ))),
                                  //       )

                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              );

                              // Container(
                              //   child: Center(
                              //       child: Image.asset( item["image"],
                              //           fit: BoxFit.cover, )),
                              // );
                            });
                  },
                ),

                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.02,
                // ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 45,
                      width: 265,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(17),

                        // border: Border.all(color:brandcolor ),

                        color: MyColors.white,
                      ),
                      child: TextFormField(
                        onTap: () {
                          wholehomecontroller.clearSearchData();
                          Get.to(WholeSalerSearchScreen());
                        },
                        readOnly: true,
                        controller: _searchcontroller,
                        style: TextStyle(
                          fontSize: 14,
                          color: MyColors.voliet,
                          fontFamily: "SF-Pro-Display",
                        ),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 15),
                            fillColor: MyColors.white,
                            focusColor: MyColors.white,
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none
                                    // borderRadius: BorderRadius.circular(50),
                                    ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              //  borderRadius: BorderRadius.circular(50),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              //  borderRadius: BorderRadius.circular(50),
                            ),
                            hintText: "Search",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                "assets/image/searchnormal.png",
                                width: 10,
                              ),
                            ),
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),

                    //  SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () {
                        WholeSalerFilterController filtercontroller =
                            Get.put(WholeSalerFilterController());
                        // filtercontroller.init();
                        filtercontroller.loadDefaultData();
                        filtercontroller.clearFields();
                        // Get.to(FilterScreen());
                        filtercontroller.init();
                        Get.to(WholeSalerFilterScreenUI());
                        Get.to(FilterScreen());
                      },
                      child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffffcc00)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/image/filter3.png",
                            ),
                          )),
                    )
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      GetBuilder<WholeHomeController>(
                          init: wholehomecontroller,
                          builder: (_) {
                            return !wholehomecontroller.categoryLoaded
                                ? SizedBox()
                                : ListView.builder(
                                    primary: false,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: wholehomecontroller
                                        .userCategoriesModel!.data!.length,
                                    itemBuilder: (context, index) {
                                      var item = wholehomecontroller
                                          .userCategoriesModel!.data![index];
                                      // print(item.name!);
                                      var imagePath =
                                          "${Constants.BASE_URL}${Constants.CATEGORIES_IMAGE_PATH}${item.image ?? ""}";
                                      // print(imagePath);

                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () async {
                                            wholesubcategorycontroller
                                                .addproduct(item.id ?? 0);
                                            wholesubcategorycontroller
                                                .currentCategory(
                                                    item.name ?? "");
                                            await wholesubcategorycontroller
                                                .productInitByCategory();

                                            Get.to(() => WholeAllcategory());
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                child: CachedNetworkImage(
                                                  imageUrl: imagePath,
                                                  width: 61,
                                                  height: 75,
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
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(item.name!,
                                                  style: CustomTextStyle
                                                      .popinssmall)
                                            ],
                                          ),
                                        ),

                                        //  Stack(
                                        //   children: [
                                        //     Container(
                                        //       width: 69,
                                        //       height: 75,
                                        //       decoration: BoxDecoration(
                                        //         borderRadius: BorderRadius.circular(23),
                                        //         color: item,
                                        //         boxShadow: [
                                        //           BoxShadow(
                                        //             color: Colors.grey.withOpacity(0.3),
                                        //             spreadRadius: 2,
                                        //             blurRadius: 5,
                                        //             offset: Offset(
                                        //                 0, 3), // Offset of the shadow
                                        //           ),
                                        //         ],
                                        //       ),
                                        //     ),
                                        //   ],
                                        // )
                                      );
                                    },
                                  );
                          }),
                    ],
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New Arrivals",
                      style: CustomTextStyle.popinstext,
                    ),

                    // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

                    GestureDetector(
                      onTap: () {
                        Get.to(() => ProductAlllistPagewhole());
                      },
                      child: Text('See All',
                          style: TextStyle(
                              color: MyColors.bgcolor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins")),
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                GetBuilder<WholeHomeController>(
                    init: wholehomecontroller,
                    builder: (_) {
                      return wholehomecontroller.userPropertiesModel == null
                          ? SizedBox()
                          : wholehomecontroller.propertyLoaded == null
                              ? SizedBox()
                              : Container(
                                  // height: 600,
                                  child: GridView.builder(
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 15.0,
                                              mainAxisSpacing: 15.0,
                                              mainAxisExtent: 265),
                                      itemCount: wholehomecontroller
                                          .userPropertiesModel!.data!.length
                                          .clamp(0,
                                              4), // Set the number of cards you want to display.
                                      itemBuilder: (context, index) {
                                        // gridDelegate:
                                        //     SliverGridDelegateWithMaxCrossAxisExtent(
                                        //         maxCrossAxisExtent: 150,
                                        //      childAspectRatio: 3 / 2,
                                        //         mainAxisExtent: 300,
                                        //         crossAxisSpacing: 15,
                                        //         mainAxisSpacing: 15),
                                        // itemCount: wholehomecontroller
                                        //     .userPropertiesModel!.data!.length
                                        //     .clamp(0, 4),
                                        // itemBuilder: (BuildContext ctx, index) {

                                        var item = wholehomecontroller
                                            .userPropertiesModel!.data![index];
                                        String imagePath =
                                            Constants.PRODUCT_HOME_IMAGE_PATH +
                                                "/${item.image!}";

                                        // var imagePath =
                                        //     "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${item.image ?? ""}";
                                        // print(imagePath);
                                        return InkWell(
                                          onTap: () async {
                                            wholeproductdetailsController
                                                .viewproduct(
                                              item.id ?? 0,
                                            );
                                            print("productid${item.id ?? 0}");
                                            await wholeproductdetailsController
                                                .init();
                                            Get.to(ProductDetailswhole());
                                          },
                                          child: Container(
                                            width: 140,
                                            // height: 700,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: MyColors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  spreadRadius: 3,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // Offset of the shadow
                                                ),
                                              ],
                                              // color: MyColors.white
                                            ),
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    wholehomecontroller
                                                        .addItemToWishList(
                                                            item.id!);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Icon(wholehomecontroller
                                                                .wishListItemsId
                                                                .contains(
                                                                    item.id!)
                                                            ? Icons.favorite
                                                            : Icons
                                                                .favorite_border)),
                                                  ),
                                                ),

                                                Container(
                                                  height: 125,

                                                  // decoration: BoxDecoration(
                                                  //     borderRadius: BorderRadius.circular(30),
                                                  //     color: MyColors.white),
                                                  child: CachedNetworkImage(
                                                    imageUrl: imagePath,
                                                    // width: 61,
                                                    // height: 75,
                                                    placeholder:
                                                        (context, url) =>
                                                            Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ), // Replace with your own placeholder widget
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        Icon(Icons
                                                            .error), // Replace with your own error widget
                                                  ),
                                                ),

                                                // SizedBox(height: 15,),

                                                Container(
                                                  // height: 140,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 5,
                                                            top: 5),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(item.name!,
                                                            style: CustomTextStyle
                                                                .popinsmedium),
                                                        Text(
                                                            item.description
                                                                        .toString()
                                                                        .length <
                                                                    30
                                                                ? item
                                                                    .description!
                                                                : item
                                                                    .description!
                                                                    .substring(
                                                                        0, 19),
                                                            style: CustomTextStyle
                                                                .popinssmall0),
                                                        SizedBox(height: 5),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "₹" +
                                                                            item.price
                                                                                .toString(),
                                                                        style: CustomTextStyle
                                                                            .discounttext),
                                                                    SizedBox(
                                                                        width:
                                                                            10),
                                                                    Container(
                                                                      height:
                                                                          20,
                                                                      width: 40,
                                                                      decoration: BoxDecoration(
                                                                          color: MyColors
                                                                              .red,
                                                                          borderRadius: BorderRadius.circular(
                                                                              10),
                                                                          border:
                                                                              Border.all(color: MyColors.red)),
                                                                      child:
                                                                          Center(
                                                                        child: Text(
                                                                            // item.discount.toString(),
                                                                            "Save${item.discount.toString()}%",
                                                                            style: CustomTextStyle.popinstextsmal2222),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: 5),
                                                                Text(
                                                                  "₹ ${((double.parse(item.price ?? '')) - ((double.parse(item.price ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",

                                                                  // "₹" +
                                                                  //     item.price!,
                                                                  style: CustomTextStyle
                                                                      .popinsmedium,
                                                                ),
                                                              ],
                                                            ),

                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          5.0),
                                                              child: Container(
                                                                  width: 35,
                                                                  height: 35,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      color: Color(
                                                                          0xffffcc00)),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            5.0),
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/image/bag2.png",
                                                                      height:
                                                                          25,
                                                                    ),
                                                                  )),
                                                            )
                                                            // Image.asset(
                                                            //   "assets/image/yellowbag.png",
                                                            //   height: 80,
                                                            // )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                );
                    }),

                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Our Brand",
                      style: CustomTextStyle.popinstext,
                    ),

                    // Text("See All", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

                    InkWell(
                      onTap: () {
                        Get.to(() => WholeAllbrandPage());
                      },
                      child: Text('See All',
                          style: TextStyle(
                              color: MyColors.bgcolor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins")),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0),
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      // GetBuilder<HomeuserController>(
                      //     init: homeusercontroller,
                      //     builder: (_) {
                      //       return !homeusercontroller.categoryLoaded
                      //           ? SizedBox()
                      //           : ListView.builder(
                      //               primary: false,
                      //               scrollDirection: Axis.horizontal,
                      //               shrinkWrap: true,
                      //               itemCount:
                      //                   homeusercontroller.getOurBrandList.length,
                      //               itemBuilder: (context, index) {
                      //                 var item =
                      //                     homeusercontroller.getOurBrandList[index];
                      //                 // print(item.name!);
                      //                 // var imagePath =
                      //                 //     "${Constants.BASE_URL}${Constants.CATEGORIES_IMAGE_PATH}${item.image ?? ""}";
                      //                 // print(imagePath);

                      //                 return Padding(
                      //                   padding: const EdgeInsets.all(8.0),
                      //                   child: Column(
                      //                     children: [
                      //                       Container(
                      //                         height: MediaQuery.of(context)
                      //                                 .size
                      //                                 .width *
                      //                             0.55,
                      //                         width: MediaQuery.of(context)
                      //                                 .size
                      //                                 .width *
                      //                             0.46,
                      //                         decoration: BoxDecoration(
                      //                           borderRadius:
                      //                               BorderRadius.circular(30),
                      //                           // color: MyColors.white
                      //                         ),
                      //                         child: Stack(
                      //                           alignment: Alignment.topCenter,
                      //                           children: [
                      //                             // SizedBox(height: 140,),
                      //                             Container(
                      //                               height: MediaQuery.of(context)
                      //                                       .size
                      //                                       .width *
                      //                                   0.6,
                      //                               width: MediaQuery.of(context)
                      //                                       .size
                      //                                       .width *
                      //                                   0.46,
                      //                               decoration: BoxDecoration(
                      //                                   borderRadius:
                      //                                       BorderRadius.circular(
                      //                                           30),
                      //                                   color: Colors.transparent),
                      //                               child: Column(
                      //                                 children: [
                      //                                   Padding(
                      //                                     padding:
                      //                                         const EdgeInsets.only(
                      //                                             top: 25.0),
                      //                                     child: Container(
                      //                                       decoration:
                      //                                           BoxDecoration(
                      //                                         borderRadius:
                      //                                             BorderRadius
                      //                                                 .circular(30),
                      //                                         gradient:
                      //                                             LinearGradient(
                      //                                           begin: Alignment
                      //                                               .topCenter,
                      //                                           end: Alignment
                      //                                               .bottomCenter,
                      //                                           colors: [
                      //                                             Color(0xFFFFF0BA),
                      //                                             Color.fromRGBO(
                      //                                                 252,
                      //                                                 233,
                      //                                                 166,
                      //                                                 0.00),
                      //                                           ],
                      //                                         ),
                      //                                       ),
                      //                                       child: Image.asset(
                      //                                           item["image"],
                      //                                           fit: BoxFit.cover,
                      //                                           height: 135),
                      //                                     ),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     height: 15,
                      //                                   ),
                      //                                   Text(item["title"],
                      //                                       style: CustomTextStyle
                      //                                           .popinssmall0)
                      //                                 ],
                      //                               ),
                      //                             ),

                      //                             Positioned(
                      //                               top: 3,
                      //                               child: Container(
                      //                                   height: 50,
                      //                                   width: 60,
                      //                                   decoration: BoxDecoration(
                      //                                       color: Colors.white
                      //                                           .withOpacity(0.3),
                      //                                       borderRadius:
                      //                                           BorderRadius
                      //                                               .circular(20)),
                      //                                   child: Image.asset(
                      //                                     item["logo"],
                      //                                     height: 50,
                      //                                   )),
                      //                             )
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),

                      //                   //  Stack(
                      //                   //   children: [
                      //                   //     Container(
                      //                   //       width: 69,
                      //                   //       height: 75,
                      //                   //       decoration: BoxDecoration(
                      //                   //         borderRadius: BorderRadius.circular(23),
                      //                   //         color: item,
                      //                   //         boxShadow: [
                      //                   //           BoxShadow(
                      //                   //             color: Colors.grey.withOpacity(0.3),
                      //                   //             spreadRadius: 2,
                      //                   //             blurRadius: 5,
                      //                   //             offset: Offset(
                      //                   //                 0, 3), // Offset of the shadow
                      //                   //           ),
                      //                   //         ],
                      //                   //       ),
                      //                   //     ),
                      //                   //   ],
                      //                   // )
                      //                 );
                      //               },
                      //             );
                      //     }),
                      GetBuilder<WholeHomeController>(
                          init: wholehomecontroller,
                          builder: (_) {
                            return wholehomecontroller.wholeOurBrandModel ==
                                        null ||
                                    wholehomecontroller
                                            .wholeOurBrandModel!.data ==
                                        null ||
                                    wholehomecontroller
                                        .wholeOurBrandModel!.data!.isEmpty
                                ? SizedBox()
                                : ListView.builder(
                                    primary: false,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: wholehomecontroller
                                        .wholeOurBrandModel!.data!
                                        .where((element) => element.canine == 1)
                                        .toList()
                                        .length,
                                    itemBuilder: (context, index) {
                                      var item = wholehomecontroller
                                          .wholeOurBrandModel!.data!
                                          .where(
                                              (element) => element.canine == 1)
                                          .toList()[index];
                                      // print("ItemName: ${item.id!}");
                                      var imagePath =
                                          "${Constants.BASE_URL}${Constants.BRAND_IMAGE_PATH}${item.image ?? ""}";
                                      var imageLogoPath =
                                          "${Constants.BASE_URL}${Constants.BRANDLOGO_IMAGE_PATH}${item.logo ?? ""}";
                                      // print(imagePath);
                                      return InkWell(
                                        onTap: () {
                                          // Ourbranddetailscontroller.addproduct(
                                          //     item.id ?? 0, item.logo ?? '');
                                          //  subcategorycontroller.addproduct(item.id??0) ;

                                          // Get.to(OurBrandDetails());
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.55,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.46,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  // color: MyColors.white
                                                ),
                                                child: Stack(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  children: [
                                                    // SizedBox(height: 140,),
                                                    Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.46,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          color: Colors
                                                              .transparent),
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 25.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin: Alignment
                                                                      .topCenter,
                                                                  end: Alignment
                                                                      .bottomCenter,
                                                                  colors: [
                                                                    Color(
                                                                        0xFFFFF0BA),
                                                                    Color.fromRGBO(
                                                                        252,
                                                                        233,
                                                                        166,
                                                                        0.00),
                                                                  ],
                                                                ),
                                                              ),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    imagePath,
                                                                // width: 50,
                                                                height: 135,
                                                                placeholder:
                                                                    (context,
                                                                            url) =>
                                                                        Center(
                                                                  child:
                                                                      CircularProgressIndicator(),
                                                                ), // Replace with your own placeholder widget
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    Icon(Icons
                                                                        .error), // Replace with your own error widget
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(item.title!,
                                                              style: CustomTextStyle
                                                                  .popinssmall0)
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 3,
                                                      child: Container(
                                                        height: 50,
                                                        width: 60,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.3),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child:
                                                            // Image.asset(
                                                            //   item["logo"],
                                                            //   height: 50,
                                                            // ),
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              imageLogoPath,
                                                          // width: 50,
                                                          height: 50,
                                                          placeholder:
                                                              (context, url) =>
                                                                  Center(
                                                            child:
                                                                CircularProgressIndicator(),
                                                          ), // Replace with your own placeholder widget
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Icon(Icons
                                                                  .error), // Replace with your own error widget
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          //  Stack(
                                          //   children: [
                                          //     Container(
                                          //       width: 69,
                                          //       height: 75,
                                          //       decoration: BoxDecoration(
                                          //         borderRadius: BorderRadius.circular(23),
                                          //         color: item,
                                          //         boxShadow: [
                                          //           BoxShadow(
                                          //             color: Colors.grey.withOpacity(0.3),
                                          //             spreadRadius: 2,
                                          //             blurRadius: 5,
                                          //             offset: Offset(
                                          //                 0, 3), // Offset of the shadow
                                          //           ),
                                          //         ],
                                          //       ),
                                          //     ),
                                          //   ],
                                          // )
                                        ),
                                      );
                                    },
                                  );
                          }),
                    ],
                  ),
                ),

                // !wholehomecontroller.propertyLoaded
                //     ? SizedBox()
                //     : GetBuilder<WholeHomeController>(
                //         init: wholehomecontroller,
                //         builder: (_) {
                //           return Container(
                //             // height: 600,
                //             child: GridView.builder(
                //                 primary: false,
                //                 shrinkWrap: true,
                //                 scrollDirection: Axis.vertical,
                //                 physics: NeverScrollableScrollPhysics(),
                //                 gridDelegate:
                //                     SliverGridDelegateWithMaxCrossAxisExtent(
                //                         maxCrossAxisExtent: 150,
                //                         childAspectRatio: 3 / 2,
                //                         mainAxisExtent: 270,
                //                         crossAxisSpacing: 15,
                //                         mainAxisSpacing: 15),
                //                 itemCount: wholehomecontroller
                //                     .userPropertiesModel!.data!.length
                //                     .clamp(0, 4),
                //                 itemBuilder: (BuildContext ctx, index) {
                //                   var item = wholehomecontroller
                //                       .userPropertiesModel!.data![index];

                //                   var imagePath =
                //                       "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${item.image ?? ""}";
                //                   print(imagePath);
                //                   return InkWell(
                //                     onTap: () {
                //                       Navigator.push(
                //                           context,
                //                           MaterialPageRoute(
                //                               builder: (context) =>
                //                                   ProductDetailswhole(
                //                                     itemdetails: item,
                //                                   )));
                //                     },
                //                     child: Container(
                //                       width: 140,
                //                       // height: 700,
                //                       decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(25),
                //                         color: MyColors.white,
                //                         boxShadow: [
                //                           BoxShadow(
                //                             color: Colors.grey.withOpacity(0.3),
                //                             spreadRadius: 3,
                //                             blurRadius: 7,
                //                             offset: Offset(
                //                                 0, 3), // Offset of the shadow
                //                           ),
                //                         ],
                //                         // color: MyColors.white
                //                       ),
                //                       child: Column(
                //                         children: [
                //                           Container(
                //                             height: 125,

                //                             // decoration: BoxDecoration(
                //                             //     borderRadius: BorderRadius.circular(30),
                //                             //     color: MyColors.white),
                //                             child: CachedNetworkImage(
                //                               imageUrl: imagePath,
                //                               width: 61,
                //                               height: 75,
                //                               placeholder: (context, url) =>
                //                                   Center(
                //                                 child:
                //                                     CircularProgressIndicator(),
                //                               ), // Replace with your own placeholder widget
                //                               errorWidget: (context, url,
                //                                       error) =>
                //                                   Icon(Icons
                //                                       .error), // Replace with your own error widget
                //                             ),
                //                           ),

                //                           // SizedBox(height: 15,),

                //                           Container(
                //                             height: 145,
                //                             child: Padding(
                //                               padding: const EdgeInsets.only(
                //                                   left: 10.0, right: 5, top: 5),
                //                               child: Column(
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.start,
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.start,
                //                                 children: [
                //                                   Text(item.name!,
                //                                       style: CustomTextStyle
                //                                           .popinsmedium),
                //                                   Text(
                //                                       item.description.toString(),
                //                                       style: CustomTextStyle
                //                                           .popinssmall0),
                //                                   // SizedBox(height: 3),

                //                                   Row(
                //                                     mainAxisAlignment:
                //                                         MainAxisAlignment
                //                                             .spaceBetween,
                //                                     children: [
                //                                       Text(
                //                                         item.price!,
                //                                         style: CustomTextStyle
                //                                             .popinsmedium,
                //                                       ),

                //                                       Padding(
                //                                         padding:
                //                                             const EdgeInsets.only(
                //                                                 right: 5.0),
                //                                         child: Container(
                //                                             width: 35,
                //                                             height: 35,
                //                                             decoration: BoxDecoration(
                //                                                 borderRadius:
                //                                                     BorderRadius
                //                                                         .circular(
                //                                                             10),
                //                                                 color: Color(
                //                                                     0xffffcc00)),
                //                                             child: Padding(
                //                                               padding:
                //                                                   EdgeInsets.all(
                //                                                       5.0),
                //                                               child: Image.asset(
                //                                                 "assets/image/bag2.png",
                //                                                 height: 25,
                //                                               ),
                //                                             )),
                //                                       )
                //                                       // Image.asset(
                //                                       //   "assets/image/yellowbag.png",
                //                                       //   height: 80,
                //                                       // )
                //                                     ],
                //                                   )
                //                                 ],
                //                               ),
                //                             ),
                //                           )
                //                         ],
                //                       ),
                //                     ),
                //                   );
                //                 }),
                //           );
                //         }),

                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ],
            ),

            GetBuilder<WholeHomeController>(
                init: wholehomecontroller,
                builder: (_) {
                  return wholehomecontroller.showLoading
                      ? BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: Container(
                            color: Colors.black.withOpacity(
                                0.5), // Adjust the opacity as needed
                          ),
                        )
                      : SizedBox();
                }),
            // Progress bar
            GetBuilder<WholeHomeController>(
                init: wholehomecontroller,
                builder: (_) {
                  return wholehomecontroller.showLoading
                      ? Center(
                          child: SpinKitCircle(
                            color: Colors.white, // Color of the progress bar
                            size: 50.0, // Size of the progress bar
                          ),
                        )
                      : SizedBox();
                }),
          ],
        ),
      ),
    );
  }
}
