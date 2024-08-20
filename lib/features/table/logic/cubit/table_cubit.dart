import 'package:foot_fire/features/table/data/models/table_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/features/table/data/repos/table_repo.dart';
part 'table_state.dart';

class TableCubit extends Cubit<TableState> {
  final TableRepo _tableRepo;
  TableCubit(this._tableRepo) : super(TableInitial());

  getTableForLeague(String leagueId, String season) async {
    emit(TableLoading());

    var result = await _tableRepo.getTable(leagueId, season);
    result.fold((failure) {
      emit(TableError(failure.errorMessage));
    }, (table) {
      emit(TableLoaded(table));
    });
  }
}
