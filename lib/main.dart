import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe/blocs/news_blocs.dart';
import 'package:globe/blocs/news_event.dart';
import 'package:globe/blocs/news_states.dart';
import 'package:globe/pages/home.dart';
import 'package:globe/repos/repositories.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Globe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
          create: (context) => NewsRepository(),
          child: //const Home()
          HomePage(
            selectedIndex: 0,
          )
          ),
    );
  }
}

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) => NewsBloc(
//               RepositoryProvider.of<NewsRepository>(context),
//             )..add(LoadNewsEvent()),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('The BLoC'),
//         ),
//         body: BlocBuilder(builder: (context, state) { if (state is NewsLoadingState) {
//           return CircularProgressIndicator();
//         }else{
//           return Container();
//         }
//         },
//
//         ),
//       ),
//     );
//   }
// }
