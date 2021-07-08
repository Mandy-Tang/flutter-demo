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
              child: BooksListScreen(
                books: books,
                onTapped: _handleBookTapped,
              ),
            ),
            if (show404) MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen())
            else if (_selectedBook != null) MaterialPage(key: ValueKey(_selectedBook), child: BookDetailScreen(book: _selectedBook!))
          ],
        ));
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

class BookDetailScreen extends StatelessWidget {
  final Book book;

  BookDetailScreen({required this.book});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (book != null) ...[
              Text(book.title, style: Theme.of(context).textTheme.headline6),
              Text(book.author, style: Theme.of(context).textTheme.headline6),
            ]
          ],
        ),
        ),
    );
  }
  
}


class BooksListScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;
  BooksListScreen({
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
