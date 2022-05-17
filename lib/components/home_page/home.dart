import 'package:cat_trivia/helpers/api/api.dart';
import 'package:cat_trivia/helpers/formatters/date_formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'bloc/home_bloc.dart';

class Home extends StatelessWidget {
  const Home({required this.client, Key? key}) : super(key: key);
  final RestClient client;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(client: client)..add(HiveInitEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          HomeBloc homeProvider = BlocProvider.of<HomeBloc>(context);
          return Scaffold(
              backgroundColor: const Color(0xFF37474f),
              appBar: AppBar(
                title: const Text("Cat trivia"),
                centerTitle: true,
                backgroundColor: const Color(0xFF509f93),
                actions: [
                  homeProvider.fact != null
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              dateTimeFormat(
                                  homeProvider.fact!.updatedAt.toLocal()),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : const SizedBox.shrink()
                ],
              ),
              body: Stack(
                children: [
                  if (homeProvider.state is HomeLoading)
                    Center(
                      child: Image.asset(cupertinoActivityIndicator,
                          width: 45, height: 45),
                    ),
                  if (homeProvider.state is HomeInitial)
                    SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Text(homeProvider.fact?.text ?? '',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 30,
                                fontFamily: 'OpenSans',
                                color: Colors.white,
                              )),
                          Center(
                              child: homeProvider.image ??
                                  const SizedBox.shrink()),
                        ],
                      ),
                    ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: ButtonBar(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          MaterialButton(
                              height: 40.0,
                              child: const Text('Fact history'),
                              color: Colors.blue,
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/facts_list')),
                          MaterialButton(
                            height: 40.0,
                            child: const Text('Another fact!'),
                            color: Colors.red,
                            onPressed: () {
                              homeProvider.add(LoadFactEvent());
                            },
                          ),
                        ],
                      ))
                ],
              ));
        },
      ),
    );
  }
}
