import 'package:netfix_clone/src/external/models/paginated_response.dart';

abstract class IPaginationExampleRepository {
  Future<PaginatedResponse> getPaginationExample({required int page});
}
