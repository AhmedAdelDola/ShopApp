import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Modules/shop%20home%20page/cubit.dart';
import 'package:shopapp/Modules/shop%20home%20page/state.dart';

// ignore: must_be_immutable
class MyButton extends StatefulWidget {
  final String? txt;
  final String? value;
  bool isTapped = false;

  MyButton({required this.txt,required this.value});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: widget.isTapped ? 50 : 60,
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {
                    setState(() {
                      widget.isTapped = !widget.isTapped;
                    });
                  },
                  child: Text(widget.txt!),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: widget.isTapped ? 1.0 : 0.0,
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: Text(
                      widget.value!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
