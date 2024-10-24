import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:godess/data/Fetched%20Data/calendar_data.dart';
import 'package:godess/presentation/auth/login_card.dart';
import 'package:godess/presentation/auth/singup_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'მაცნე',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HtmlFetcher(),
    );
  }
}
      // DefaultTabController(
      //   length: 2,
      //   child: Scaffold(
      //     body: Column(
      //       children: <Widget>[
      //         Padding(
      //           padding: const EdgeInsets.all(16.0),
      //           child: SvgPicture.asset(
      //             'lib/assets/logo.svg',
      //             height: 140,
      //           ),
      //         ),
      //         const Center(
      //           child: Padding(
      //             padding: EdgeInsets.symmetric(vertical: 16),
      //             child: Text(
      //               'მაცნე',
      //               style: TextStyle(
      //                 color: Colors.black,
      //                 fontSize: 30,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ),
      //         ),
      //         const SizedBox(height: 16),
      //         SizedBox(
      //           height: 60,
      //           child: TabBar(
      //             indicator: BoxDecoration(
      //               color: const Color(0xFFAA925C),
      //               borderRadius: BorderRadius.circular(20),
      //               shape: BoxShape.rectangle,
      //             ),
      //             tabs: [
      //               Tab(
      //                 child: Container(
      //                   padding: const EdgeInsets.symmetric(vertical: 10.0),
      //                   alignment: Alignment.center,
      //                   child: const Text(
      //                     'ავტორიზაცია',
      //                     style: TextStyle(fontSize: 18.0),
      //                   ),
      //                 ),
      //               ),
      //               Tab(
      //                 child: Container(
      //                   padding: const EdgeInsets.symmetric(vertical: 10.0),
      //                   alignment: Alignment.center,
      //                   child: const Text(
      //                     'რეგისტრაცია',
      //                     style: TextStyle(fontSize: 18.0),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //             labelColor: Colors.white,
      //             indicatorColor: Colors.transparent,
      //             indicatorWeight: 0,
      //           ),
      //         ),
      //         Expanded(
      //           child: Builder(
      //             builder: (BuildContext context) {
      //               final TabController tabController =
      //                   DefaultTabController.of(context);
      //               return TabBarView(
      //                 children: <Widget>[
      //                   LoginCard(
      //                     onSwitchToSignUp: () {
      //                       tabController.animateTo(1);
      //                     },
      //                   ),
      //                   SignupCard(
      //                     onSwitchToSignIn: () {
      //                       tabController.animateTo(0);
      //                     },
      //                   ),
      //                 ],
      //               );
      //             },
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
//       ),
//     );
//   }
// }
