import 'package:flutter/material.dart';
import 'package:memorygameapp/ui/pages/game_page.dart';
import 'package:memorygameapp/ui/widgets/game_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text("Memory Game"),
            ),
            GameButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const GamePage();
                  }),
                );
              },
              title: "Start",
            ),
          ],
        ),
      ),
    );
  }
}
