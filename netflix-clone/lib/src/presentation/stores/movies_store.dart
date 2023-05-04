import 'package:mobx/mobx.dart';
import 'package:netfix_clone/src/external/models/movie.dart';
import 'package:netfix_clone/src/utils/consts.dart';
part 'movies_store.g.dart';

class MovieStore = _MovieStoreBase with _$MovieStore;

abstract class _MovieStoreBase with Store {
  @observable
  ObservableList movies = ObservableList.of([]);

  @observable
  bool loading = false;
  @action
  Future getAllMovies() async {
    loading = true;
    dataMovies.forEach((movie) {
      movies.add(Movie.fromJson(movie));
    });
    loading = false;
  }
}
