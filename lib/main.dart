import 'package:easyparking/pages/navigation/blocs/application_bloc.dart';
import 'package:easyparking/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async{
  //Ensure the dependencies loading correctly and completely
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Easy Parking',
        initialRoute: RouteHelper.getHomePage(),
        getPages: RouteHelper.routes,
      ),
    );
  }
}
