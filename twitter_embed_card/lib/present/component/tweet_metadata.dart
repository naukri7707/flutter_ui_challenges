import 'package:flutter/material.dart';

import 'package:twitter_embed_card/constant/svg_asset.dart';
import 'package:twitter_embed_card/present/component/svg_icon.dart';

class TweetMetadata extends StatelessWidget {
  const TweetMetadata(
    this.datetime, {
    super.key,
  });

  final DateTime datetime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          _formattedDateTime(datetime),
          style: const TextStyle(color: Color(0xFF566370)),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const SvgIcon(
              asset: SvgAsset.info,
              width: 20,
            )),
      ],
    );
  }

  String _formattedDateTime(DateTime dateTime) {
    final monthAbbreviations = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    // 判斷是上午還是下午
    final amOrPm = dateTime.hour < 12 ? 'AM' : 'PM';

    // 取得小時並將小時轉換為12小時制
    var hour = dateTime.hour % 12;
    if (hour == 0) {
      hour = 12;
    }

    // 取得分鐘
    final minute = dateTime.minute;

    // 取得月份縮寫
    final month = dateTime.month;
    final monthAbbreviation = monthAbbreviations[month];

    // 取得日期
    final day = dateTime.day;

    // 取得年份
    final year = dateTime.year;

    // 格式化字串
    final formattedDateTime =
        '$hour:$minute $amOrPm · $monthAbbreviation $day, $year';

    return formattedDateTime;
  }
}
