import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              height: screenHeight * .2,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Placeholder(),
            ),
            Container(
              height: 18,
              margin: EdgeInsets.only(bottom: 20),
              child: Placeholder(),
            ),
            Container(
              height: screenHeight * .17,
              margin: EdgeInsets.only(bottom: 20),
              child: Placeholder(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 14,
                  width: 100,
                  child: Placeholder(),
                ),
                SizedBox(width: 20),
                Container(
                  height: 14,
                  width: 100,
                  child: Placeholder(),
                ),
              ],
            ),
            SizedBox(height: 50),
            Container(
              height: 16,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (_, __) => Container(
                  width: 150,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Placeholder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (_, __) => Container(
                  width: 135,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Placeholder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
