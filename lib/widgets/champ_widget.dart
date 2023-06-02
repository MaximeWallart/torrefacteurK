import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:torrefactor/API/Champ.dart';
import 'package:torrefactor/utils/color_utils.dart';
import 'package:torrefactor/views/change_plan_form.dart';

import '../API/Plan.dart';

class ChampWidget extends StatefulWidget {
  const ChampWidget({super.key, required this.champ});

  final Champ champ;

  @override
  State<ChampWidget> createState() => _ChampWidgetState();
}

class _ChampWidgetState extends State<ChampWidget> {
  Widget getPlanByIndex(int index) {
    if (widget.champ.plans.length > index) {
      return PlanWidget(
        plan: widget.champ.plans[index],
        background: widget.champ.background,
      );
    } else {
      return PlanWidget(
        plan: null,
        background: widget.champ.background,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: widget.champ.background,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(4, (index) {
                return GestureDetector(
                    onTap: () => print(widget.champ.plans[index]),
                    onLongPress: () => showDialog<Plan>(
                            context: context,
                            builder: (BuildContext context) => ChangePlanForm(
                                  plan: widget.champ.plans[index],
                                )).then((value) {
                          setState(() {
                            widget.champ.plans[index] = value;
                          });
                        }),
                    child: getPlanByIndex(index));
              })),
        ),
      ),
    );
  }
}

class PlanWidget extends StatefulWidget {
  PlanWidget({super.key, required this.plan, this.background = Colors.brown});

  final Plan? plan;
  Color background;

  @override
  State<PlanWidget> createState() => _PlanWidgetState();
}

class _PlanWidgetState extends State<PlanWidget> {
  double percent = 0.0;

  late Timer timer;

  void _startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (mounted) {
        setState(() {
          percent += 10 / (widget.plan!.kafe.duree * 60);
          if (percent >= 100) {
            timer.cancel();
            percent = 0.0;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: widget.plan != null
          ? Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: percent > 0
                          ? widget.plan!.kafe.avatar.lighten(factor: 1.5)
                          : Colors.transparent,
                      width: 1)),
              child: Transform.rotate(
                angle: -math.pi / 2,
                child: GestureDetector(
                  onTap: percent > 0 ? null : () => _startTimer(),
                  child: LinearPercentIndicator(
                    percent: percent / 100,
                    animation: true,
                    barRadius: const Radius.circular(20),
                    linearStrokeCap: LinearStrokeCap.round,
                    backgroundColor: widget.background.lighten(),
                    lineHeight: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.height * 0.0975,
                    animateFromLastPercent: true,
                    progressColor:
                        widget.plan!.kafe.avatar.lighten(factor: 1.5),
                    onAnimationEnd: () {},
                    center: Transform.rotate(
                        angle: math.pi / 2,
                        child:
                            Icon(Icons.grass, color: widget.plan!.kafe.avatar)),
                  ),
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  color: widget.background.lighten(),
                  borderRadius: BorderRadius.circular(20)),
              child: const Icon(Icons.block),
            ),
    );
  }
}
