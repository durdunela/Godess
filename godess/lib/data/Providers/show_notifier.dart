import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:godess/models/shows.dart';
import 'package:godess/services/config.dart';

class ShowNotifier extends StateNotifier<AsyncValue<List<Show>>> {
  ShowNotifier() : super(const AsyncValue.loading()) {
    fetchShows();
  }

  final ApiService _apiService = ApiService();

  Future<void> fetchShows() async {
    try {
      final shows = await _apiService.fetchChannels();
      state = AsyncValue.data(shows);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void filterShows(String query) {
    final allShows = state.value ?? [];
    if (query.isEmpty) {
      state = AsyncValue.data(allShows);
    } else {
      final filteredShows = allShows
          .where((show) =>
              show.title != null &&
              show.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      state = AsyncValue.data(filteredShows);
    }
  }
}
