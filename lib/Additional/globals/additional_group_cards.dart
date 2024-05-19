import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gemi/Additional/controller/add_controller.dart';
import 'package:gemi/Additional/model/additional_group_model.dart';
import 'package:gemi/Additional_item/view/additional_item_view.dart';
import 'package:get/get.dart';

class CustomListItem extends StatelessWidget {
  AddController addController = Get.find();

  final AdditionalGroupModel? dataAdditional;

  CustomListItem({
    Key? key,
    this.dataAdditional,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 28),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  color: Color(0xff000000).withOpacity(0.04),
                  spreadRadius: 0,
                  blurStyle: BlurStyle.outer,
                  offset: Offset(0, 20)),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(dataAdditional?.name ?? '',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                Text('${dataAdditional?.additionalCount} items',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Color(0xff9E9E9E)))
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(AdditionalItem(
                        idGroupAdditional: dataAdditional?.id ?? 0,
                        nameGroupAdditional: dataAdditional?.name ?? 'loading',
                      ));
                    },
                    child: Text('Edit',
                        style: TextStyle(
                          color: Color(0xff0779E4),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      addController.deleteData(id: dataAdditional?.id ?? 0);
                      // Get.dialog(
                      //     useSafeArea: true,
                      //     AlertDialog(
                      //       content: Container(
                      //         padding: EdgeInsets.symmetric(
                      //             horizontal: 32, vertical: 24),
                      //         decoration: BoxDecoration(
                      //             color: Colors.white,
                      //             borderRadius: BorderRadius.circular(12)),
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: [
                      //             Text('Delete $title ?'),
                      //             Image.asset('asset/image/foto.png'),
                      //             Text(
                      //                 'Are you sure you want to delete $title?'),
                      //             Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 GestureDetector(
                      //                   onTap: () {},
                      //                   child: Container(
                      //                     padding: EdgeInsets.symmetric(
                      //                         horizontal: 29.75, vertical: 12),
                      //                     decoration: BoxDecoration(
                      //                         borderRadius:
                      //                             BorderRadius.circular(100),
                      //                         border: Border.all(
                      //                             color: Color(0xffEAEAEA),
                      //                             width: 1)),
                      //                     child: Text(
                      //                       'Cancel',
                      //                       style: TextStyle(
                      //                           fontSize: 16,
                      //                           fontWeight: FontWeight.w500,
                      //                           color: Color(0xff5D5D5D)),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 GestureDetector(
                      //                   onTap: () {},
                      //                   child: Container(
                      //                     padding: EdgeInsets.symmetric(
                      //                         horizontal: 29.75, vertical: 12),
                      //                     decoration: BoxDecoration(
                      //                         color: Color(0xffF95320),
                      //                         borderRadius:
                      //                             BorderRadius.circular(100),
                      //                         border: Border.all(
                      //                             color: Color(0xffEAEAEA),
                      //                             width: 1)),
                      //                     child: Text(
                      //                       'Delete',
                      //                       style: TextStyle(
                      //                           fontSize: 16,
                      //                           fontWeight: FontWeight.w500,
                      //                           color: Color(0xffFFFFFF)),
                      //                     ),
                      //                   ),
                      //                 )
                      //               ],
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //     ));
                    },
                    child: Text('Delete',
                        style: TextStyle(
                          color: Color(0xffE13A06),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )),
                  )
                ],
              )
            ],
          )
          //  ListTile(
          //   title: Text(
          //     title,
          //     style: TextStyle(fontWeight: FontWeight.w500),
          //   ),
          //   subtitle: Text(
          //     '$itemCount Items',
          //     style: TextStyle(
          //       fontWeight: FontWeight.w500,
          //       color: Color(0xff9E9E9E),
          //     ),
          //   ),
          //   trailing: GestureDetector(
          //     onTap: onTap,
          //     child: Text(
          //       'Edit',
          //       style: TextStyle(
          //         color: Color(0xff0779E4),
          //         fontSize: 14,
          //         fontWeight: FontWeight.w500,
          //       ),
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
