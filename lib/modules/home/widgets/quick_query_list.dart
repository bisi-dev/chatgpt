import 'package:flutter/material.dart';

import '../models/query.dart';

class QuickQueryList extends StatelessWidget {
  const QuickQueryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SizedBox(
        height: 64,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: Query.list.length,
          padding: const EdgeInsets.only(right: 16.0),
          itemBuilder: (context, index) => InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 2.0),
                    color: Colors.grey.withOpacity(0.05),
                    blurRadius: 4.0,
                    spreadRadius: -1,
                  )
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Query.list[index].title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: 200, maxWidth: 200),
                    child: Text(
                      Query.list[index].body,
                      overflow: TextOverflow.ellipsis,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                  ),
                ],
              ),
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(width: 16),
        ),
      ),
    );
  }
}
