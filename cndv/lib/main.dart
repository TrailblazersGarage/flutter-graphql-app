import 'package:cndv/src/pages/tabs_page.dart';
import 'package:cndv/src/services/carteira_cidadao_service.dart';
import 'package:cndv/src/services/noticias_service.dart';
import 'package:cndv/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_) => new CarteiraCidadaoService() ),
          ChangeNotifierProvider(create: (_) => new NoticiasService() ),
        ],
        child:MaterialApp(
        title: 'CNDV App',
        theme: cndvTheme,
        debugShowCheckedModeBanner: false,
        home: TabsPage()
      ),
    );
  }
}