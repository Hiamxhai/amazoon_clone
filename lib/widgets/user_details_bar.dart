import 'package:amazoon_clone/model/user_details_model.dart';
import 'package:amazoon_clone/providers/user_details_provider.dart';
import 'package:amazoon_clone/utils/color_themes.dart';
import 'package:amazoon_clone/utils/constants.dart';
import 'package:amazoon_clone/utils/untils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailsBar extends StatelessWidget {
  final double offset;
  const UserDetailsBar({
    Key? key,
    required this.offset,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    UserDetailsModel userDetails = Provider.of<UserDetailsprovider>(context).userDetails;
    return Positioned(
      top: -offset / 5,
      child: Container(
        height: kAppBarHeight/2,
        width: screenSize.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: lightBackgroundaGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight
          )
        ),
        child: Padding(
          padding:
          const
          EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 20,
          ),
          child:
             Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.location_on_outlined,
                  color: Colors.grey[900],
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.7,
                  child: Text(
                    "Deliver to: ${userDetails.name} - ${userDetails.address}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[900]
                    ),
                  ),
                ),
              ],
            ),

          ),
      ),
    );
  }
}
