import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Property
  final int _minDanNum = 2;
  final int _maxDanNum = 9;
  final int _minMultiNum = 1;
  final int _maxMultiNum = 9;
  //late 는 초기화를 나중으로 미룸
  late List<int> _danNumList; //구구단 번호 리스트
  late int _selectedItem;    //선택된 아이템 인덱스

  @override
  void initState() { //페이지가 새로 생성 될때 무조건 1번 사용 됨
    super.initState();

    _danNumList = List.generate(_maxDanNum-1, (index) => index + _minDanNum);
    _selectedItem = 0;
  }
  
  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("${_danNumList[_selectedItem]}단"),
        backgroundColor: Colors.blue, // AppBar 배경색
        foregroundColor: Colors.white, // AppBar 글자색
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(" 구구단 단 선택", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 300,
                child: CupertinoPicker(
                  itemExtent: 50, //각 아이템 높이 
                  looping: true, //무한 루프
                  backgroundColor: Colors.grey[200],
                  onSelectedItemChanged: (int index){
                    _selectedItem = index;
                    setState(() {});
                  },
                  scrollController: FixedExtentScrollController(initialItem: _selectedItem),
                  children: 
                    List<Widget>.generate(_danNumList.length, (index){
                      return Center(
                        child: Text(
                          '${_danNumList[index]} 단',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      );
                    }
                )
              ),
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.grey[300],
                width: 200,
                height: 250,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      _returnCenterTextWidgetGugudan(_danNumList[_selectedItem]),
                    ],
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }


  //--------Functions ------------
  Center _returnCenterTextWidgetGugudan(int danNum){ //구구단 Text위젯 출력 함수
    String result = '';
    for(int i=_minMultiNum; i<=_maxMultiNum; i++){
      // print('$danNum x $i = ${danNum * i}');
      result += i!=_maxMultiNum ?'$danNum x $i = ${danNum * i}\n' : '$danNum x $i = ${danNum * i}';
    }
    return Center(
      child: Text(
        result,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)
      ),   
    );
  }

  

  //------------------------------
}