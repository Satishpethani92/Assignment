import 'package:assignment/core/constants/color_constants.dart';
import 'package:assignment/core/helper/utils.dart';
import 'package:assignment/core/model/product_add_argument.dart';
import 'package:assignment/core/viewmodel/add_product_view_model.dart';
import 'package:assignment/core/viewmodel/product_view_model.dart';
import 'package:assignment/ui/widget/my_button.dart';
import 'package:assignment/ui/widget/my_scroll_view.dart';
import 'package:assignment/ui/widget/my_textfield.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';

class AddProduct extends StatefulWidget {
  final ProductAddArgument? productAddArgument;

  const AddProduct(
    {
    Key? key,
    required this.productAddArgument
  });

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  ProductViewModel? productViewModel;
  AddProductViewModel? model;

  @override
  void dispose() {
    model!.nameController.clear();
    model!.launchSiteController.clear();

    model!.rating = 0;
    super.dispose();
  } // final ProductAddArgument? productAddArgument;

 /// _AddProductState(this.productAddArgument);
@override
  Widget build(BuildContext context) {
    productViewModel = Provider.of<ProductViewModel>(context);
    return BaseView<AddProductViewModel>(
      onModelReady: (model) {
        this.model = model;
        if (widget.productAddArgument!.productModel != null) {
          model.id = widget.productAddArgument!.index;
          model.nameController.text =
          widget.productAddArgument!.productModel!.name!;
          model.launchedAt.text = DateFormat("yyyy-MM-dd").format(
              DateFormat("dd-MM-yyyy")
                  .parse(widget.productAddArgument!.productModel!.launchedAt!));
          model.launchSiteController.text =
          widget.productAddArgument!.productModel!.launchSite!;
          model.rating = widget.productAddArgument!.productModel!.popularity!;
        }

      },
      builder: (context, model, child) {
        return MyScrollView(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorConstants.appBarColor,
            actions: [],
            iconTheme: IconThemeData(color: Colors.black),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width > 400
                      ? 400
                      : MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Form(
                      key: model.formKey,
                      child: Column(
                        children: [
                          Text('Add Product',
                              style: Utils.headerTextStyle),
                          const SizedBox(height: 10),
                          Text('Please enter all details for add product',
                              style: TextStyle(
                                  color: ColorConstants.black, fontSize: 12)),
                          const SizedBox(height: 70),
                          MyTextField(
                              controller: model.nameController,
                              hintText: "Product Name",
                              validator: (value) {
                                if (value == "") {
                                  return 'Please enter name';
                                }
                                return null;
                              },
                              prefix: Icons.drive_file_rename_outline),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: DateTimePicker(
                              initialDate:
                              widget.productAddArgument!.productModel !=
                                  null
                                  ? DateFormat("dd-MM-yyyy").parse(widget
                                  .productAddArgument!
                                  .productModel!
                                  .launchedAt!)
                                  : null,
                              controller: model.launchedAt,
                              type: DateTimePickerType.date,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              dateMask: 'dd-MM-yyyy',
                              validator: (value) {
                                if (value == "") {
                                  return 'Please select date';
                                }
                                return null;
                              },decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),

                              prefixIcon: Icon(Icons.event, color: Colors.black,)
                            ),

                            ),
                          ),

                          const SizedBox(height: 30),
                          MyTextField(
                              validator: (value) {
                                if (value == "") {
                                  return 'Please enter launch site';
                                }
                                return null;
                              },
                              controller: model.launchSiteController,
                              hintText: "Launch Site",
                              prefix: Icons.web_sharp),

                          const SizedBox(height: 30),
                          RatingBar.builder(
                            initialRating: model.rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                            EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemSize: 50,
                            onRatingUpdate: (rating) {
                              model.rating = rating;
                            },
                          ),
                          const SizedBox(height: 100),
                          GestureDetector(
                            onTap: () {
                              model.addProduct(
                                  productViewModel!,
                                  widget.productAddArgument!
                                      .productModel !=
                                      null);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 20, left: 20),
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorConstants.black),
                              child: Center(
                                  child:Text(
                                    widget.productAddArgument!.productModel !=
                                        null
                                        ? "Edit"
                                        : "Add",
                                    style: TextStyle(
                                        color: ColorConstants.white,
                                        fontSize: 18),
                                  )),
                            ),
                          ),
                          const SizedBox(height: 10),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Spacer()
            ],
          ),
        );
      },
    );
  }
}
