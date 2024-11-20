import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat/select_seat.dart';

class SeatPage extends StatefulWidget {
  const SeatPage({super.key});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  String? _selectedSeat; // 선택된 좌석 정보 저장

  void _updateSelectedSeat(String seat) {
    setState(() {
      _selectedSeat = seat;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 전달받은 arguments를 Map으로 캐스팅
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    final startStation = arguments?['startStation'] ?? '출발역';
    final endStation = arguments?['endStation'] ?? '도착역';

    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              station(startStation, endStation), // 전달받은 데이터 사용
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    label(Colors.purple, '선택됨'),
                    SizedBox(width: 20),
                    label(Colors.grey[300]!, '선택안됨'),
                  ],
                ),
              ),
              // SelectSeat 추가
              Expanded(
                child: SelectSeat(onSeatSelected: _updateSelectedSeat),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_selectedSeat == null) {
                    _showAlert('좌석을 선택하세요.');
                  } else {
                    _showAlert('선택한 좌석: $_selectedSeat');
                  }
                },
                child: Text('예매 하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('예매 확인'),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context); // 다이얼로그 닫기
              },
              child: Text(
                '취소',
                style: TextStyle(color: Colors.red), // 빨간색 텍스트
              ),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context); // 다이얼로그 닫기
                Navigator.pop(context); // 추가 동작 (필요에 따라 변경 가능)
              },
              child: Text(
                '확인',
                style: TextStyle(color: Colors.blue), // 파란색 텍스트
              ),
            ),
          ],
        );
      },
    );
  }

  Row label(Color color, String select) {
    return Row(
      children: [
        SizedBox.square(
          dimension: 24,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        SizedBox(width: 4),
        Text(select),
      ],
    );
  }

  Row station(String startStation, String endStation) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        selectedStation(startStation), // 출발역 정보
        Icon(
          Icons.arrow_circle_right_outlined,
          size: 30,
        ),
        selectedStation(endStation), // 도착역 정보
      ],
    );
  }

  Text selectedStation(String stationName) {
    return Text(
      stationName,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.purple,
        fontSize: 30,
      ),
    );
  }
}