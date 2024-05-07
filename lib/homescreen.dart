import 'package:flutter/material.dart';
import 'package:youngdevtaskelibrary/services/BookListScreen.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(' E-library store',style: TextStyle(color: const Color.fromARGB(255, 243, 245, 246)),),
        centerTitle: true,
        backgroundColor:  Color.fromARGB(255, 10, 7, 7),
      ),
      body: Stack(
        children: [
          _buildBackgroundImage(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to E Library',
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),
                  textAlign: TextAlign.center,
                  
                ),
                SizedBox(height: 20),
                Container(
  width: 200, 
  height: 50, 
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BookListScreen()),
      );
    },
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
      ),
      backgroundColor: Colors.white70
    ),
    child: Text('Explore Books',style: TextStyle(color: Color.fromARGB(255, 55, 56, 55)),),
  ),
),

              ],
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
}