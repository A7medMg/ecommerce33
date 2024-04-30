import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/ItemsController.dart';

import '../../../core/consstans/color/colorapp.dart';
import '../../../core/functions/translationDatabase.dart';
import '../../../data/model/CategoriesModel.dart';


class CustomListCategoriesItems extends GetView<ItemsControllerImp> {
  const CustomListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, i) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (context, i) {
          return Categorise(
            index:i,
            categoriesModel: CategoriesModel.fromJson(controller.categories[i]),);
        },
        itemCount: controller.categories.length,
      ),
    );
  }
}
class Categorise extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int index;
  const Categorise({super.key, required this.categoriesModel,required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.changeSelectedCate(index!,categoriesModel.categoriesId!.toString());
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(builder: (controller)=>Container(
            padding: EdgeInsets.only(bottom: 9,right: 10,left: 10),
            decoration:controller.selectedCate==index ? BoxDecoration(
                border:Border(bottom: BorderSide(width: 3,color: Colorapp.primaryColor))
            ):null,
            child: Text(
              "${translateDatabase(categoriesModel.categoriesNameAr,categoriesModel.categoriesName)}",
              style:  TextStyle(fontSize: 20,color: Colors.grey[600]),
            ),
          ),
          )
        ],
      ),
    );
  }
}
