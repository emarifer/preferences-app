import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import './screens/screens.dart';
import './share_preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(
    providers: <ChangeNotifierProvider<ThemeProvider>>[
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(
          isDarkmode: Preferences.isDarkmode,
        ),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme
    );
  }
}

/**
 * SOLUCION AL ERROR «FLUTTER MISSINGPLUGINEXCEPTION(NO IMPLEMENTATION FOUND FOR METHOD GETALL ON CHANNEL ...) IN RELEASE APP». VER:
 * https://stackoverflow.com/questions/66001793/flutter-missingpluginexceptionno-implementation-found-for-method-getall-on-chan#66002973
 * https://github.com/flutter/flutter/issues/58247#issuecomment-636253593
 * https://github.com/flutter/flutter/issues/58247#issuecomment-636500680
 * https://github.com/flutter/flutter/issues/65334#issuecomment-783923349
 * 
 * PARA OBTENER EL FICHERO SHARED_PREFENCES.XML (HAY QUE HACERLO EN MODO ROOT -adb root-):
 * /home/enrique/Android/Sdk/platform-tools/adb pull /data/user/0/com.example.preferences_app/shared_prefs/FlutterSharedPreferences.xml /home/enrique/
 */
