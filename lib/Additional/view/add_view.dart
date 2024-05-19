import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemi/Additional/controller/add_controller.dart';
import 'package:gemi/Additional/globals/additional_group_cards.dart';
import 'package:gemi/Authentications/Auth/Auth_view/auth_view.dart';
import 'package:get/get.dart';

class Additional extends StatelessWidget {
  const Additional({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddController addController = Get.put(AddController());

    //  AddController addController = Get.find();
    AddGroupEdit addGroupEdit = Get.find();
    return Scaffold(
        key: addController.scaffoldkey,
        body:
            SafeArea(child: GetBuilder<AddController>(builder: (addController) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    const Center(
                      child: Text(
                        'Additional Product',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
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
                    Get.bottomSheet(
                        enterBottomSheetDuration: Duration(milliseconds: 500),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  height: 8,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Color(0xffC1C1C1)),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text('Additional Group'),
                              SizedBox(
                                height: 4,
                              ),
                              Form(
                                  key: addController.formkey,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.words,
                                    focusNode: addController.addFocusnode,
                                    controller:
                                        addController.addBootomSheetController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color(0xff0779E4))),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color(0xff0779E4))),
                                        hintText: 'Enter Group Name',
                                        hintStyle: TextStyle(
                                            color: Color(0xffC1C1C1),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                        contentPadding: EdgeInsets.all(12)),
                                    onChanged: (value) {
                                      if (value.length > 8) {
                                        addController.activate();
                                      }
                                    },
                                  )),
                              Text('e.g. Food,Drink, etc.'),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                  onTap: () async {
                                    await addController.postData();
                                    print('sipdah');
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        gradient: const LinearGradient(colors: [
                                          Color(0xff0779E4),
                                          Color(0xff51A1EC)
                                        ]),
                                        color: Color(0xffC1c1c1)),
                                    child: const Center(
                                      child: Text(
                                        'Create',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontWeight: FontWeight.w500,
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
                        FocusScope.of(addController.scaffoldkey.currentContext!)
                            .requestFocus(FocusNode());
                      },
                    );
                  },
                  child: SizedBox(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 81),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Center(
                              child: Text(
                            'Add Additional Group',
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
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: addController
                          .responseAdditionalGroupModel?.data?.length ??
                      0,
                  itemBuilder: (context, index) {
                    return CustomListItem(
                      dataAdditional: addController
                          .responseAdditionalGroupModel?.data?[index],
                    );
                  },
                ))
              ],
            ),
          );
        })));
  }
}
