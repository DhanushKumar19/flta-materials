import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.asset(
              'assets/fooderlich_assets/empty_list.png',
            ),
          ),
        ),
        Text('No Groceries', style: Theme.of(context).textTheme.headline6),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Shopping for ingredients?\n'
              'Tap the + button to write them down!',
          textAlign: TextAlign.center,
        ),
        MaterialButton(
          onPressed:   () {
            Provider.of<TabManager>(context, listen: false).gotoRecipes();
          },
          textColor: Colors.white,
          child: const Text('Browse Button'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: Colors.green,
        ),
      ],
    );
  }
}
