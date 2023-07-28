import 'package:floor/floor.dart';
import '../../../domain/models/article.dart';
import 'converters/source_type_converter.dart';
import 'dao/articles_dao.dart';

part 'app_database.g.dart';

@TypeConverters([SourceTypeConverter])
@Database(version: 1, entities: [Article])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}
