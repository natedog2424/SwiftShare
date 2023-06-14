import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer(this.endTime, {this.message, super.key});

  final String? message;
  final DateTime endTime;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (widget.endTime.isAfter(DateTime.now())) {
        setState(() {});
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final difference = widget.endTime.difference(now).isNegative
        ? Duration.zero
        : widget.endTime.difference(now);
    final String minutes = (difference.inMinutes % 60).toString();
    final String seconds =
        (difference.inSeconds % 60).toString().padLeft(2, '0');

    final String message;
    if (widget.message != null) {
      message = '${widget.message!}$minutes:$seconds';
    } else {
      message = '$minutes:$seconds';
    }
    return Text(
      message,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
