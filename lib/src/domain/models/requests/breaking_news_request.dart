import '../../../utils/constants/nums.dart';
import '../../../utils/constants/strings.dart';

class BreakingNewsRequests {
  final String apiKey;
  final String country;
  final String category;
  final int page;
  final int pageSize;

  const BreakingNewsRequests({
    this.apiKey = defaultApiKey,
    this.country = 'us',
    this.category = 'general',
    this.page = 1,
    this.pageSize = defaultPageSize,
  });
}
