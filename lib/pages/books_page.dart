import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;

  Book(this.title, this.author);
}

class BooksPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BooksPageState();
  }
}

class _BooksPageState extends State<BooksPage> {
  void initState() {
    super.initState();
  }

  Book? _selectedBook;
  bool show404 = false;
  List<Book> books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];

  void _handleBookTapped(Book book) {
    setState(() {
      _selectedBook = book;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Books'),
        ),
        body: Navigator(
          pages: [
            MaterialPage(
              key: ValueKey('BooksListPage'),
              child: BookListScreen(
                books: books,
                onTapped: _handleBookTapped,
              ),
            ),
            if (show404) MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen())
            else if (_selectedBook != null) BookDetailPage(book: _selectedBook!)
          ],
          onPopPage: (route, result) {
            if (!route.didPop((result))) {
              return false;
            }

            setState(() {
              _selectedBook = null;
            });

            return true;
          }
          ,
        ),);
  }
}

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('Unknown page')
    );
  }
}

class BookDetailPage extends Page {
  final Book book;
   BookDetailPage({required this.book}): super(key: ValueKey(book));

   @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(settings: this,
    builder: (BuildContext context) {
      return BookDetailScreen(book: book);
    });
  }
}

class BookDetailScreen extends StatelessWidget {
  final Book book;

  BookDetailScreen({required this.book});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(book.title, style: Theme.of(context).textTheme.headline6),
            Text(book.author, style: Theme.of(context).textTheme.headline6),
          ],
        ),
        ),
    );
  }
  
}


class BookListScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;
  BookListScreen({
    required this.books,
    required this.onTapped,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (var book in books)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => onTapped(book),
            )
        ],
      ),
    );
  }
}
