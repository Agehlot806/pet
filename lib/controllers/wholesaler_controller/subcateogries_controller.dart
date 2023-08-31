import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/models/wholesalerModel/wholeProductModel.dart';
import 'package:pet/models/wholesalerModel/wholesubModel.dart';

import 'package:pet/utils/api_helper.dart';
import 'package:pet/utils/constants.dart';

class WholeSubCategoryController extends GetxController{

 int? selectedIndex;
int? categoryids;
int? subid;
int? id;

@override
  void onInit() {
    super.onInit();

    init();
    // producttoys();
   
    }

  void addproduct(int id) {
    categoryids =id;
    update();
    print("cat${categoryids}");
  }

  //   void addsubcategory(int id) {
  //   subid =id;
  //   update();
  // }


   void updateSelectedIndex(int id) {
    selectedIndex = id;
    update();
    print("subindex${selectedIndex}");
  }


 String getUserSubCategoryUrl =
      '${Constants.BASE_URL}${Constants.API_V1_PATH}${Constants.GET_USER_SUBCATEGORY}';
  WholeSubModel? wholesubmodel;
    // UserPropertiesModel? userPropertiesModelorignal;
  bool propertysubloaded = false;

 String getUserproductUrl =
      '${Constants.GET_USER_SUBPRODUCT}';
  WholeProductModel? wholeProductModel;
    // UserPropertiesModel? userPropertiesModelorignal;
  bool productLoaded = false;



  


  void init() async {


     try {

         wholesubmodel = WholeSubModel.fromJson(
          await ApiHelper.getApi(getUserSubCategoryUrl));
      print(wholesubmodel);
      propertysubloaded = true;
      update();
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      }
      //product

     

    }
  
void productinit() async{

  
     try {

         wholeProductModel = WholeProductModel.fromJson(
          await ApiHelper.getApi(getUserproductUrl+"${categoryids}/${selectedIndex}"));
      print('=========**${getUserproductUrl}${categoryids}/${selectedIndex}');
      productLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
  }
}





  
//  String getUsertoyUrl =
//       '${Constants.GET_USER_TOY}';
//   ToyModel? usertoyModel;
//     // UserPropertiesModel? userPropertiesModelorignal;
//   bool toyloaded = false;

// void producttoys() async{
//      try {

//          usertoyModel = ToyModel.fromJson(
//           await ApiHelper.getApi(getUsertoyUrl+"sub_category=6&category1=1&category2=2"));
//       print('TOYYYY=========>>${getUsertoyUrl+"sub_category=6&category1=1&category2=2"}');
//       toyloaded = true;
//       update();
//     } catch (e) {
//       print('Error: $e');
//       Get.snackbar(
//         'Error',
//         'An error occurred: $e',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//   }
// }

} 