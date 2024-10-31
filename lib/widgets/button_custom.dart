import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:quizzmobileapp/apps/utils/const.dart';

class ButttonCustom extends StatelessWidget {

  String title;
  Function onTap;
   ButttonCustom({super.key, required this.title, required this.onTap}); 

  @override
  Widget build(BuildContext context) {
    return Material(
           clipBehavior: Clip.hardEdge  ,
           borderRadius: const BorderRadius.all(Radius.circular(10.0)),
           child:  InkWell(
                   splashColor: Colors.amberAccent,
                   onTap: () => onTap(),
                   child: Ink(
                    padding: EdgeInsets.symmetric(vertical: getHeight(context) * 0.02),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff027DFD),
                          Color(0xff4100E0),
                          Color(0xff33FBC9),
                        ],
                      ),
                    ),
            width: getWidth(context),
                     child:  Align(
                       child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                                          ),
                     ),

           ),

    ),
    );
  }
}