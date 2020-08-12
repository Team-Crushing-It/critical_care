import 'package:flutter/material.dart';

class RealtimeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final url =
        'https://media.discordapp.net/attachments/703406022953533552/743007510423928832/unknown.png';
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 24,
          color: Theme.of(context).highlightColor,
          child: Center(
            child: RichText(
              text: TextSpan(
                text: 'Realtime Monitoring',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: SizedBox(
        //     width: double.infinity,
        //     // height: 100,
        //     child: Image.network(
        //       'https://cdn.discordapp.com/attachments/703406022953533552/743008787920584764/Realtime.png',
        //       // BoxFit.contain,
        //     ),
        //   ),
        // )
      ],
    );
  }
}
