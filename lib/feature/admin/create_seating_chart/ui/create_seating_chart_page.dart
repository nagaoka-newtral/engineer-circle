import 'package:collection/collection.dart';
import 'package:engineer_circle/feature/admin/create_seating_chart/state/component_state/create_seat.dart';
import 'package:engineer_circle/feature/admin/create_seating_chart/ui/component/horizontal_admin_seating_layout.dart';
import 'package:engineer_circle/feature/admin/create_seating_chart/ui/component/vertical_admin_seating_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateSeatingChartPage extends ConsumerStatefulWidget {
  const CreateSeatingChartPage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateSeatingChartPageState();
}

class _CreateSeatingChartPageState
    extends ConsumerState<CreateSeatingChartPage> {
  final horizontalScreenPadding = 8.0;

  List<CreateSeat> seats = [
    CreateSeat(
        id: 1,
        row: 1,
        column: 1,
        seatCount: 4,
        seatingOrientation: SeatingOrientation.horizontal),
    CreateSeat(
        id: 2,
        row: 1,
        column: 2,
        seatCount: 3,
        seatingOrientation: SeatingOrientation.horizontal),
    CreateSeat(
        id: 3,
        row: 1,
        column: 3,
        seatCount: 4,
        seatingOrientation: SeatingOrientation.horizontal),
    CreateSeat(
        id: 4,
        row: 2,
        column: 1,
        seatCount: 4,
        seatingOrientation: SeatingOrientation.vertical),
    CreateSeat(
        id: 5,
        row: 2,
        column: 2,
        seatCount: 4,
        seatingOrientation: SeatingOrientation.horizontal),
  ];

  @override
  Widget build(BuildContext context) {
    // 画面の幅を取得
    final screenWidth = MediaQuery.of(context).size.width;
    final usableScreenWidth = screenWidth - horizontalScreenPadding * 2;

    final seatsGroupedByRow = groupBy(seats, (CreateSeat seat) => seat.row);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalScreenPadding),
          child: Column(
              children: buildSeatRows(seatsGroupedByRow, usableScreenWidth)),
        ),
      ),
    );
  }

  List<Widget> buildSeatRows(
    Map<int, List<CreateSeat>> seatsGroupedByRow,
    double usableScreenWidth,
  ) {
    return seatsGroupedByRow.entries.map((group) {
      final seatsForCurrentRow = group.value;
      final currentRowWidgets = seatsForCurrentRow.map((seat) {
        return _buildSeatWidget(seat, usableScreenWidth / group.value.length);
      }).toList();

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: currentRowWidgets,
      );
    }).toList();
  }

  Widget _buildSeatWidget(CreateSeat seat, double layoutWidth) {
    switch (seat.seatingOrientation) {
      case SeatingOrientation.horizontal:
        return HorizontalAdminSeatingLayout(
          tableId: seat.id,
          sideSeatCounts: seat.seatCount,
          usableLayoutWidth: layoutWidth,
        );
      case SeatingOrientation.vertical:
        return VerticalAdminSeatingLayout(
          tableId: seat.id,
          sideSeatCounts: seat.seatCount,
          usableLayoutWidth: layoutWidth,
        );
    }
  }
}
