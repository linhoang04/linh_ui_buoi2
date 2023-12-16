import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rebuildbloc/bloc/screan_bloc.dart';
import 'package:rebuildbloc/event/add_screan_event.dart';
import 'package:rebuildbloc/event/delete_screan_event.dart';
import 'package:rebuildbloc/model/todo.dart';

class BlocUi extends StatefulWidget {
  const BlocUi({super.key});

  @override
  State<BlocUi> createState() => _BlocUiState();
}

class _BlocUiState extends State<BlocUi> {
  @override
  Widget build(BuildContext context) {
    var textEditor = TextEditingController();
    var bloc = Provider.of<ScreanBloc>(context);
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      controller: textEditor,
                      decoration: InputDecoration(
                          labelText: 'Add to cart',
                          hintText: 'find your product',
                          hintStyle: TextStyle(fontSize: 13)),
                    ),
                  ),
                  ElevatedButton.icon(
                    label: Text('Add'),
                    onPressed: () {
                      bloc.even.add(AddScreanEvent(textEditor.text));
                    },
                    icon: Icon(Icons.add),
                  )
                ],
              ),
              SizedBox(
                height: 1,
              ),
              Expanded(
                child: Consumer<ScreanBloc>(
                  builder: (context, bloc, child) {
                    return StreamBuilder<List<Todo>>(
                      stream: bloc.listUser,
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.active:
                            return ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    title: Text(snapshot.data![index].content),
                                    trailing: GestureDetector(
                                      onTap: () {
                                        bloc.even.add(DeleteScreanEvents(
                                            snapshot.data![index]));
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ));
                              },
                            );
                          case ConnectionState.waiting:
                            return Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('Empty')],
                            );
                          case ConnectionState.none:
                          default:
                            return Center(
                              child: Container(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(),
                              ),
                            );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
