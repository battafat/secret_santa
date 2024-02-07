import 'package:flutter/material.dart';

class TextFieldCard extends StatelessWidget {
  TextFieldCard({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final List<String> names = <String>[];

  TextEditingController nameController = TextEditingController();

  final WordPair pair;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }
  void clearText() {
    nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimatedSize(
          duration: Duration(milliseconds: 200),
          // Make sure that the compound word wraps correctly when the window
          // is too narrow.
          child: MergeSemantics(
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Santa Names',
              ),
            ),
              child: Wrap(
                children: [
                  Text(
                    pair.first,
                    style: style.copyWith(fontWeight: FontWeight.w200),
                  ),
                  Text(
                    pair.second,
                    style: style.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
