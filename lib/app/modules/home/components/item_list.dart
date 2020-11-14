import 'package:flutter/material.dart';

import '../models/user_model.dart';

class ItemList extends StatelessWidget {
  final UserModel user;

  ItemList(this.user);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Card(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: CircleAvatar(
                          radius: 26,
                          backgroundImage: NetworkImage(user.profileImage),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.fullName,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '${user.city}, ${user.state}',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            user.username,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            user.email,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
