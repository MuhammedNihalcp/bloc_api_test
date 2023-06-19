import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/home_bloc_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Bloc Test'),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeBlocBloc, HomeBlocState>(
        builder: (context, state) {
          if (state.isApiFetching) {
            return const SafeArea(
                child: Center(
              child: CircularProgressIndicator(),
            ));
          }
          return SafeArea(
            child: Center(
              child: Text(state.apiResult ?? 'no result'),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<HomeBlocBloc>().add(FetchApiEvent());
        },
        label: const Text('Api Fetch'),
      ),
    );
  }
}
