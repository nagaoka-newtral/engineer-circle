import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:engineer_circle/domain/seat_group.dart';
import 'package:engineer_circle/domain/user.dart';
import 'package:engineer_circle/feature/seating_chart/state/component_state/seat_group_view_property.dart';
import 'package:engineer_circle/feature/seating_chart/state/component_state/seat_title_view_property.dart';
import 'package:engineer_circle/feature/seating_chart/state/seating_chart_state.dart';
import 'package:engineer_circle/infrastructure/repository/seating_chart_repository.dart';
import 'package:engineer_circle/infrastructure/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final seatingChartUseCaseProvider = Provider(
  (ref) => SeatingChartUseCase(
      seatingChartRepository: ref.watch(seatingChartRepositoryProvider),
      userRepository: ref.watch(userRepositoryProvider)),
);

class SeatingChartUseCase {
  SeatingChartUseCase({
    required this.seatingChartRepository,
    required this.userRepository,
  });

  final SeatingChartRepository seatingChartRepository;
  final UserRepository userRepository;

  Future<SeatingChartStateSuccess> getLatest() async {
    final seatingChart = await seatingChartRepository.getLatest();

    final users = await _getUsers(seatingChart.seatGroupList);
    final seatGroupMatrix =
        _createSeatGroupMatrix(seatingChart.seatGroupList, users);

    return SeatingChartStateSuccess(
      seatGroupMatrix: seatGroupMatrix,
      currentSeatTitle: seatingChart.seatTitle,
    );
  }

  Future<SeatingChartStateSuccess> getSeatingChart(
      DocumentReference docRef) async {
    final seatingChart = await seatingChartRepository.getSeatingChart(docRef);

    final users = await _getUsers(seatingChart.seatGroupList);
    final seatGroupMatrix =
        _createSeatGroupMatrix(seatingChart.seatGroupList, users);

    return SeatingChartStateSuccess(
      seatGroupMatrix: seatGroupMatrix,
      currentSeatTitle: seatingChart.seatTitle,
    );
  }

  Future<List<SeatTitleViewProperty>> getTitles() async {
    final seatingCharts = await seatingChartRepository.getSeatingCharts();

    // DocumentReferenceがnullのものを除外（データ不整合が起きない限りnullになることはない）
    final validSeatingCharts =
        seatingCharts.where((seatingChart) => seatingChart.docRef != null);

    return validSeatingCharts.map((seatingChart) {
      return SeatTitleViewProperty(
        docRef: seatingChart.docRef!,
        title: seatingChart.seatTitle,
      );
    }).toList();
  }

  /// 着座しているユーザーを取得する
  Future<List<User>> _getUsers(
    List<SeatGroup> seatGroupList,
  ) {
    // ユーザーIDの取得
    final userIds = seatGroupList
        .expand((seatGroup) => seatGroup.seats
            .where((seat) => seat.userId != null)
            .map((seat) => seat.userId!))
        .toList();

    // ユーザーデータの取得
    return userRepository.getWhereInUsers(userIds);
  }

  /// 座席グループを行ごとに分割し、行列を作成する
  List<List<SeatGroupViewProperty>> _createSeatGroupMatrix(
    List<SeatGroup> seatGroups,
    List<User> users,
  ) {
    return seatGroups.fold<List<List<SeatGroupViewProperty>>>([], (
      matrix,
      seatGroup,
    ) {
      // View表示用のクラスに変換
      final seatGroupViewProperty = _toSeatGroupViewProperty(seatGroup, users);

      // 前回の行の最終要素と現在の座席グループが同じ行にあるかどうかをチェック
      if (matrix.isEmpty || matrix.last.last.row != seatGroup.row) {
        // 現在の座席グループが新しい行にある場合、新しい行を追加
        matrix.add([seatGroupViewProperty]);
      } else {
        // 現在の座席グループが前回の行にある場合、既存の行に追加
        matrix.last.add(seatGroupViewProperty);
      }

      return matrix;
    });
  }

  SeatGroupViewProperty _toSeatGroupViewProperty(
    SeatGroup seatGroup,
    List<User> users,
  ) {
    return SeatGroupViewProperty(
      groupId: seatGroup.groupId,
      row: seatGroup.row,
      column: seatGroup.column,
      seatOrientation: seatGroup.seatOrientation,
      seats: seatGroup.seats.map(
        (seat) {
          return SeatViewProperty(
            seatId: seat.seatId,
            isSeated: seat.isSeated,
            user:
                users.firstWhereOrNull((element) => element.id == seat.userId),
          );
        },
      ).toList(),
    );
  }
}