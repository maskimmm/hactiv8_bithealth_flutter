import 'package:flutter/material.dart';
import 'package:hactiv8_bithealth_flutter/models/user_model.dart';

class UserCardWidget extends StatelessWidget {
  final UserModel userModel;
  const UserCardWidget({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "${userModel.id}. ${userModel.name}",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Expanded(
                  flex: 3,
                  child: Text(
                    "Username:",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    userModel.username,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Expanded(
                  flex: 3,
                  child: Text(
                    "Email:",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    userModel.email,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Expanded(
                  flex: 3,
                  child: Text(
                    "Address:",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    "${userModel.address.street}, ${userModel.address.city}, ${userModel.address.suite}, ${userModel.address.zipcode}, Lat: ${userModel.address.geo.lat} Long: ${userModel.address.geo.lng}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Expanded(
                  flex: 3,
                  child: Text(
                    "Phone:",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    userModel.phone,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Expanded(
                  flex: 3,
                  child: Text(
                    "Website:",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    userModel.website,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Expanded(
                  flex: 3,
                  child: Text(
                    "Company:",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    "${userModel.company.name}, ${userModel.company.catchPhrase}, ${userModel.company.bs}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
