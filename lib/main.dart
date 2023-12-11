import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const InheritedHomeWidget(
        title: "Dependency Injection Text",
        child: MaterialApp(
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inheritedHomeWidget = InheritedHomeWidget.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            inheritedHomeWidget != null ?  inheritedHomeWidget.title : "Demo",
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: const Center(child: Text("Dependency Injection Demo")));
  }
}

class InheritedHomeWidget extends InheritedWidget {
  final String title;
  final Widget child;

  const InheritedHomeWidget(
      {super.key, required this.title, required this.child})
      : super(child: child);

  static InheritedHomeWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedHomeWidget>();
  }

  @override
  bool updateShouldNotify(InheritedHomeWidget oldWidget) {
    return true;
  }
}
