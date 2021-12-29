import 'package:assignment/core/constants/color_constants.dart';
import 'package:assignment/core/helper/utils.dart';
import 'package:assignment/core/model/product_add_argument.dart';
import 'package:assignment/core/routing/routes.dart';
import 'package:assignment/core/viewmodel/product_list_view_model.dart';
import 'package:assignment/core/viewmodel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isList = true;
  List<String> _list = ['Product', 'Launch Date', 'Rating', 'launch Site'];
  ProductListview pc = Get.put(ProductListview());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Home",
          style: Utils.H5Bold16(color: ColorConstants.appBarTitleColor),
        ),
        backgroundColor: ColorConstants.appBarColor,
        actions: [
          PopupMenuButton(
            offset: const Offset(0.0, 60.0),
            icon: new Icon(Icons.sort, color: Colors.black),
            itemBuilder: (context) {
              return List.generate(_list.length, (index) {
                return PopupMenuItem(
                  child: Text(_list[index]),
                  onTap: () {
                    if (index == 0) {
                      pc.products
                          .sort((a, b) => a!.name!.compareTo(b!.name!));
                    } else if (index == 1) {
                      pc.products.sort((a, b) => DateFormat('dd-MM-yyyy')
                          .parse(a!.launchedAt!)
                          .compareTo(DateFormat('dd-MM-yyyy')
                          .parse(b!.launchedAt!)));
                    } else if (index == 2) {
                      pc.products
                          .sort((a, b) => b!.popularity!.compareTo(a!.popularity!));
                    } else {
                      pc.products.sort(
                              (a, b) => a!.launchSite!.compareTo(b!.launchSite!));
                    }
                  },
                );
              });
            },
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isList = !isList;
              });
            },
            icon: Icon(
              isList ? Icons.grid_view : Icons.list,
              color: ColorConstants.actionBarIconColor,
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth <= 600;
          return isList
              ? Obx((){
                return ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      color: Colors.white,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: constraints.maxWidth > 600
                                  ? Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(pc.products[index]!
                                                .name!),
                                          ),
                                          Expanded(
                                            child: Text(
                                              pc.products[index]!
                                                  .launchedAt!,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              pc.products[index]!
                                                  .launchSite!,
                                            ),
                                          ),
                                          Expanded(
                                            child: RatingBar.builder(
                                              updateOnDrag: false,
                                              ignoreGestures: true,
                                              initialRating:
                                              pc.products[index]!
                                                  .popularity!,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 2.0),
                                              itemBuilder: (context, _) =>
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                              itemSize:
                                              constraints.maxWidth <=
                                                  800
                                                  ? 16
                                                  : 20,
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                                  : Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          pc.products[index]!.name!,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          pc.products[index]!
                                              .launchedAt!,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          pc.products[index]!
                                              .launchSite!,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RatingBar.builder(
                                          initialRating: pc.products[index]!
                                              .popularity!,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          updateOnDrag: false,
                                          ignoreGestures: true,
                                          itemCount: 5,
                                          itemPadding:
                                          EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          itemBuilder: (context, _) =>
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 10,
                                              ),
                                          itemSize: isMobile ? 18 : 20,
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            _buildActionIcons(index: index)
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: pc.products.length,
                );
          })
              : Obx((){
                return GridView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8),
                  itemCount: pc.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    pc.products[index]!.name!,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    pc.products[index]!.launchedAt!,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    pc.products[index]!.launchSite!,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Expanded(
                                  child: RatingBar.builder(
                                    updateOnDrag: false,
                                    ignoreGestures: true,
                                    initialRating: pc.products[index]!.popularity!,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) =>
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 10,
                                        ),
                                    itemSize: isMobile ? 16 : 18,
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            _buildActionIcons(index: index)
                          ],
                        ),
                      ),
                    );
                  },
                );
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.AddProduct,
              arguments: ProductAddArgument(previousScreen: "home"));


          // Add your onPressed code here!
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  _buildActionIcons({required int index}) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.AddProduct,
                arguments: ProductAddArgument(
                    previousScreen: "home",
                    index: index,
                    productModel: pc.products[index]!));
          },
          child: Container(
            child: Icon(Icons.edit),
          ),
        ),
        SizedBox(  width: 30),
        GestureDetector(
          onTap: () {
            _showDeleteAlert(index: index);
          },
          child: Container(
            child: Icon(
              Icons.delete,
              color: ColorConstants.deleteIconColor,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Future<void> _showDeleteAlert({required int index}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: Row(
            children: [Expanded(child: Text('Do you really want to delete?'))],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                pc.products.removeAt(index);
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}