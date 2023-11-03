import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,  //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0), // 왼쪽 상단 모서리 radius
                    topRight: Radius.circular(30.0), // 오른쪽 상단 모서리 radius
                    bottomLeft: Radius.circular(30.0), // 왼쪽 상단 모서리 radius
                    bottomRight: Radius.circular(30.0), // 왼쪽 상단 모서리 radius
                  ),
                ),
                child: TabBar(

                  tabs: [
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        '매장컵',
                      ),
                    ),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        '개인컵',
                      ),
                    ),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        '일회용컵',
                      ),
                    ),
                  ],
                  indicator: BoxDecoration(

                    color: kAccentColor,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  controller: _tabController,
                ),
              ),

              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        color: Colors.grey[100],
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("-주문 후, 개인컵(355ml 이상, 텀블러 등)을 '음료 받는 곳'에 전달해 주세요. ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            Text("-개인컵은 다회용기(텀블러,머그 등)만 사용 가능하며 1회용기에는 음료 제공이 불가합니다. ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            Text("-개인컵을 선택한 경우 일회용 리드는 제공되지 않습니다.",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            Text("-개인컵이 전달되지 않거나 전달된 개인컵이 주문한 음료를 담기 어려울 경우(용량 미달,좁은 투입구 등) 주문이 거절될 수 있습니다.",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            Text("-차량에서 음료를 픽업하는 경우 개인컵 이용시에는 리드(뚜껑)을 파트너에게 함께 전달하여 주세요.",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                          ],
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        color: Colors.green[200],
                        alignment: Alignment.center,
                        child: Text(
                          'Tab3 View',
                          style: TextStyle(
                            fontSize: 30,
                          ),
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
    );
  }
}