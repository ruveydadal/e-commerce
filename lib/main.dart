import 'package:e_commerce/item.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        '/item': (context) => Item(),
      },
    ));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.account_balance_wallet,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: content(),
    );
  }

  Widget content() {
    //create data
    List<String> itemPath = [
      'assets/shoe1.jpeg',
      'assets/shoe2.jpeg',
      'assets/shoe3.jpeg',
      'assets/shoe4.jpeg',
      'assets/shoe5.jpeg'
    ];
    List<String> itemPrice = ["\$200", "\$250", "\$300", "\$400", "\$150"];
    List<String> itemName = [
      " Adidas XI ",
      " Under Armour ",
      " Adidas X ",
      " Nike II ",
      " Puma "
    ];
    List<bool> isFavourite = [true, true, false, false, false];

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Categories",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "All",
                    style: TextStyle(color: Colors.orange[700]),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Shoe"),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Clothes"),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Watches")
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: ListView.builder(
                  itemCount: itemPath.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return item(context, itemPath[index], itemName[index],
                        itemPrice[index], isFavourite[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget item(BuildContext context, String itemPath, String itemName,
      String itemPrice, bool isFavourite) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/item'),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Hero(
          tag: itemName,
          child: Container(
            height: 110,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 130,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                        image: AssetImage(itemPath),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      itemPrice,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.favorite,
                    color: isFavourite ? Colors.red : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
