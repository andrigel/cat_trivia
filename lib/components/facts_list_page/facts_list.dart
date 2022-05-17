import 'package:cat_trivia/components/facts_list_page/widgets/fact_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_gifs/loading_gifs.dart';

import 'bloc/facts_list_bloc.dart';

class FactsList extends StatelessWidget {
  const FactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FactsListBloc>(
      create: (context) => FactsListBloc()..add(LoadFactsEvent()),
      child: BlocBuilder<FactsListBloc, FactsListState>(
        builder: (context, state) {
          FactsListBloc factsListProvider =
              BlocProvider.of<FactsListBloc>(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Favorite facts"),
              centerTitle: true,
              backgroundColor: const Color(0xFF509f93),
              actions: [
                state is FactsListInitial
                    ? const SizedBox.shrink()
                    : Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Center(
                        child: Text(
                            'Facts count:\n' +
                                factsListProvider.factsBox!.length.toString(),
                            textAlign: TextAlign.center,
                          ),
                      ),
                    )
              ],
            ),
            backgroundColor: const Color(0xFF37474f),
            body: state is FactsListInitial
                ? Center(
                    child: Image.asset(cupertinoActivityIndicator,
                        width: 45, height: 45))
                : ListView.builder(
                    itemBuilder: (context, i) => FactCard(
                        fact: factsListProvider.factsBox!
                            .get(factsListProvider.factsBox!.length - 1 - i)),
                    itemCount: factsListProvider.factsBox!.length,
                  ),
          );
        },
      ),
    );
  }
}
