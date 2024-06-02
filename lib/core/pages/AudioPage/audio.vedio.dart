import 'package:flutter/material.dart';
import 'package:ui_app/common/utils/constants.dart';
import 'package:ui_app/common/widgets/card.dart';

class AudioVideo extends StatefulWidget {
  const AudioVideo({super.key});

  @override
  State<AudioVideo> createState() => _AudioVideoState();
}

class _AudioVideoState extends State<AudioVideo> {
  List<CardItem> items = [
    CardItem(text: "Card 1", color: Colors.white),
    CardItem(text: "Card 2", color: Colors.white),
    CardItem(text: "Card 3", color: Colors.white),
  ];

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void addItem() {
    setState(() {
      items
          .add(CardItem(text: "Card ${items.length + 1}", color: Colors.white));
    });
  }

  void updateItemColor(int index, Color color) {
    setState(() {
      items[index].color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CardWidget(
              text: "Static Card",
              color: Colors.white,
              onDelete: () {},
              onColorChanged: (color) {},
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CardWidget(
                    text: items[index].text,
                    color: items[index].color,
                    onDelete: () => confirmDelete(context, index),
                    onColorChanged: (color) => updateItemColor(index, color),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppConst.kGreen,
          onPressed: addItem,
          child: const Icon(
            Icons.add,
            color: AppConst.kLight,
            size: 32,
          ),
        ),
      ),
    );
  }

  void confirmDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Confirmation"),
          content: const Text("Are you sure you want to delete this card?"),
          actions: [
            TextButton(
              child: const Text(
                "Cancel",
                style: TextStyle(color: AppConst.kGreen),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                "Delete",
                style: TextStyle(color: AppConst.kred),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                removeItem(index);
              },
            ),
          ],
        );
      },
    );
  }
}
