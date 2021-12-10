import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:fml/pages/MemberFieldBloc.dart';
import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  final int memberIndex;
  final MemberFieldBloc memberField;

  final VoidCallback onRemoveMember;
  final VoidCallback onAddHobby;

  const MemberCard({
    Key? key,
    required this.memberIndex,
    required this.memberField,
    required this.onRemoveMember,
    required this.onAddHobby,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 255, 255, 255),
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Member #${memberIndex + 1}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: onRemoveMember,
                ),
              ],
            ),
            // TextFieldBlocBuilder(
            //   textFieldBloc: memberField.firstName,
            //   decoration: InputDecoration(
            //     labelText: 'First Name',
            //   ),
            // ),
            TextFieldBlocBuilder(
              textFieldBloc: memberField.lastName,
              decoration: InputDecoration(
                labelText: 'GCN NUMBER',
              ),
            ),
            BlocBuilder<ListFieldBloc<TextFieldBloc, dynamic>,
                ListFieldBlocState<TextFieldBloc, dynamic>>(
              bloc: memberField.hobbies,
              builder: (context, state) {
                if (state.fieldBlocs.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.fieldBlocs.length,
                    itemBuilder: (context, i) {
                      final hobbyFieldBloc = state.fieldBlocs[i];
                      return Card(
                        color: Colors.blue[50],
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextFieldBlocBuilder(
                                    textFieldBloc: hobbyFieldBloc,
                                    decoration: InputDecoration(
                                      labelText: 'Hobby #${i + 1}',
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () =>
                                      memberField.hobbies.removeFieldBlocAt(i),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextFieldBlocBuilder(
                                    textFieldBloc: hobbyFieldBloc,
                                    decoration: InputDecoration(
                                      labelText: 'Hobby #${i + 1}',
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () =>
                                      memberField.hobbies.removeFieldBlocAt(i),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
                return Container();
              },
            ),
            TextButton(
              onPressed: onAddHobby,
              child: Text(
                'ADD HOBBY',
                style: TextStyle(color: Colors.blue[900]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
