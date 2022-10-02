import 'package:amazoon_clone/model/user_details_model.dart';
import 'package:amazoon_clone/providers/user_details_provider.dart';
import 'package:amazoon_clone/screens/sell_screen.dart';
import 'package:amazoon_clone/utils/color_themes.dart';
import 'package:amazoon_clone/utils/constants.dart';
import 'package:amazoon_clone/utils/untils.dart';
import 'package:amazoon_clone/widgets/account_screen_app_bar.dart';
import 'package:amazoon_clone/widgets/custom_main_button.dart';
import 'package:amazoon_clone/widgets/products_showcase_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AccountScreenAppBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenSize.height - (kAppBarHeight / 2),
            width: screenSize.width,
            child: Column(
              children: [
                IntroductionWidgetAccontScreen(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMainButton(
                      child: const Text(
                        "Signin",
                        style: TextStyle(
                          color: Colors.black
                        ),
                      ),
                      color: Colors.orange,
                      isLoading: false,
                      onPressed: (){}
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMainButton(
                      child: const Text("Sell",
                        style: TextStyle(
                            color: Colors.black
                        ),
                      ),
                      color: Colors.yellow,
                      isLoading: false,
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)
                            => const SellScreen()));
                      }
                  ),
                ),
                ProductsShowcaseListView(
                    title: "Your oder",
                    children: testChildren,
                ),
                 Padding(
                   padding:  EdgeInsets.all(15),
                   child: Align(
                     alignment: Alignment.centerLeft,
                     child: Text("Order Requests",
                      style: TextStyle(fontSize: 17,
                      fontWeight: FontWeight.bold
                      ),),
                   ),
                 ),
                Expanded(child: ListView.builder(
                  itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:
                        const Text("Oder: Black Shoe",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                        ),
                        ),
                        subtitle: const Text("Address : Ha long City"),
                        trailing: IconButton(onPressed: (){},
                            icon: Icon(Icons.check)),
                      );
                    },
                ))
              ],
            ),
          ),
        ));
  }
}

class IntroductionWidgetAccontScreen extends StatelessWidget {
  const IntroductionWidgetAccontScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDetailsModel userDetailsModel =
        Provider.of<UserDetailsprovider>(context).userDetails;
    return Container(
      height: kAppBarHeight / 2,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: backgroundGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
      ),
      child: Container(
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.white.withOpacity(0)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Hello,  ",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 27,
                    )),
                TextSpan(
                    text: "${userDetailsModel.name}",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 27,
                        fontWeight: FontWeight.bold)),
              ])),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(avartar),
              ),
            )
          ],
        ),
      ),
    );
  }
}
