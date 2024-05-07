import 'package:flutter/material.dart';
import 'package:youngdevtaskelibrary/models/post.dart';
import 'package:youngdevtaskelibrary/services/api_service.dart';
import 'package:youngdevtaskelibrary/services/expandable_text.dart'; 

class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  late Future<List<Book>> futureBooks;

  @override
  void initState() {
    super.initState();
    futureBooks = BookService.searchBooks('Flutter'); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of Book'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          _buildBackgroundImage(),
          Center(
            child: FutureBuilder<List<Book>>(
              future: futureBooks,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return _buildBookCard(snapshot.data![index]);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/a.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBookCard(Book book) {
    return Card(
      color: Colors.white, 
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(book.thumbnailUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Author: ${book.author}',
                    style: TextStyle(fontSize: 18, backgroundColor: const Color.fromARGB(255, 248, 249, 249)),
                  ),
                  SizedBox(height: 8),
                  ExpandableText(book.description), // Use ExpandableText widget
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
