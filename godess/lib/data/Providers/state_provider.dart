import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:godess/data/Providers/show_notifier.dart';
import 'package:godess/models/shows.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

final showProvider =
    StateNotifierProvider<ShowNotifier, AsyncValue<List<Show>>>((ref) {
  return ShowNotifier();
});
