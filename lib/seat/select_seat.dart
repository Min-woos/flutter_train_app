import 'package:flutter/material.dart';

class SelectSeat extends StatefulWidget {
  final ValueChanged<String> onSeatSelected;

  const SelectSeat({super.key, required this.onSeatSelected});

  @override
  State<SelectSeat> createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  final List<bool> _selectedSeats = List.generate(80, (index) => false);

  void toggleSeat(int index) {
    setState(() {
      for (int i = 0; i < _selectedSeats.length; i++) {
        _selectedSeats[i] = false; // 다른 좌석 선택 해제
      }
      _selectedSeats[index] = true;

      // 선택된 좌석 정보 전달
      final rowNumber = index ~/ 4 + 1;
      final columnLetter = seatAlphabetLabel(index % 4);
      widget.onSeatSelected('$rowNumber - $columnLetter');
    });
  }

  String seatAlphabetLabel(int columnIndex) {
    switch (columnIndex) {
      case 0:
        return 'A';
      case 1:
        return 'B';
      case 2:
        return 'C';
      case 3:
        return 'D';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 21,
      itemBuilder: (context, index) {
        if (index == 0) {
          return seatAlphabet();
        } else {
          return seatRow(index);
        }
      },
    );
  }

  Row seatAlphabet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ['A', 'B', '', 'C', 'D'].map((letter) => row(letter)).toList(),
    );
  }

  Widget seatRow(int rowNumber) {
    int baseIndex = (rowNumber - 1) * 4;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          mySeat(baseIndex),
          SizedBox(width: 4),
          mySeat(baseIndex + 1),
          SizedBox(width: 4),
          seatColNum(rowNumber),
          SizedBox(width: 4),
          mySeat(baseIndex + 2),
          SizedBox(width: 4),
          mySeat(baseIndex + 3),
        ],
      ),
    );
  }

  Container seatColNum(int colNum) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      child: Text(
        '$colNum',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  SizedBox row(String alphabet) {
    return SizedBox.square(
      dimension: 50,
      child: Center(
        child: Text(
          alphabet,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget mySeat(int index) {
    return GestureDetector(
      onTap: () => toggleSeat(index),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: _selectedSeats[index]
              ? Colors.purple
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}