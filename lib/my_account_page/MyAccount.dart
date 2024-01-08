import 'package:crossdress/auth/firebase_auth/auth_util.dart';
import 'package:crossdress/colos.dart';
import 'package:crossdress/flutter_flow/flutter_flow_util.dart';
import 'package:crossdress/my_account_page/widgets/ProfileMenuWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: InkResponse(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(
                              image: AssetImage('assets/images/kuwan.jpg'))),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colored.egg),
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Center(
                  child: Text(
                'Benz',
                style: TextStyle(
                    color: Colored.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )),
              SizedBox(
                height: 8,
              ),
              Center(
                  child: Text('foythong@gmail.com',
                      style: TextStyle(
                          color: Colored.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14))),
              SizedBox(
                height: 16,
              ),
              Center(
                child: SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => (),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colored.brightPurple,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: Text('Edit Profile',
                        style: TextStyle(color: Colored.white)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Billing Details",
                  icon: Icons.settings,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "User Management", icon: Icons.person, onPress: () {}),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Information", icon: Icons.person, onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: Icons.logout,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth('LoginPage', context.mounted);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
