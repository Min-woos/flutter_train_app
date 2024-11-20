import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat/seat_page.dart';
import 'package:flutter_train_app/station/station_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? departureStation; // 출발역 선택 상태
  String? arrivalStation; // 도착역 선택 상태

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기차 예매'),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 200), // 상단 여백
            // 출발역 및 도착역 선택 상자
            Container(
              height: 200,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 출발역
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        // StationListPage로 이동 후 결과 반환
                        final result = await Navigator.push<String>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StationListPage(
                              stationType: '출발역',
                              onStationSelected: (station) {
                                setState(() {
                                  departureStation = station;
                                });
                              },
                            ),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '출발역',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            departureStation ?? '선택',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 세로선
                  Container(
                    width: 2, // 너비 2 고정
                    height: 50, // 높이 50 고정
                    color: Colors.grey[400],
                  ),
                  // 도착역
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        // StationListPage로 이동 후 결과 반환
                        final result = await Navigator.push<String>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StationListPage(
                              stationType: '도착역',
                              onStationSelected: (station) {
                                setState(() {
                                  arrivalStation = station;
                                });
                              },
                            ),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '도착역',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            arrivalStation ?? '선택',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // 좌석 선택 버튼
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // 출발역과 도착역이 모두 선택된 경우만 SeatPage로 이동
                  if (departureStation != null && arrivalStation != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SeatPage(),
                        settings: RouteSettings(
                          arguments: {
                            'startStation' : departureStation,
                            'endStation': arrivalStation,
                          },
                        ),
                      ),
                    );
                  } else {
                    // 선택되지 않았을 경우 경고 메시지 표시
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('출발역과 도착역을 모두 선택해주세요!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    '좌석 선택',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}