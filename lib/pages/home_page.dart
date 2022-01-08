import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'feed_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _pages = [
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Instagram', style: TextStyle(color: Colors.grey,)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Feather.camera, color: Colors.grey,),
          onPressed: (){},
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Feather.tv, color: Colors.grey,)
          ),
          IconButton(
              onPressed: (){},
              icon: const Icon(FontAwesome.send_o, color: Colors.grey,)
          )
        ],
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i){
          setState(() {
            currentPage = i;
          });
        },
        fixedColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Foundation.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.search),
              label: 'Search'
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.plus_square),
              label: 'Upload'
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.heart),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.user),
              label: 'Home'
          ),
        ],
      ),
    );
  }
}
