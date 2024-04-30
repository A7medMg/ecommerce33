import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shoppapp/conttrolar/HomeController.dart';

import '../../../core/consstans/color/colorapp.dart';
import '../../../core/functions/translationDatabase.dart';
import '../../../data/model/CategoriesModel.dart';
import '../../../linkapi.dart';

class CustomListCategories extends GetView<HomeControllerImp> {
  const CustomListCategories({super.key});

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
class Categorise extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int index;
  const Categorise({super.key, required this.categoriesModel,required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToItems(controller.categories,index ! ,categoriesModel.categoriesId!.toString());
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colorapp.thirdColor,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 70,
            child: SvgPicture.network(
              "${AppLinkApi.staticImageCategories}/${categoriesModel.categoriesImage}",
              color: Colorapp.secondColor,
            ),
          ),
          Text(
            "${translateDatabase (categoriesModel.categoriesNameAr,categoriesModel.categoriesName)}",
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
