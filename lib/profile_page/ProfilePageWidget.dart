import 'package:crossdress/colos.dart';
import 'package:crossdress/my_account_page/MyAccount.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colored.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: InkResponse(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => MyAccount()),
                  );
                },
                child: Icon(Icons.menu),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: const Image(
                                image: AssetImage('assets/images/kuwan.jpg'))),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Benz',
                      style: TextStyle(
                          color: Colored.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('foythong@gmail.com',
                        style: TextStyle(
                            color: Colored.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14)),
                    SizedBox(
                      height: 24,
                    ),
                    MasonryGridView.builder(
                      shrinkWrap: true,
                      itemCount: 100,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: [
                              Colors.blueGrey,
                              Colors.greenAccent,
                              Colors.redAccent,
                              Colors.amber,
                              Colors.lightBlueAccent,
                            ][index % 5],
                          ),
                          height: [
                            100.0,
                            150.0,
                            200.0,
                            350.0,
                            300.0,
                          ][index % 5],
                        ),
                      ),
                    )
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
