import 'package:appscrip/application/theme/theme_bloc.dart';
import 'package:appscrip/application/user/user_bloc.dart';
import 'package:appscrip/core/colors/colors.dart';
import 'package:appscrip/core/constants.dart';
import 'package:appscrip/presentation/home/details_screen.dart';
import 'package:appscrip/presentation/home/widgets/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<UserBloc>(context).add(const UserEvent.initialize());
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<UserBloc>(context).add(const UserEvent.initialize());
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(color: kgreen),
        ),
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return Switch(
                activeColor: kgreen,
                value:
                    context.read<ThemeBloc>().state.themeMode == ThemeMode.dark,
                onChanged: (_) {
                  state.themeMode == ThemeMode.dark;
                  context.read<ThemeBloc>().add(const ToggleTheme());
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          kHeight,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
              padding: EdgeInsetsDirectional.fromSTEB(6, 16, 6, 16),
              placeholder: 'Search user',
              placeholderStyle: const TextStyle(
                color: Colors.green,
              ),
              prefixIcon: const Icon(
                size: 30,
                Icons.search,
                color: Colors.green,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              onChanged: (query) {
                BlocProvider.of<UserBloc>(context)
                    .add(UserEvent.searchUser(query));
              },
            ),
          ),
          kHeight,
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.userResultData.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else if (state.isError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: kRed,
                      behavior: SnackBarBehavior.floating,
                      content: Text('Check your network connection'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                });

                return const Center(
                  child: Text(
                    'Error',
                    style: TextStyle(color: kgreen, fontSize: 20),
                  ),
                );
              } else {
                final users = state.filteredUserResultData;
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => _onRefresh(context),
                    child: users.isEmpty
                        ? const Center(
                            child: Text(
                            'No User found',
                            style: TextStyle(color: kgreen, fontSize: 20),
                          ))
                        : ListView.builder(
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              final user = users[index];
                              return UserCard(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (ctx) {
                                    return CustomerDetails(
                                      name: user.name ?? '',
                                      phone: user.phone ?? '',
                                      email: user.email ?? '',
                                      username: user.username ?? '',
                                      website: user.website ?? '',
                                      address:
                                          '${user.address!.street},${user.address!.suite},${user.address!.city}',
                                    );
                                  }));
                                },
                                name: '${user.name}',
                                email: '${user.email}',
                                index: '${index + 1}',
                              );
                            },
                          ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
