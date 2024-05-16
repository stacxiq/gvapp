import 'package:flutter/material.dart';

class SenderRowView extends StatelessWidget {
  const SenderRowView(
      {Key? key, required this.senderMessage, required this.date})
      : super(key: key);

  final String senderMessage;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Flexible(
              flex: 72,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            right: 8.0, left: 5.0, top: 8.0, bottom: 2.0),
                        padding: const EdgeInsets.only(
                            right: 5.0, left: 5.0, top: 9.0, bottom: 9.0),
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xFF7CE994),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Text(
                          senderMessage,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, bottom: 8.0),
                    child: Text(
                      date,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 7.0,
                      ),
                    ),
                  ),
                ],
              ),
              //
            ),
          ),
          Flexible(
            flex: 15,
            fit: FlexFit.tight,
            child: Container(
              width: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}
