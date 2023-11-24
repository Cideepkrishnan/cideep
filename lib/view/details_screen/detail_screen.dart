import 'package:exam1/utils/databse.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final int itemIndex;
  const DetailScreen({required this.itemIndex, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(database.places[widget.itemIndex]["place"]),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                    image: NetworkImage(
                        database.places[widget.itemIndex]["image"]),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                child: Text(
              database.places[widget.itemIndex]["detai"],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
          )
        ],
      ),
    );
  }
}
