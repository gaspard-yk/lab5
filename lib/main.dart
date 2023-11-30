import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Networking',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: FirstPage(title: 'Networking'),
    );
  }
}

class FirstPage extends StatelessWidget {
  FirstPage({Key? key, required this.title}) : super(key: key);
  final String title;
  List<String> pages = [
    "Поиск по цифрам",
    "Получи факт о коте",
    "product list"
  ];
  final controller_1 = TextEditingController();
  final controller_2 = TextEditingController();
  final controller_3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: controller_1,
                decoration: InputDecoration(
                    labelText: 'Ведите число',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    )),
              ),
              MaterialButton(
                color: Colors.green,
                onPressed: () {
                  if (controller_1.text != "") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Page(search: controller_1.text);
                    }));
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    pages[0],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // TextField(
              //   controller: controller_1,
              //   decoration: InputDecoration(
              //       labelText: 'Ведите значение',
              //       labelStyle: TextStyle(
              //         color: Colors.black,
              //         fontSize: 20,
              //       )),
              // ),
              Text(
                "тут ничего вводить не надо",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              MaterialButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Page_2();
                  }));
                },
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    pages[1],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Text(
                "просто нажми на кнопку",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              MaterialButton(
                color: Colors.green,
                onPressed: () {
                  //if (controller_3.text != "") {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Page_3();
                  }));
                  //}
                },
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    pages[2],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              //page 2
              // TextField(
              //   controller: controller_2,
              //   decoration: InputDecoration(
              //       labelText: 'Ведите значение',
              //       labelStyle: TextStyle(
              //         color: Colors.black,
              //         fontSize: 20,
              //       )),
              // ),
              // MaterialButton(
              //   color: Colors.green,
              //   onPressed: () {
              //     if (controller_2.text != "") {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) {
              //         return Page_1(title: pages[1], search: controller_1.text);
              //       }));
              //     }
              //   },
              //   child: Padding(
              //     padding: EdgeInsets.all(20),
              //     child: Text(
              //       pages[1],
              //       style: TextStyle(
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),

              //page 3
              // TextField(
              //   controller: controller_3,
              //   decoration: InputDecoration(
              //       labelText: 'Ведите значение',
              //       labelStyle: TextStyle(
              //         color: Colors.black,
              //         fontSize: 20,
              //       )),
              // ),
              // MaterialButton(
              //   color: Colors.green,
              //   onPressed: () {
              //     if (controller_3.text != "") {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) {
              //         return Page_3(title: pages[2], search: controller_1.text);
              //       }));
              //     }
              //   },
              //   child: Padding(
              //     padding: EdgeInsets.all(20),
              //     child: Text(
              //       pages[2],
              //       style: TextStyle(
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }
}

class Page extends StatefulWidget {
  Page({super.key, required this.search});
  String search;
  Map<String, dynamic> list = {};

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  late Future<Album> futureAlbum;
  String s = '';
  @override
  void initState() {
    super.initState();
    s = widget.search;
    // String i = widget.search;
    // List<dynamic> l = fetchAlbum();
    // widget.list = l;
    doSomeAsyncStuff();
    // futureAlbum = fetchAlbum(i);
    // print('data: $futureAlbum');
    // print(futureAlbum);
  }

  Future<void> doSomeAsyncStuff() async {
    // Map<String, dynamic> l = await fetchAlbum();
    // widget.list = l;
    futureAlbum = fetchAlbum(s);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album data'),
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Text(snapshot.data!.title),
                  //Text(snapshot.data!.userId.toString()),
                  Text(snapshot.data!.id.toString())
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
        // body:  ListView.builder(
        //     itemCount: widget.list.length,
        //     itemBuilder: (context, index) {
        //       // return ToDoTile(user:widget.list[index]['userId'] ,id:widget.list[index]['id'],tx:widget.list[index]['title']);
        //       return(Text(widget.list[index]['title']));
        //     },
        //   ),
      ),
    );
  }
}

// Future<Map<String, dynamic>> fetchAlbum() async {
Future<Album> fetchAlbum(String s) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$s'));

  if (response.statusCode == 200) {
    print(response.body);

    // If the server did return a 200 OK response,
    // then parse the JSON.
    // Map<String, dynamic> map = jsonDecode(response.body);
    // var result = Map.fromIterable(list, key: (v) => v[0], value: (v) => v[1]);
    // int userId = map[0]['userId'];
    // int id = map[1]['id'];
    // String title = map[2]['title'];
    // Album a = Album(userId: userId, id: id, title: title);
    // return map;
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    // return Album.fromJson(jsonDecode(result));
  } else {
    print("fail");
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

// class ToDoTile extends StatefulWidget {
//   final int user;
//   final int id;
//   final String tx;

//   ToDoTile({
//     super.key,
//     required this.user,
//     required this.id,
//     required this.tx,
//   });
//   @override
//   createState() => new ToDoTileState();
// }

// class ToDoTileState extends State<ToDoTile> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.orange,
//       ),
//       child: Row(
//         children: [
//           // checkbox
//           Text(widget.user.toString()),
//           Text(widget.id.toString()),
//           Text(widget.tx),
//         ],
//       ),
//     );
//   }
// }

class Page_2 extends StatefulWidget {
  Page_2({super.key});
  Map<String, dynamic> list = {};

  @override
  State<Page_2> createState() => _PageState2();
}

class _PageState2 extends State<Page_2> {
  late Future<Fact> futurefact;
  String s = '';
  @override
  void initState() {
    super.initState();
    // String i = widget.search;
    // List<dynamic> l = fetchAlbum();
    // widget.list = l;
    doSomeAsyncStuff();
    // futureAlbum = fetchAlbum(i);
    // print('data: $futureAlbum');
    // print(futureAlbum);
  }

  Future<void> doSomeAsyncStuff() async {
    // Map<String, dynamic> l = await fetchAlbum();
    // widget.list = l;
    futurefact = ff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facts about cats'),
      ),
      body: Center(
        child: FutureBuilder<Fact>(
          future: futurefact,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Text("fact: " + snapshot.data!.fact),
                  Text("length: " + snapshot.data!.length.toString()),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
        // body:  ListView.builder(
        //     itemCount: widget.list.length,
        //     itemBuilder: (context, index) {
        //       // return ToDoTile(user:widget.list[index]['userId'] ,id:widget.list[index]['id'],tx:widget.list[index]['title']);
        //       return(Text(widget.list[index]['title']));
        //     },
        //   ),
      ),
    );
  }
}

class Fact {
  final String fact;
  final int length;

  const Fact({
    required this.fact,
    required this.length,
  });

  factory Fact.fromJson(Map<String, dynamic> json) {
    return Fact(
      fact: json['fact'] as String,
      length: json['length'] as int,
    );
  }
}

Future<Fact> ff() async {
  final response = await http.get(Uri.parse('https://catfact.ninja/fact'));

  if (response.statusCode == 200) {
    print(response.body);

    // If the server did return a 200 OK response,
    // then parse the JSON.
    // Map<String, dynamic> map = jsonDecode(response.body);
    // var result = Map.fromIterable(list, key: (v) => v[0], value: (v) => v[1]);
    // int userId = map[0]['userId'];
    // int id = map[1]['id'];
    // String title = map[2]['title'];
    // Album a = Album(userId: userId, id: id, title: title);
    // return map;
    return Fact.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    // return Album.fromJson(jsonDecode(result));
  } else {
    print("fail");
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
//
//
//
//
//
//
//
//
///
/////
////
////
//////
/////
////
////
////
///
///
///
///
///
///
///
///

///

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating']['rate'].toDouble(),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // this is the coloumn
          children: [
            AspectRatio(
              aspectRatio: 1, // this is the ratio
              child: CachedNetworkImage(
                // this is to fetch the image
                imageUrl: product.image,
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text(product.title),
              subtitle: Text(
                  '${product.price} \$'), // this is fetch the price from the api
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star,
                      color: Colors.orange), // this will give the rating
                  Text('${product.rating}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page_3 extends StatefulWidget {
  //Page_3({super.key, required this.search});
  // String search;
  //Map<String, dynamic> list = {};

  @override
  State<Page_3> createState() => _PageState_3();
}

class _PageState_3 extends State<Page_3> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    // you can replace your api link with this link
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        products = jsonData.map((data) => Product.fromJson(data)).toList();
      });
    } else {
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        // this give th length of item
        itemCount: products.length,
        itemBuilder: (context, index) {
          // here we card the card widget
          // which is in utils folder
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}
