import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CardItem {
  String text;
  Color color;

  CardItem({required this.text, required this.color});
}

class CardWidget extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onDelete;
  final ValueChanged<Color> onColorChanged;

  const CardWidget({
    super.key,
    required this.text,
    required this.color,
    required this.onDelete,
    required this.onColorChanged,
  });

  void pickColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        Color pickerColor = color;
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: (newColor) {
                pickerColor = newColor;
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Pick'),
              onPressed: () {
                onColorChanged(pickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 18.0),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.color_lens, color: Colors.blue),
                  onPressed: () => pickColor(context),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
