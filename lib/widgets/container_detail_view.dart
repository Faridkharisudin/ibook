import 'package:flutter/material.dart';
import 'package:ibook/widgets/every_text.dart';

class ContainerDetailView extends StatelessWidget {
  String word1, word2;
  ContainerDetailView({Key? key, required this.word1, required this.word2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 5,
      child: Column(
        children: [
          EveryText(
            word: word1,
            sizeWord: 16,
            weightWord: FontWeight.w200,
          ),
          EveryText(
            word: word2,
            sizeWord: 18,
            weightWord: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
