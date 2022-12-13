import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.icon,
    required this.title,
    required this.data,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon,size: 22,),
          SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Text(
            data,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 16,
                ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.black45,
            size: 22,
          )
        ],
      ),
    );
  }
}
