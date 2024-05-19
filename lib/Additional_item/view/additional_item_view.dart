// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemi/Additional_item/view/additional_item_form.dart';
import 'package:get/get.dart';

import 'package:gemi/Additional/controller/add_controller.dart';
import 'package:gemi/Additional/model/additional_group_model.dart';
import 'package:gemi/Additional_item/controller/additional_item_controller.dart';

class AdditionalItem extends StatefulWidget {
  final int idGroupAdditional;
  final String nameGroupAdditional;

  AdditionalItem({
    Key? key,
    required this.idGroupAdditional,
    required this.nameGroupAdditional,
  }) : super(key: key);

  @override
  State<AdditionalItem> createState() => _AdditionalItemState();
}

class _AdditionalItemState extends State<AdditionalItem> {
  AdditionalItemController additionalItemController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AddController addController = Get.find();
    return Scaffold(
        key: additionalItemController.scaffoldkey,
        body: SafeArea(
            child: GetBuilder<AdditionalItemController>(initState: (state) {
          additionalItemController.getAdditem(widget.idGroupAdditional);
        }, builder: (additionalItem) {
          return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          Color(0xff51A1EC).withOpacity(0.2))),
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
                              child: Text(
                                widget.nameGroupAdditional,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.bottomSheet(
                                    enterBottomSheetDuration:
                                        Duration(milliseconds: 500),
                                    enableDrag: true,
                                    isDismissible: true,
                                    Container(
                                      width: Get.width,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Container(
                                              height: 8,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  color: Color(0xffC1C1C1)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Text('Edit Group Name'),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Form(
                                              key: addController.formkey,
                                              child: TextFormField(
                                                textCapitalization:
                                                    TextCapitalization.words,
                                                focusNode:
                                                    addController.addFocusnode,
                                                controller: addController
                                                    .addEditController,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                15),
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Color(
                                                                0xff0779E4))),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Color(
                                                                0xff0779E4))),
                                                    hintText: 'Edit Group Name',
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Color(0xffC1C1C1),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    contentPadding:
                                                        EdgeInsets.all(12)),
                                                onChanged: (value) {},
                                              )),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          GestureDetector(
                                              onTap: () async {
                                                await addController.patchData(
                                                    widget.idGroupAdditional);

                                                print('sipdah');
                                                Get.back();
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    gradient:
                                                        const LinearGradient(
                                                            colors: [
                                                          Color(0xff0779E4),
                                                          Color(0xff51A1EC)
                                                        ]),
                                                    color: Color(0xffC1c1c1)),
                                                child: const Center(
                                                  child: Text(
                                                    'Apply',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffffffff),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ));
                                Future.delayed(
                                  Duration(milliseconds: 200),
                                  () {
                                    FocusScope.of(additionalItem
                                            .scaffoldkey.currentContext!)
                                        .requestFocus(FocusNode());
                                  },
                                );
                              },
                              child: Text('Edit'),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Form(
                            child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            suffixIconConstraints:
                                BoxConstraints(maxHeight: 20, maxWidth: 32),
                            suffixIcon: GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: SvgPicture.asset(
                                  'asset/icon/bararrowup.svg',
                                  colorFilter: ColorFilter.mode(
                                      Color(0xff0779E4), BlendMode.srcIn),
                                ),
                              ),
                            ),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                                color: Color(0xffC1C1C1),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            fillColor: Color.fromARGB(163, 248, 248, 248),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xff9E9E9E),
                            ),
                          ),
                        )),
                        SizedBox(
                          height: 24,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(AdditemForm(id: widget.idGroupAdditional));
                          },
                          child: SizedBox(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 81),
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Center(
                                      child: Text(
                                    'Add item',
                                    style: TextStyle(
                                        color: Color(0xff0779E4),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  )),
                                  Icon(
                                    Icons.add,
                                    size: 16,
                                    color: Color(0xff0779E4),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ]),
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
                          'Apply',
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ));
        })));
  }
}
