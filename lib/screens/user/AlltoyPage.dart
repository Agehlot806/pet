
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/user_controller/filter_controller.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/controllers/user_controller/productdetails_controller.dart';
import 'package:pet/controllers/user_controller/subcateogries_controller.dart';
import 'package:pet/others/Filter.dart';
import 'package:pet/screens/user/filterScreen.dart';
import 'package:pet/screens/user/notification.dart';
import 'package:pet/screens/user/ordersummary.dart';
import 'package:pet/screens/user/productdetails.dart';
import 'package:pet/screens/user/searchScreen.dart';
import 'package:pet/screens/user/widgets/userAppBar.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';

class AlltoyPage extends StatefulWidget {
  const AlltoyPage( {super.key});

  @override
  State<AlltoyPage> createState() => _AlltoyPageState();
}

class _AlltoyPageState extends State<AlltoyPage> {
    SubCategoryController subcategorycontroller = Get.put(SubCategoryController());
  TextEditingController _searchcontroller = TextEditingController();
    final HomeuserController homeusercontroller = Get.put(HomeuserController());
  ProductDetailsController productdeatilscontroller =
      Get.put(ProductDetailsController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:CustomAppBarback(),
//       appBar: AppBar(
//             elevation: 0,
//           backgroundColor:Colors.transparent,
// leading: Padding(
//   padding:  EdgeInsets.only(left:5.0,top: 10,bottom: 10,right: 0),
//   child:   InkWell(onTap: (){
//     Navigator.pop(context);
//   },
//     child: Icon(Icons.arrow_back_ios,color: MyColors.black,size: 20,
    
//     ),
//   ),
// ),
         
//         title: Center(child: Text("All Toy",style: CustomTextStyle.appbartext,)),
    
//            actions: [
        

                  
//           Stack(
//             children: [
//               InkWell(
//                   onTap: () {
//                      Get.to(NotificationUser());
//                   },
//                   child: Center(child:Icon(Icons.notifications,color:MyColors.black),)),
 
//  Positioned(
//  top: 10.0,right: 0,
//                     child:  Stack(
//                       children: <Widget>[
//                          Icon(
//                             Icons.brightness_1,
//                             size: 15.0, color: MyColors.red),
//                          Positioned(
//                             top: 3.0,
//                             right: 4.0,
//                             child:  Center(
//                               child:  Text(('5').toString(),
//                                 // list.length.toString(),
//                                 style:  TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 8.0,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ),
//                             )),

                  
//                       ],
//                     )),


//             ],
//           ),
    
//                 SizedBox(width: 20),
//  Stack(
//             children: [
//               InkWell(
//                   onTap: () {
//                       Get.to(AddToCardUser());
                   
//                   },
//                   child: Center(child: SvgPicture.asset("assets/image/bag.svg"))),
 
// // (getCardModel!.data!.isEmpty)?
// // SizedBox():
//  Positioned(
//  top: 10.0,right: 0,
//                     child:  Stack(
//                       children: <Widget>[
//                          Icon(
//                             Icons.brightness_1,
//                             size: 15.0, color: MyColors.red),
//                          Positioned(
//                             top: 3.0,
//                             right: 4.0,
//                             child:  Center(
//                               child:  Text(('5').toString(),
//                                 // list.length.toString(),
//                                 style:  TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 8.0,
//                                     fontWeight: FontWeight.w500
//                                 ),
//                               ),
//                             )),

                  
//                       ],
//                     )),


//             ],
//           ),
    
//     SizedBox(width: 20,)
    
//         ], 
       
        
//         ),

        body:ListView(
          primary: true,
          shrinkWrap: true,
          children: [

            
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
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
                            homeusercontroller.clearSearchData();
                            Get.to(SearchScreen());
                          },
                          readOnly: true,
                          controller: homeusercontroller.searchcontroller,
                          style: TextStyle(
                            fontSize: 14,
                            color: MyColors.voliet,
                            fontFamily: "SF-Pro-Display",
                          ),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15),
                              fillColor: MyColors.white,
                              focusColor: MyColors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
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
                      // GetBuilder<FilterController>(
                      //       // init: filtercontroller,
                      //       builder: (_) {
                      //  return
                      GestureDetector(
                        onTap: () {
                          FilterController filtercontroller =
                              Get.put(FilterController());
                          // filtercontroller.init();
                          filtercontroller.loadDefaultData();
                          filtercontroller.clearFields();
                          // Get.to(FilterScreen());
                          filtercontroller.init();
                          Get.to(FilterScreenUI());
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
                
                      // )
                    ],
                  ),
                ),

     
            // SizedBox(height: MediaQuery.of(context).size.height*0.02),
//  Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,          
//           children: [

//           Container(
//              height:45,
//           width:265,
//                    decoration: BoxDecoration(
//           shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(17),
        
//                         // border: Border.all(color:brandcolor ),
        
//              color:MyColors.white,
       
        
//                     ),
        
         
          
//             child: TextFormField(
//                                   controller: _searchcontroller,
//                                                 style: TextStyle(fontSize: 14,color: MyColors.voliet, fontFamily: "SF-Pro-Display",),
        
//                                decoration: InputDecoration(
                                   
//                                        contentPadding: EdgeInsets.only(left: 15),
//                                       fillColor:MyColors.white,
//                                       focusColor:MyColors.white,
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide.none,
//                                         // borderRadius: BorderRadius.circular(50),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide.none,
//                                         //  borderRadius: BorderRadius.circular(50),
//                                       ),
//                                       border: OutlineInputBorder(
//                                         borderSide: BorderSide.none,
//                                         //  borderRadius: BorderRadius.circular(50),
//                                       ),
//                                       hintText:"Search",
//                                       prefixIcon:Padding(
//                                         padding: const EdgeInsets.all(10.0),
//                                         child: Image.asset("assets/image/searchnormal.png",width: 10,),
//                                       ),
                                  
//                                       hintStyle:
//                                       TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.w400)
                                    
//                                       ),
//                                 ),
//           ),
     
//     //  SizedBox(width: 10,),
//      GestureDetector(
//        onTap: () {
//                     Get.to(FilterScreen());},
//        child: Container(width: 45,
//      height: 45,
//      decoration: BoxDecoration(
//      borderRadius: BorderRadius.circular(15),
//      color: Color(0xffffcc00)),
//      child: Padding(
//        padding: const EdgeInsets.all(10.0),
//        child:   Image.asset("assets/image/filter3.png",),
//      )),
//      )

//          ],),
     
     
         SizedBox(height: MediaQuery.of(context).size.height*0.04,),
            !subcategorycontroller.toyloaded
                ? SizedBox()
                : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
                          //  height: MediaQuery.of(context).size.height,
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
                                      mainAxisExtent: 285),
                              itemCount: subcategorycontroller
                                  .usertoyModel!.data!.length
                                 , // Set the number of cards you want to display.
                              itemBuilder: (context, index) {
                                // gridDelegate:
                                //     SliverGridDelegateWithMaxCrossAxisExtent(
                                //         maxCrossAxisExtent: 150,
                                //      childAspectRatio: 3 / 2,
                                //         mainAxisExtent: 300,
                                //         crossAxisSpacing: 15,
                                //         mainAxisSpacing: 15),
                                // itemCount: homeusercontroller
                                //     .userPropertiesModel!.data!.length
                                //     .clamp(0, 4),
                                // itemBuilder: (BuildContext ctx, index) {
                                var item =  subcategorycontroller
                                  .usertoyModel!.data![index];
                  
                                 
                                var imagePath =
                                       "${Constants.BASE_URL}/storage/app/public/product/${item.image ?? ""}";
                                print(imagePath);
                                return InkWell(
                                  // onTap: () async{
                                      //  productdeatilscontroller.viewproduct( item.id??0,);
                                      //      print("productid${item.id??0}");
                                      //     await productdeatilscontroller.init();
                                      //       productdeatilscontroller.clearFields();  
                                      //  Get.to( ProductDetails());
                                  // },
                                    onTap: () async{
                                                 productdeatilscontroller
                                                .viewproduct(
                                              item.id ?? 0,
                                            );
                                             print("productippppd${item.id ?? 0}");
                                        await productdeatilscontroller.init();
                                        Get.to(ProductDetails(
                                         id: item.id??0, 
                                        ));
                                            },
                                  child:  Container(
                                                width: 140,
                                                // height: 700,
                                                decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          // _getRandomColor(),
                                                          // _getRandomColor(),
                                                          // _getRandomColor(),
                                                          // _getRandomColor(),
                                                          // MyColors.white
                                                          //     .withOpacity(0.1),
                                                          MyColors.white,
                                                          MyColors.white,
                                                          // MyColors.white,
                                                        ],
                                                        begin: Alignment.topCenter,
                                                        end: Alignment.bottomCenter,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(25),
                                                      // color: MyColors.white,
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
                  
                  
                  
                                                   GetBuilder<HomeuserController>(
                      init: homeusercontroller,
                      builder: (_) {
                                                        return InkWell(
                                                          onTap: () {
                                                            homeusercontroller
                                                                .addItemToWishList(
                                                                    item.id!);
                  
                                                                homeusercontroller.init();
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child: Icon(
                                                                  homeusercontroller
                                                                          .wishListItemsId
                                                                          .contains(
                                                                              item
                                                                                  .id!)
                                                                      ? Icons
                                                                          .favorite
                                                                      : Icons
                                                                          .favorite_border,
                                                                  color:
                                                                      Colors.red),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    ),
                  
                                                
                                                
                  
                  
                                                    Container(
                                                      height: 125,
                                                      decoration: BoxDecoration(
                                                          // gradient:
                                                          //     LinearGradient(
                                                          //   colors: [
                                                          //     _getRandomColor(),
                                                          //     _getRandomColor(),
                                                          //     _getRandomColor(),
                                                          //     _getRandomColor(),
                                                          //   ],
                                                          //   begin:
                                                          //       Alignment.topLeft,
                                                          //   end: Alignment
                                                          //       .bottomRight,
                                                          // ),
                                                          ),
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
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons
                                                                .error), // Replace with your own error widget
                                                      ),
                                                    ),
                  
                                                    // SizedBox(height: 15,),
                  
                                                    Container(
                                                      // height: 140,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
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
                                                                            0,
                                                                            19),
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
                                                                                item.price.toString(),
                                                                            style: CustomTextStyle.discounttext),
                                                                        SizedBox(
                                                                            width:
                                                                                2),
                                                                        // Container(
                                                                        // height:
                                                                        //     20,
                                                                        // width: 48,
                                                                        // decoration: BoxDecoration(
                                                                        //     color: MyColors
                                                                        //         .red,
                                                                        //     borderRadius: BorderRadius.circular(
                                                                        //         10),
                                                                        //     border:
                                                                        //         Border.all(color: MyColors.red)),
                                                                        // child:
                                                                        //     Center(
                                                                        //   child:
                                                                        Text(
                                                                            // item.discount.toString(),
                                                                            "Save${item.discount.toString()}%",
                                                                            style:
                                                                                CustomTextStyle.popinstextsmal2222red),
                                                                        //   ),
                                                                        // ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            5),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              Get.width * 0.23,
                                                                          child:
                                                                              Text(
                                                                            "₹ ${((double.parse(item.price ?? '')) - ((double.parse(item.price ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",
                  
                                                                            // "₹" +
                                                                            //     item.price!,
                                                                            style:
                                                                                CustomTextStyle.popinsmedium,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                Get.width * 0.054),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(right: 5.0),
                                                                          child: Container(
                                                                              width: 35,
                                                                              height: 35,
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xffffcc00)),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(5.0),
                                                                                child: Image.asset(
                                                                                  "assets/image/bag2.png",
                                                                                  height: 25,
                                                                                ),
                                                                              )),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                  
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
                                              )
                                            );
                              }),
                        ),
                )
               ],
        )
 
    
    );
  }
}