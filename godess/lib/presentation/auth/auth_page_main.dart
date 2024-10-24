import 'package:flutter/material.dart';
import 'package:godess/presentation/auth/login_card.dart';
import 'package:godess/presentation/auth/singup_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthPageMain extends StatelessWidget {
  const AuthPageMain({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(
                    'assets/church_app.svg',
                    height: 140,
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'მაცნე',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 60,
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: const Color(0xFFAA925C),
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'ავტორიზაცია',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'რეგისტრაცია',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                    ],
                    labelColor: Colors.white,
                    indicatorColor: Colors.transparent,
                    indicatorWeight: 0,
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: Builder(
                    builder: (BuildContext context) {
                      final TabController tabController =
                          DefaultTabController.of(context);
                      return TabBarView(
                        children: [
                          LoginCard(
                            onSwitchToSignUp: () {
                              tabController.animateTo(1);
                            },
                          ),
                          SignupCard(
                            onSwitchToSignIn: () {
                              tabController.animateTo(0);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
