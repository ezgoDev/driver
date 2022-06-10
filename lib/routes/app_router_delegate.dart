import 'package:flutter/material.dart';
import '../main.dart';
import '../pages/book_detail.dart';
import '../pages/book_list_page.dart';
import '../pages/unknown_page.dart';
import 'app_route_path.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  Book? _selectedBook;
  bool show404 = false;
  AppRoutePath? path;

  List<Book> books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    print("route Change");
  }

  @override
  AppRoutePath get currentConfiguration {
    if (show404) {
      return AppRoutePath.unknown();
    }
    return _selectedBook == null
        ? AppRoutePath.home()
        : AppRoutePath.details(books.indexOf(_selectedBook!) );
  }

  @override
  Widget build(BuildContext context) {
    print("appr route ");
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('BooksListPage'),
          child: BooksListPage(
            books: books,
            onTapped: _handleBookTapped,
          ),
        ),
        if (show404)
          const MaterialPage(key: ValueKey('UnknownPage'), child: UnknownPage())
        else if (_selectedBook != null)
          BookDetailsPage(book: _selectedBook!)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        _selectedBook = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath path) async {
    if (path.isUnknown) {
      _selectedBook = null;
      show404 = true;
      return;
    }

    if (path.isDetailsPage) {
      if (path.id! < 0 || path.id! > books.length - 1) {
        show404 = true;
        return;
      }

      _selectedBook = books[path.id!];
    } else {
      _selectedBook = null;
    }

    show404 = false;
  }

  void _handleBookTapped(Book book) {
    _selectedBook = book;
    notifyListeners();
  }
}
