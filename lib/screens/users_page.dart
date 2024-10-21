import 'package:fetch_bloc_cubit/cubits/users_cubits.dart';
import 'package:fetch_bloc_cubit/cubits/users_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Users"),
      ),
      body: BlocBuilder<UsersCubits, UsersState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(
              child: ElevatedButton(
                onPressed: () => context.read<UsersCubits>().fetchUsers(),
                child: const Text("Fetch 🚀"),
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (users) {
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                    leading: Text(users[index].id.toString()),
                      title: Text(users[index].name),
                      subtitle: Text(users[index].email),
                      trailing: Text(users[index].phone),
                    );
                  });
            },
            error: ((err) => Center(
                  child: Text(err),
                )),
          );
        },
      ),
    );
  }
}
