import 'package:flutter/material.dart';
import 'package:google_translate_clone/screens/home_page/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController translateLang = TextEditingController();
  TextEditingController translatedLanguage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              // context.read<HomeProvider>().translateData();
            },
            icon: Icon(Icons.translate_rounded),
          ),
          IconButton(
            onPressed: () {
              context.read<HomeProvider>().languageData();
            },
            icon: Icon(Icons.language_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButton(
                value: context.read<HomeProvider>().data,
                items: [
                  DropdownMenuItem(
                    child: Text("data"),
                  ),
                ],
                onChanged: (value) {},
              ),
              TextField(
                controller: translateLang,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              MaterialButton(
                onPressed: () {
                  context
                      .read<HomeProvider>()
                      .translateData(translateLang.text);
                },
                color: Colors.blue,
                child: Text("Translate"),
              ),
              SizedBox(height: 16),
              DropdownButton(
                value: context.read<HomeProvider>().data,
                items: [
                  DropdownMenuItem(
                    child: Text("data"),
                  ),
                ],
                //  items: context.watch<HomeProvider>().data!.map((e) => DropdownMenuItem(child: Text(e)),),
                onChanged: (value) {},
              ),
              Container(
                height: 120,
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: context.watch<HomeProvider>().dataa != null
                    ? Text("${context.watch<HomeProvider>().dataa}")
                    : Text(""),
              ),
              // TextField(
              //   controller: translatedLanguage,
              //   maxLines: 3,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              Text(
                "${context.watch<HomeProvider>().data}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
