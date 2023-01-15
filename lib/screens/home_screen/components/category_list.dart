import 'package:assign/app/app_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controllers/data_controller.dart';

class HomeCategoryList extends StatefulWidget {
  const HomeCategoryList({Key key}) : super(key: key);

  @override
  State<HomeCategoryList> createState() => _HomeCategoryListState();
}

class _HomeCategoryListState extends State<HomeCategoryList> {
  int currentSelected = 0;
  final dataController = Get.find<DataControllers>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataControllers>(builder: (_context) {
      return SliverToBoxAdapter(
        child: SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: dataController.categories.length,
            itemBuilder: (ctx, i) {
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () {
                    if (dataController.category ==
                        dataController.categories[i]) {
                      dataController.unselectCategory();
                    } else {
                      dataController.category = dataController.categories[i];
                      dataController.getCategory();
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5),
                      Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 90,
                        decoration: BoxDecoration(
                          color: dataController.categories[i] ==
                                  dataController.category
                              ? AppColors.grey
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          dataController.categories[i],
                          style: TextStyle(
                            color: dataController.categories[i] ==
                                    dataController.category
                                ? Colors.white
                                : Colors.black,
                            fontWeight: dataController.categories[i] ==
                                    dataController.category
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
