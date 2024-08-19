import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/helpers/spaces.dart';

class TopTableStanding extends StatelessWidget {
  const TopTableStanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 40.h,
      child: Row(
        children: [
          horizontalSpace(12),
          const Text("#"),
          const Spacer(),
          const Text('PL'),
          horizontalSpace(16),
          Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 6),
            color: Colors.green,
            child: const Text('W'),
          ),
          Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 6),
            color: Colors.blue,
            child: const Text('D'),
          ),
          Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 6),
            color: Colors.red,
            child: const Text('L'),
          ),
          horizontalSpace(16),
          const Text('+/-'),
          horizontalSpace(16),
          const Text('GD'),
          horizontalSpace(16),
          const Text('Pts'),
          horizontalSpace(12)
        ],
      ),
    );
  }
}
