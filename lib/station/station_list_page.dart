import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final String stationType; // '출발역' 또는 '도착역' 을 받는 변수.
  final Function(String) onStationSelected; // 역 선택시 호출되는 콜백

  const StationListPage({
    super.key,
    required this.stationType,
    required this.onStationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> stations = [
      '수서', '동탄', '평택지제', '천안아산', '오송',
      '대전', '김천구미', '동대구', '경주', '울산', '부산',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(stationType), // '출발역' 또는 '도착역' 으로 앱바 타이틀 변경
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // 역 선택시 onStationSelected 호출
              onStationSelected(stations[index]);
              Navigator.pop(context); // 페이지을 닫고 결과를 반환
            },
            child: ListTile(
              title: Text(stations[index]),
            ),
          );
        },
      ),
    );
  }
}