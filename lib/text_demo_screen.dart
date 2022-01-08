import 'package:flutter/material.dart';
class TextDemoScreen extends StatelessWidget {
  const TextDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                 width: 200,
                 height: 200,
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                color: Colors.brown,
                border: Border.all(color: Colors.deepOrange, width: 3)
              ),
                alignment: Alignment.center,
                child: const Text ("это длинный текст, очень длинный",
                overflow: TextOverflow.fade,
                  softWrap: true,
                style: TextStyle(color: Colors.amberAccent,fontSize: 16),
               ),
              ),
              Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                    color: Colors.brown,
                    border: Border.all(color: Colors.deepOrange, width: 3)
                ),
                alignment: Alignment.center,
                child: const Text.rich (
                      TextSpan(text: "Фрагмент",
                     style: TextStyle(color: Colors.white,fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(text: ' стилизованного', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' текста', style: TextStyle(fontStyle: FontStyle.italic))
                      ] ),
                  overflow: TextOverflow.fade,
                  softWrap: true,
                  style: TextStyle(color: Colors.amberAccent,fontSize: 16),
                ),
              ),
            ],
          ),
        ),
     ),
    );
  }
}
