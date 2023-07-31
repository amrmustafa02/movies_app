import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../model/api/api_discover_manager.dart';
import '../../model/api_model/movie_item_model.dart';
import 'movie_search_item.dart';

class SearchResults extends StatefulWidget {
  String query;
  int pageNumber = 1;
  static const _pageSize = 20;

  SearchResults({required this.query});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults>
    with AutomaticKeepAliveClientMixin {
  final PagingController<int, MovieItemModel> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage();
    });
    super.initState();
  }

  Future<void> _fetchPage() async {
    print(widget.pageNumber);
    try {
      var newItems = await ApiDiscoverManager.getSearchResult(widget.query,
          page: widget.pageNumber);
      final isLastPage = newItems.length < SearchResults._pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = widget.pageNumber++;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, MovieItemModel>(
      pagingController: _pagingController,

      builderDelegate: PagedChildBuilderDelegate<MovieItemModel>(
        itemBuilder: (context, item, index) => MovieSearchItem(
          movieItemModel: item,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
