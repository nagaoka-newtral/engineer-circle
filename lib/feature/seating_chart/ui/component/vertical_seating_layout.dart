import 'package:engineer_circle/feature/profile/state/component_state/profile.dart';
import 'package:engineer_circle/feature/seating_chart/state/component_state/seat_group.dart';
import 'package:engineer_circle/feature/seating_chart/ui/component/seat_icon.dart';
import 'package:flutter/material.dart';

class VerticalSeatingLayout extends StatelessWidget {
  const VerticalSeatingLayout({
    super.key,
    required this.tableId,
    required this.seats,
    required this.onSeatSelected,
    required this.onUserSelected,
  });

  final String tableId;
  final List<Seat> seats;
  final Function(String seatId) onSeatSelected;
  final Function(Profile user) onUserSelected;

  final double iconSize = 40;
  final double seatPadding = 8;
  final double nameTextHeight = 16;

  @override
  Widget build(BuildContext context) {
    final int sideSeatCounts = (seats.length) ~/ 2;
    // テーブルの高さを計算
    final double tableHeight = (iconSize * sideSeatCounts) +
        (seatPadding * (sideSeatCounts + 1)) +
        (nameTextHeight * sideSeatCounts);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 左側
        Padding(
          padding: EdgeInsets.only(top: seatPadding),
          child: Column(
            children: List.generate(sideSeatCounts, (index) {
              final seat = seats[index];
              return _buildSeat(seat);
            }),
          ),
        ),

        _buildTable(tableHeight, tableId),

        // 右側
        Padding(
          padding: EdgeInsets.only(top: seatPadding),
          child: Column(
            children: List.generate(sideSeatCounts, (index) {
              final seat = seats[index + sideSeatCounts];
              return _buildSeat(seat);
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildSeat(Seat seat) {
    return Padding(
      padding: EdgeInsets.only(
        right: seatPadding,
        bottom: seatPadding,
        left: seatPadding,
      ),
      child: Column(
        children: [
          SeatIcon(
            iconSize: iconSize,
            avatarUrl: seat.user?.avatarUrl,
            isSeated: seat.isSeated,
            onSeatSelected: () => seat.user != null
                ? onUserSelected(seat.user!)
                : onSeatSelected(seat.seatId),
          ),
          SizedBox(
            width: iconSize + seatPadding * 2,
            height: nameTextHeight,
            child: Text(
              seat.user?.name ?? "",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTable(double tableHeight, String tableId) {
    return Container(
      height: tableHeight,
      color: Colors.grey[300],
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text('テーブル$tableId'),
        ),
      ),
    );
  }
}
