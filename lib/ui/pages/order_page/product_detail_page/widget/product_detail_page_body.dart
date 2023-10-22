import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/mock/product.dart';
import 'package:project_coffee/ui/pages/order_page/product_detail_page/product_detail_page_view_model.dart';

class ProductDetailBody extends ConsumerWidget {
  const ProductDetailBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductDetailModel? model = ref.watch(ProductDetailProvider);
    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      Product product = model.product;
      return CustomScrollView(
        slivers: [
          _appBar(),
          _body(product),
        ],
      );
    }
  }

  Widget _body(Product product) {
    return SliverPadding(
      padding: EdgeInsets.all(16.0), // 패딩 설정
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textTitle1("${product.productName}"),
            textBody2("${product.productEngName}"),
            SizedBox(height: 10),
            textBody1("${product.description}"),
            SizedBox(height: 10),
            textTitle1("${product.productPrice}원"),
            SizedBox(height: 10),
            // if (product.isIceOnly)
            Row(
              children: [
                Expanded(
                  child: CustomOutlineButton("ICED ONLY", Color(0XFF1D77DE)),
                )
              ],
            ),
            // else
            // Row(
            // children: [
            // Expanded(child: CustomOutlineButton("ICE", kActiveColor1)),
            // Expanded(child: CustomOutlineButton("HOT", kActiveColor2)),
            // ],
            // ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.grey[100],
              child: textBody3("${product.description}"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Divider(
                color: Colors.grey, // 수평선의 색상
                thickness: 1.0, // 수평선의 두께
              ),
            ),
            Info(),
            Allergy(product),
          ],
        ),
      ),
    );
  }

  Widget Info() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: Text("제품 영양 정보",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  Widget Allergy(Product product) {
    if (product.productAllergy == null) {
      return Container();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: Text("알레르기 유발 요인",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ],
      );
    }
  }

  Widget _appBar() {
    return SliverAppBar(
      pinned: true,
      //고정
      elevation: 0.0,
      // leading: IconButton(
      //     onPressed: () {s
      //       Navigator.pop(mContext!);
      //     },
      //     icon: Icon(Icons.arrow_back_ios)),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.share)),
        SizedBox(
          width: 16,
        )
      ],
      //오른쪽에서 나타남
      iconTheme: IconThemeData(color: Colors.white),
      expandedHeight: 300,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final bool isCollapsed = constraints.maxHeight <= 98;
          print("kToolbarHeight : $kToolbarHeight");
          print("constraints.maxHeight : ${constraints.maxHeight}");
          return FlexibleSpaceBar(
            title: isCollapsed
                ? Text(
                    '${product.productName}',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )
                : null,
            background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/${product.image}"),
                    fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  String text;
  Color mColor;
  CustomOutlineButton(
    this.text,
    this.mColor, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Text(
        "${text}",
        style: TextStyle(color: mColor),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
