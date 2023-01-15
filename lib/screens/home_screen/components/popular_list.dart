import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/data_controller.dart';
import '../../detail_screen/detail_screen.dart';

class HomePopularList extends StatefulWidget {
  const HomePopularList({Key key}) : super(key: key);

  @override
  State<HomePopularList> createState() => _HomePopularListState();
}

class _HomePopularListState extends State<HomePopularList> {
  final dataController = Get.find<DataControllers>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataControllers>(builder: (_context) {
      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            childAspectRatio: .7,
          ),
          delegate: SliverChildBuilderDelegate(
            (ctx, i) {
              return GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => DetailScreen(
                          data: dataController.loadedData[i],
                        )),
                  ),
                ),
                child: Card(
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Hero(
                          tag: dataController.loadedData[i].pId,
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Colors.black,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: AssetImage("assets/pictures/" +
                                    dataController.loadedData[i].pName +
                                    ".jpeg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(dataController.loadedData[i].pName),
                                Text(
                                  '\$${dataController.loadedData[i].pCost}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                // setState(() {
                                //   popularList[i].favorite =
                                //       !popularList[i].favorite;
                                // });
                              },
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: dataController.loadedData.length,
          ),
        ),
      );
    });
  }
}

