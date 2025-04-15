import 'package:aula_01/data/restaurant_data.dart';
import 'package:aula_01/model/restaurant.dart';
import 'package:aula_01/ui/_core/app_theme.dart';
import 'package:aula_01/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantData restaurantData = RestaurantData();
  await restaurantData.getRestaurants();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return restaurantData;
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.appTheme, home: SplashScreen());
  }
}
