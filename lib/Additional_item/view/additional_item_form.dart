// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:gemi/Additional_item/controller/additional_item_controller.dart';

class AdditemForm extends StatelessWidget {
  int id;
  AdditemForm({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdditionalItemController additionalItemController = Get.find();
    return Scaffold(
      body: GetBuilder<AdditionalItemController>(
        builder: (controller) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Color(0xff51A1EC).withOpacity(0.2))),
                            child: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Color(0xff0779E4),
                                )),
                          ),
                          Center(
                            child: Text('Add Item',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Add an item product according to your additional product',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff9E9E9E)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: additionalItemController.addformkey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Product Name',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff9E9E9E)),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              TextFormField(
                                textCapitalization: TextCapitalization.words,
                                focusNode:
                                    additionalItemController.nameFocusnode,
                                controller: additionalItemController
                                    .additionalNameController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xff0779E4))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xff0779E4))),
                                    hintText: 'Enter Product Name',
                                    hintStyle: TextStyle(
                                        color: Color(0xffC1C1C1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    contentPadding: EdgeInsets.all(12)),
                                onChanged: (value) {},
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Price',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff9E9E9E)),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                textCapitalization: TextCapitalization.words,
                                focusNode:
                                    additionalItemController.priceFocusnode,
                                controller: additionalItemController
                                    .additionalPriceController,
                                decoration: InputDecoration(
                                    prefix: Text(
                                      'Rp. ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff0A0A0A)),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xff0779E4))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xff0779E4))),
                                    hintText: 'Rp. 0',
                                    hintStyle: TextStyle(
                                        color: Color(0xffC1C1C1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    contentPadding: EdgeInsets.all(12)),
                                onChanged: (value) {},
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Stock',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff9E9E9E)),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              TextFormField(
                                textCapitalization: TextCapitalization.words,
                                focusNode:
                                    additionalItemController.stockFocusnode,
                                controller: additionalItemController
                                    .additionalStockController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xff0779E4))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xff0779E4))),
                                    hintText: 'Enter Product Stock',
                                    hintStyle: TextStyle(
                                        color: Color(0xffC1C1C1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    contentPadding: EdgeInsets.all(12)),
                                onChanged: (value) {},
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ]),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                              colors: [Color(0xff0779E4), Color(0xff51A1EC)]),
                          color: Color(0xffC1c1c1)),
                      child: const Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
