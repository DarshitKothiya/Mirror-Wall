import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_google/global.dart';
import 'package:my_google/ottpage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => homepage(),
        'ott': (context) => ottpage(),
      },
    ),
  );
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTT Platform'),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'ott',
                    arguments: 'https://www.hotstar.com/in');
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    image: const DecorationImage(
                        image: AssetImage('assets/image/disney.png'),
                        fit: BoxFit.contain)),
                child: Container(
                  alignment: Alignment.center,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54),
                  child: const Text(
                    'Disney+ Hotstar',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'ott',
                    arguments: 'https://www.netflix.com/in/');
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    image: const DecorationImage(
                        image: AssetImage('assets/image/netflix.png'),
                        fit: BoxFit.cover)),
                child: Container(
                  alignment: Alignment.center,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54),
                  child: const Text(
                    'Netflix',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'ott',
                    arguments: 'https://www.primevideo.com/');
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    image: const DecorationImage(
                        image: AssetImage('assets/image/prime.png'),
                        fit: BoxFit.cover)),
                child: Container(
                  alignment: Alignment.center,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54),
                  child: const Text(
                    'Amazon Prime',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'ott',
                    arguments: 'https://www.sonyliv.com/');
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    image: const DecorationImage(
                        image: AssetImage('assets/image/sony.png'),
                        fit: BoxFit.cover)),
                child: Container(
                  alignment: Alignment.center,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54),
                  child: const Text(
                    'Sony Liv',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'ott',
                    arguments: 'https://www.voot.com/');
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    image: const DecorationImage(
                        image: AssetImage('assets/image/voot.png'),
                        fit: BoxFit.cover)),
                child: Container(
                  alignment: Alignment.center,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54),
                  child: const Text(
                    'Voot',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'ott',
                    arguments: 'https://www.zee5.com/');
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    image: const DecorationImage(
                        image: AssetImage('assets/image/zee.png'),
                        fit: BoxFit.cover)),
                child: Container(
                  alignment: Alignment.center,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54),
                  child: const Text(
                    'Zee 5',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Center(
                  child: Text('Bookmark List'),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                content: SizedBox(
                  height: 500,
                  width: 400,
                  child: ListView.builder(
                    itemCount: Global.myBookMark.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.link_outlined),
                        title: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, 'ott', arguments: '${Global.myBookMark[index]}');
                          },
                          child: Text('${Global.myBookMark[index]}'),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              Global.myBookMark.removeAt(index);
                              Navigator.pop(context);
                            });
                          },
                          icon: Icon(Icons.delete_outline),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.book_outlined),
      ),
    );
  }
}
