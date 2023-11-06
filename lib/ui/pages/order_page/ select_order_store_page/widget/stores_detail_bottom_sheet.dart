import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/store/order_store.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';
import 'package:project_coffee/ui/pages/order_page/beverage_detail_page/widget/beverage_detail_cart_bottom_sheet.dart';
import '../../../../../data/model/stroes.dart';

class StoresDetailBottomSheet extends StatefulWidget {
  Stores stores;

  StoresDetailBottomSheet({required this.stores});

  @override
  State<StoresDetailBottomSheet> createState() =>
      StoresDetailBottomSheetState();
}

class StoresDetailBottomSheetState extends State<StoresDetailBottomSheet> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: kAccentColor,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage(selectedIndex: 2,)));

                },
              child: Text(
                "매장 내 직접 수령",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ],
      body: Container(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: NetworkImage("${widget.stores.storePicUrl}"),
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${widget.stores.storeName}"),
                      Text("${widget.stores.address}"),
                      Divider(),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(CupertinoIcons.clock),
                              SizedBox(
                                width: 10,
                              ),
                              Text("사이렌 오더 운영 시간"),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 35,
                              ),
                              Text(
                                "ㄴ  카페 ${widget.stores.openTime} ~ ${widget.stores.closeTime}",
                              )
                            ],
                          )
                        ],
                      ),
                      Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("오시는 길"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("${widget.stores.directions}"),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
