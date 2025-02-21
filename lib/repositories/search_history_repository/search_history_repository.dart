import 'package:hive_flutter/hive_flutter.dart';

class SearchHistoryRepository {
  static const String _boxName = 'search_history';
  final Box<String> _box;

  SearchHistoryRepository._(this._box);

  static Future<SearchHistoryRepository> init() async {
    final Box<String> box = await Hive.openBox<String>(_boxName);
    return SearchHistoryRepository._(box);
  }

  Future<void> addSearchQuery(String query) async {
    if (_box.values.contains(query) == false) {
      await _box.add(query);
    }
  }

  List<String> getSearchHistory() {
    return _box.values.toList().reversed.toList();
  }

  Future<void> removeSearchQuery(String query) async {
    List<dynamic> keysToRemove =
        _box.keys.where((key) => _box.get(key) == query).toList();

    for (dynamic key in keysToRemove) {
      await _box.delete(key);
    }
  }

  Future<void> clearSearchHistory() async {
    await _box.clear();
  }
}
