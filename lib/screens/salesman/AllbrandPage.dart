import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pet/controllers/salesman_controller/homesales_controller.dart';
import 'package:pet/controllers/user_controller/home_controller.dart';
import 'package:pet/utils/colors.dart';
import 'package:pet/utils/constants.dart';
import 'package:pet/utils/fontstyle.dart';
import 'package:pet/screens/user/ourbrand.dart';

class AllbrandPagesales extends StatefulWidget {
  const AllbrandPagesales({super.key});

  @override
  State<AllbrandPagesales> createState() => _AllbrandPagesalesState();
}

class _AllbrandPagesalesState extends State<AllbrandPagesales> {
   final HomeSalesController homesalecontroller = Get.put(HomeSalesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            elevation: 0,
          backgroundColor:Colors.transparent,
leading: Padding(
  padding:  EdgeInsets.only(left:5.0,top: 10,bottom: 10,right: 0),
  child:   InkWell(onTap: (){
    Navigator.pop(context);
  },
    child: Icon(Icons.arrow_back_ios,color:MyColors. black,size: 20,
    
    ),
  ),
),
         
        title: Center(child: Text("All Our Brands",style: CustomTextStyle.appbartext,)),
        ),

        body:Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(  primary: false,
            children: [
            // SizedBox(height: MediaQuery.of(context).size.height*0.01),
        
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  GetBuilder<HomeSalesController>(
                      init: homesalecontroller,
                      builder: (_) {
                        return homesalecontroller.salesBrandModel == null
                            ? SizedBox()
                            : ListView.builder(
                                primary: false,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: homesalecontroller
                                    .salesBrandModel!.data!.length,
                                itemBuilder: (context, index) {
                                  var item = homesalecontroller
                                      .salesBrandModel!.data![index];
                                  // print(item.name!);
                                  var imagePath =
                                      "${Constants.BASE_URL}${Constants.CATEGORIES_IMAGE_PATH}${item.image ?? ""}";
                                  var imageLogoPath =
                                      "${Constants.BASE_URL}${Constants.CATEGORIES_IMAGE_PATH}${item.logo ?? ""}";
                                  // print(imagePath);
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.63,
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
                                            alignment: Alignment.topCenter,
                                            children: [
                                              // SizedBox(height: 140,),
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.6,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.46,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: Colors.transparent),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 25.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          gradient:
                                                              LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                            colors: [
                                                              Color(0xFFFFF0BA),
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
                                                          imageUrl: imagePath,
                                                          // width: 50,
                                                          height: 135,
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
                                                          .withOpacity(0.3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child:
                                                      // Image.asset(
                                                      //   item["logo"],
                                                      //   height: 50,
                                                      // ),
                                                      CachedNetworkImage(
                                                    imageUrl: imageLogoPath,
                                                    // width: 50,
                                                    height: 50,
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
                                  );
                                },
                              );
                      }),
                ],
              ),
            ),
          

// GridView.builder(
//                         primary: false,
//                         shrinkWrap: true,
//                           scrollDirection: Axis.vertical,
//                           physics: NeverScrollableScrollPhysics(),
//                           gridDelegate:
//                               SliverGridDelegateWithMaxCrossAxisExtent(
//                                      maxCrossAxisExtent: 150,
//                                                             crossAxisSpacing:
//                                                             15,
//                                                             mainAxisSpacing:
//                                                             15,
//                                                             mainAxisExtent:
//                                                             276),
//                           itemCount:  homeusercontroller.getOurBrandList.length,
//                           itemBuilder: (BuildContext ctx, index) {
//                             var item = homeusercontroller
//                                .getOurBrandList[index];

//                             // var imagePath =
//                             //     "${Constants.BASE_URL}${Constants.PRODUCT_IMAGE_PATH}${item.image ?? ""}";
//                             // print(imagePath);
//                             return  InkWell(
//     onTap: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>OurBrand()));
//     },
//     child:  Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Column(
//                                       children: [
//                                         Container(
//                                           height: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.60,
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.46,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(30),
//                                             // color: MyColors.white
//                                           ),
//                                           child: Stack(
//                                             alignment: Alignment.topCenter,
//                                             children: [
//                                               // SizedBox(height: 140,),
//                                               Container(
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.6,
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.46,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             30),
//                                                     color: Colors.transparent),
//                                                 child: Column(
//                                                   children: [
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               top: 25.0),
//                                                       child: Container(
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(30),
//                                                           gradient:
//                                                               LinearGradient(
//                                                             begin: Alignment
//                                                                 .topCenter,
//                                                             end: Alignment
//                                                                 .bottomCenter,
//                                                             colors: [
//                                                               Color(0xFFFFF0BA),
//                                                               Color.fromRGBO(
//                                                                   252,
//                                                                   233,
//                                                                   166,
//                                                                   0.00),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                         child: Image.asset(
//                                                             item["image"],
//                                                             fit: BoxFit.cover,
//                                                             height: 135),
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       height: 15,
//                                                     ),
//                                                     Text(item["title"],
//                                                         style: CustomTextStyle
//                                                             .popinssmall0)
//                                                   ],
//                                                 ),
//                                               ),

//                                               Positioned(
//                                                 top: 3,
//                                                 child: Container(
//                                                     height: 50,
//                                                     width: 60,
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.white
//                                                             .withOpacity(0.3),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(20)),
//                                                     child: Image.asset(
//                                                       item["logo"],
//                                                       height: 50,
//                                                     )),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),

//                                     //  Stack(
//                                     //   children: [
//                                     //     Container(
//                                     //       width: 69,
//                                     //       height: 75,
//                                     //       decoration: BoxDecoration(
//                                     //         borderRadius: BorderRadius.circular(23),
//                                     //         color: item,
//                                     //         boxShadow: [
//                                     //           BoxShadow(
//                                     //             color: Colors.grey.withOpacity(0.3),
//                                     //             spreadRadius: 2,
//                                     //             blurRadius: 5,
//                                     //             offset: Offset(
//                                     //                 0, 3), // Offset of the shadow
//                                     //           ),
//                                     //         ],
//                                     //       ),
//                                     //     ),
//                                     //   ],
//                                     // )
//                                   )
                                
  
//   );
//                           }),
                
  //            GridView(
  //                                                       physics:
  //                                                       NeverScrollableScrollPhysics(),
  //                                                       scrollDirection:
  //                                                       Axis.vertical,
  //                                                       gridDelegate:
  //                                                       SliverGridDelegateWithFixedCrossAxisCount(
  //                                                           crossAxisCount:
  //                                                           2,
  //                                                           crossAxisSpacing:
  //                                                           15,
  //                                                           mainAxisSpacing:
  //                                                           15,
  //                                                           mainAxisExtent:
  //                                                           276),
  //                                                       children: [
                                                         
                           
  // InkWell(
  //   onTap: (){
  //       Navigator.push(context, MaterialPageRoute(builder: (context)=>OurBrand()));
  //   },
  //   child: Container(
  //                       height:MediaQuery.of(context).size.width*0.63,
                                  
  //                                   width: MediaQuery.of(context).size.width*0.46,
                                  
  //                                   decoration: BoxDecoration(
                                  
  //                                     borderRadius: BorderRadius.circular(30),
  //                              // color:MyColors.white
  //                                   ),
                                   
  //                   child:
  //                       Stack(
  //                           alignment: Alignment.topCenter,
  //                           children: [
  //                             // SizedBox(height: 140,),
  //                             Container(
                                  
  //                                   height:MediaQuery.of(context).size.width*0.6,
                                  
  //                                   width: MediaQuery.of(context).size.width*0.46,
                                  
  //                                   decoration: BoxDecoration(
                                  
  //                                     borderRadius: BorderRadius.circular(30),
  //                                   // color:MyColors.white
  //           //                          gradient: LinearGradient(
  //           //   begin: Alignment.topCenter,
  //           //   end: Alignment.bottomCenter,
  //           //   colors: [
  //           //     Color(0xFFFFF0BA),
  //           //     Color.fromRGBO(252, 233, 166, 0.00),
  //           //   ],
  //           // ),
  //                                   ),
                                  
  //                                 child:
  //                                  Column(children: [
                                  
  //                                     Padding(
  //                                       padding: const EdgeInsets.only(top:25.0),
  //                                       child: Container( decoration: BoxDecoration(
  //                                                                       gradient: LinearGradient(
  //             begin: Alignment.topCenter,
  //             end: Alignment.bottomCenter,
  //             colors: [
  //               Color(0xFFFFF0BA),
  //               Color.fromRGBO(252, 233, 166, 0.00),
  //             ],
  //           ),                    
  //                                       borderRadius: BorderRadius.circular(30),
  //                                       // color:MyColors.white
  //                                        ),
  //                                         child:
  //                                         Image.asset("assets/image/food5.png",fit: BoxFit.cover,height: 135),
  //                                       ),
  //                                     ),
                                      
                                  
                                  
  //                                 // SizedBox(height: 15,),
                                  
                                  
  //                                   Column( mainAxisAlignment: MainAxisAlignment.start,
  //                                   crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                                    Text(
  //                                   'Reservation',
  //                                   style:   CustomTextStyle.  popinssmall0
                                  
  //                                 ),
                                   
  //                             ],
  //                                   )
                                  
  //                                 ],),
                                  
  //                                ),
                           
                           
  //                           Positioned(
  //                                      top: 3,
  //                             child: 
  //                             Container(height: 50,width: 60,
  //                             decoration: BoxDecoration(color: Colors.white.withOpacity(0.3),
  //                             borderRadius: BorderRadius.circular(20)
                              
                              
  //                             ),
  //                             child: Image.asset("assets/image/dog9.png",height: 50,)),
  //                           )
  //                           ],
  //                         ),
                      
  //                 ),
  // ),
     
                      
               
               
  // //                                                       ],
  // //                                                       padding:
  // //                                                       EdgeInsets.all(
  // //                                                           5),
  // //                                                       shrinkWrap: true,
  // //                                                     ),
            
          
          
          
  //         ],),
       
        ]),));
  }
}