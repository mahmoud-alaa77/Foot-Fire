part of 'table_cubit.dart';

sealed class TableState {}

final class TableInitial extends TableState {}

final class TableLoading extends TableState {}

final class TableError extends TableState {
  final String errorMessage;

  TableError(this.errorMessage);
}

final class TableLoaded extends TableState {
  final TableModel tableModel;

  TableLoaded(this.tableModel);
}
