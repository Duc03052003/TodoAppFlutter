import 'package:flutter/material.dart';
import 'package:project_final/Firebase/widget_connect_firebase.dart';
import 'package:project_final/todo_app/controller/task_controller.dart';
import 'package:project_final/todo_app/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskController()),
      ],
      child: MaterialApp(
        title: 'Task Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:MyFirebaseConnect(
            errorMessage: "Kết nối không thành công",
            connectingMessage: "Đang kết nối",
            builder: (context) => HomeScreen()),
        debugShowCheckedModeBanner: false,
      ),
    );
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyFirebaseConnect(
            errorMessage: "Kết nối không thành công",
            connectingMessage: "Đang kết nối",
            builder: (context) => HomeScreen()));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To do app"),
      ),
      body: SingleChildScrollView(
        child: _homeListView(context),
      ),
    );
  }
}

Widget _homeListView(BuildContext context) {
  final test = ["a", "b", "c"];
  return ListView.builder(
    itemCount: test.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(test[index]),
      );
    },
  );
}