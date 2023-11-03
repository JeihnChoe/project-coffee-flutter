import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';

class HomeMainCouponPageBody extends StatefulWidget {
  const HomeMainCouponPageBody({super.key});

  @override
  _CouponPageBodyState createState() => _CouponPageBodyState();
}

class _CouponPageBodyState extends State<HomeMainCouponPageBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CouponAppbar(),
        SliverToBoxAdapter(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // color: Colors.white,
                  child: TabBar(
                    controller: _tabController,
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    indicatorColor: kAccentColor,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        child: Container(
                          color: _tabController.index == 0
                              ? kAccentColor
                              : Colors.white,
                          child: Text(
                            "사용가능 쿠폰",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          color: _tabController.index == 1
                              ? kAccentColor
                              : Colors.white,
                          child: Text(
                            "쿠폰 히스토리",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CouponAppbar extends StatelessWidget {
  const CouponAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          },
          icon: Icon(CupertinoIcons.back),
          color: Colors.black54),
      snap: false,
      title: Text(
        "쿠폰",
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
            icon: Icon(CupertinoIcons.add_circled),
            color: Colors.black54),
      ],
    );
  }
}
