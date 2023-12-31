import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/category.dart';
import 'package:project_coffee/data/model/promotion.dart';
import 'package:project_coffee/ui/pages/home_page/promotion_list_page/promotion_list_page_view_model.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';

import '../../order_page/category_list_page/category_list_page_view_model.dart';

class ShopPageBody extends StatefulWidget {
  const ShopPageBody({Key? key}) : super(key: key);

  @override
  _ShopPageBodyState createState() => _ShopPageBodyState();
}

class _ShopPageBodyState extends State<ShopPageBody> {
  final PageController _pageController = PageController();
  int _currentPage = 0; // 현재 페이지 인덱스

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        PromotionListModel? promotionModel = ref.watch(promotionListProvider);
        List<Promotion> promotionList = [];
        dynamic? categoryModel = ref.watch(CategoryListProvider);
        List<Category> categoryList = categoryModel?.categoryList ?? [];

        final codeItems = categoryList.where((item) => item.code == 2).toList();
        if (promotionModel != null) {
          promotionList = promotionModel?.promotionList ?? [];
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              ShopAppBar(),
              ScreenPromotion(promotionList: promotionList),
              AllProducts(categoryList: codeItems),
              bestItems(context),
              newProducts(context),
            ],
          ),
        );
      },
    );
  }

  SliverToBoxAdapter newProducts(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textTitle1("New Products"),
                    Icon(Icons.arrow_forward_ios_outlined, color: Colors.black),
                  ],
                ),
              ),
              SizedBox(height: gap_s),
              Container(
                height: 400, // 이미지 높이 조절
                child: PageView(
                  controller: _pageController, // 페이지 컨트롤러 지정
                  onPageChanged: (int page) {
                    // 페이지 변경 시 호출되며 현재 페이지 업데이트
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: List.generate(2, (pageIndex) {
                    return Column(
                      children: List.generate(2, (rowIndex) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(2, (columnIndex) {
                            final imageIndex =
                                pageIndex * 4 + rowIndex * 2 + columnIndex;
                            final assetPath =
                                'assets/shopNewProduct_${imageIndex + 1}.png'; // 동적으로 이미지 경로 생성
                            return Column(
                              children: [
                                Image(
                                  image: AssetImage(
                                      assetPath), // assetName을 동적으로 설정
                                  width: 170,
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: gap_s),
                              ],
                            );
                          }),
                        );
                      }),
                    );
                  }),
                ),
              ),
              // 페이지 인디케이터 표시
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(2, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: _currentPage == index ? 12.0 : 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 0.8),
                      color:
                          _currentPage == index ? Colors.black87 : Colors.white,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter bestItems(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textTitle1("Best Items"),
                    Icon(Icons.arrow_forward_ios_outlined, color: Colors.black),
                  ],
                ),
              ),
              SizedBox(height: gap_s),
              Container(
                height: 400, // 이미지 높이 조절
                child: PageView(
                  controller: _pageController, // 페이지 컨트롤러 지정
                  onPageChanged: (int page) {
                    // 페이지 변경 시 호출되며 현재 페이지 업데이트
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: List.generate(2, (pageIndex) {
                    return Column(
                      children: List.generate(2, (rowIndex) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(2, (columnIndex) {
                            final imageIndex =
                                pageIndex * 4 + rowIndex * 2 + columnIndex;
                            final assetPath =
                                'assets/shopBestItem_${imageIndex + 1}.png'; // 동적으로 이미지 경로 생성
                            return Column(
                              children: [
                                Image(
                                  image: AssetImage(
                                      assetPath), // assetName을 동적으로 설정
                                  width: 170,
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: gap_s),
                              ],
                            );
                          }),
                        );
                      }),
                    );
                  }),
                ),
              ),
              // 페이지 인디케이터 표시
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(2, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: _currentPage == index ? 12.0 : 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 0.8),
                      color:
                          _currentPage == index ? Colors.black87 : Colors.white,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllProducts extends StatelessWidget {
  List<Category> categoryList;
  AllProducts({
    required this.categoryList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textTitle1("All Products"),
                    Icon(Icons.arrow_forward_ios_outlined, color: Colors.black),
                  ],
                ),
              ),
              Container(
                height: 150, // 이미지 높이 조절
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // 가로 스크롤 활성화
                  itemCount: 6, // 이미지 개수
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
                      },
                      child: Row(
                        children: [
                          Column(
                            children: [
                              ClipOval(
                                child: Image(
                                  image: NetworkImage(
                                      "${categoryList[index].picUrl}"),
                                  width: 90,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: gap_s),
                              textBody1("${categoryList[index].name}"),
                            ],
                          ),
                          SizedBox(width: gap_m),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenPromotion extends StatelessWidget {
  List<Promotion> promotionList;
  ScreenPromotion({
    required this.promotionList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 200, // 이미지 높이 조절
        child: ListView.builder(
          scrollDirection: Axis.horizontal, // 가로 스크롤 활성화
          itemCount: promotionList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image:
                        NetworkImage("${promotionList[index].smallThumbnail}"),
                    width: 350, // 이미지 너비 조절
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ShopAppBar extends StatelessWidget {
  const ShopAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          "Starbucks Online Store",
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: false,
        titlePadding: EdgeInsets.only(left: 16.0, bottom: 20),
      ),
      centerTitle: false,
    );
  }
}
