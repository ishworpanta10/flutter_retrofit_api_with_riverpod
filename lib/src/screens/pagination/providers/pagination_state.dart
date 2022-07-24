import 'package:equatable/equatable.dart';

enum PaginationStateStatus { initial, loading, loaded, error }

class PaginationState<T> extends Equatable {
  final PaginationStateStatus status;
  final List<T> dataList, oldDataList;
  final bool isFirstFetched;

  const PaginationState({
    required this.status,
    required this.dataList,
    required this.oldDataList,
    required this.isFirstFetched,
  });

  /// Initial factory constructor for [PaginationState]
  factory PaginationState.initial() {
    return PaginationState<T>(
      oldDataList: const [],
      dataList: const [],
      status: PaginationStateStatus.initial,
      isFirstFetched: false,
    );
  }

  PaginationState<T> copyWith({
    PaginationStateStatus? status,
    List<T>? dataList,
    List<T>? oldDataList,
    bool? isFirstFetched,
  }) {
    return PaginationState<T>(
      status: status ?? this.status,
      dataList: dataList ?? this.dataList,
      oldDataList: oldDataList ?? this.oldDataList,
      isFirstFetched: isFirstFetched ?? this.isFirstFetched,
    );
  }

  @override
  List<Object> get props => [status, dataList, isFirstFetched];
}
