import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/features/news/data/repo/news_model.dart';
import 'package:foot_fire/features/news/data/repo/news_repo.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepo _newsRepo;
  NewsCubit(this._newsRepo) : super(NewsInitial());

  getNews(String? keyWord) async {
    emit(NewsLoading());

    var response = await _newsRepo.getAllNews(keyWord);

    response.fold(((failure) {
      emit(NewsError(failure.errorMessage));
    }), (newsModel) {
      emit(NewsSuccess(newsModel));
    });
  }
}
