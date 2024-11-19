import 'package:flutter/material.dart';
// 출발역, 도착역을 선택하는 페이지

class SeatPage extends StatelessWidget {
  const SeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('좌석 선택'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20), // 상하 패딩
        children: [
          // 출발역과 도착역
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '수서', // 출발역
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 30,
                ),
                Text(
                  '부산', // 도착역
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),

          // 좌석 상태
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // 선택됨
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 4),
                const Text('선택됨'),
                const SizedBox(width: 20), // 상태 간 간격
                // 선택 안됨
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 4),
                const Text('선택안됨'),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ABCD 레이블 및 좌석 리스트
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // ABCD 레이블
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SeatLabel('A'),
                    SeatLabel('B'),
                    SeatLabel('C'),
                    SeatLabel('D'),
                  ],
                ),
                const SizedBox(height: 8),

                // 좌석 리스트 (20행)
                for (var rowIndex = 0; rowIndex < 20; rowIndex++) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SeatRowNumber(rowIndex + 1), // 행 번호
                      const SizedBox(width: 4),
                      const SeatButton(), // A열 좌석
                      const SizedBox(width: 4),
                      const SeatButton(), // B열 좌석
                      const SizedBox(width: 4),
                      const SeatButton(), // C열 좌석
                      const SizedBox(width: 4),
                      const SeatButton(), // D열 좌석
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 예매 하기 버튼
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // 예매하기 버튼 클릭 시 동작
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  '예매 하기',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeatLabel extends StatelessWidget {
  final String label;
  const SeatLabel(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SeatRowNumber extends StatelessWidget {
  final int number;
  const SeatRowNumber(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      child: Text(
        '$number',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SeatButton extends StatelessWidget {
  const SeatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}