import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: content(),
    );
  }

  Widget content() {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Hero(
            tag: "Adidas XI",
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                    image: AssetImage('assets/shoe1.jpeg'), fit: BoxFit.fill),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Nike",
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
